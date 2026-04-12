import 'package:auth_token/auth_token.dart';
import 'package:common/common.dart';
import 'package:devices/devices.dart';
import 'package:wifi_devices/src/application/application.dart';

class AddWifiDevicesScreen extends StatefulWidget
    with ScreenMixin
    implements ScreenWrapper {
  const AddWifiDevicesScreen({super.key});

  @override
  Widget wrappedScreen(BuildContext context) {
    return MultiProvider(
      providers: [
        CreateDeviceScope(
          projectId: context.read<ProjectIdController>().value!,
        ),
        SignInDeviceScope(),
        WifiNameScope(),
      ],
      child: this,
    );
  }

  @override
  State<AddWifiDevicesScreen> createState() => _AddWifiDevicesScreenState();
}

class _AddWifiDevicesScreenState
    extends StateWithListeners<AddWifiDevicesScreen> {
  final BLEDeviceController _bleController = BLEDeviceController();
  late final TextEditingController _wifiSsidController;
  late final TextEditingController _wifiPasswordController;

  bool wifiSendingInProgress = false;

  bool authTokenSendingInProgress = false;

  @override
  void initState() {
    super.initState();
    _bleController.init();
    _wifiSsidController = TextEditingController();
    _wifiPasswordController = TextEditingController();

    bool isConnected = false;
    _bleController.addListener(() {
      if (isConnected) return;
      if (_bleController.isConnected) {
        isConnected = true;
        WifiNameScope.of(context).fetch();
      }
    });
  }

  void _sendWifiConfig() async {
    final ssid = _wifiSsidController.text;
    final password = _wifiPasswordController.text;
    if (ssid.isEmpty || password.isEmpty) return;

    wifiSendingInProgress = true;
    setState(() {});
    final result = await _bleController.sendWifiConfig(
      ssid: ssid,
      password: password,
    );
    wifiSendingInProgress = false;
    setState(() {});

    if (result == null) return;
    if (result.deviceType == BLEDeviceType.smartHub) {
      CreateDeviceScope.of(context).create(
        input: DeviceInputEntity(
          name: "Умный хаб",
          providerDeviceId: result.deviceIp,
          providerType: DeviceProviderType.wifi,
          type: DeviceType.smartHub,
          roomId: null,
          isHidden: false,
          capabilities: const [],
          properties: const [],
          floorId: null,
          customData: null,
        ),
      );
    } else if (result.deviceType == BLEDeviceType.controlBoxHub) {
      CreateDeviceScope.of(context).create(
        input: DeviceInputEntity(
          name: "Щит управления (хаб)",
          providerDeviceId: result.deviceIp,
          providerType: DeviceProviderType.wifi,
          type: DeviceType.controlBoxHub,
          roomId: null,
          isHidden: false,
          capabilities: const [],
          properties: const [],
          floorId: null,
          customData: null,
        ),
      );
    }
  }

  void _sendAuthToken(String token, int deviceId, int projectId) async {
    authTokenSendingInProgress = true;
    setState(() {});
    await _bleController.sendAuthToken(
      token: token,
      deviceId: deviceId,
      projectId: projectId,
    );
    authTokenSendingInProgress = false;
    // setState(() {});

    // Можно закрыть экран
    final scaffoldContext = context.mainScaffoldKey.currentState!.context;
    context.navigator.change(
      (pages) => [
        pages.first,
      ],
    );
    await Future.delayed(
      const Duration(milliseconds: 300),
    );
    final device = CreateDeviceScope.of(context)
        .state
        .mapOrNull(success: (state) => state.data)!;
    DeviceModalSheet(
      device: device,
      heroTag: 'device_${device.id}',
    ).show(scaffoldContext);
  }

  @override
  Widget buildChild(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Подключение Wi-Fi устройств")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: AnimatedBuilder(
            animation: _bleController,
            builder: (context, _) {
              final wifiNameState =
                  WifiNameScope.of(context, listen: true).state;
              if (_bleController.isConnected == false ||
                  wifiNameState.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              final isConnectedProgress = authTokenSendingInProgress ||
                  CreateDeviceScope.of(context).state.isLoading ||
                  SignInDeviceScope.of(context).state.isLoading;

              if (isConnectedProgress) {
                return Column(
                  children: [
                    const Text("Подключение устройства..."),
                    const SizedBox(height: 20),
                    const Center(child: CircularProgressIndicator()),
                  ],
                );
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Введите данные вашей Wi-Fi сети, к которой будет подключено устройство",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _wifiSsidController,
                    keyboardType: TextInputType.text,
                    autofillHints: const [
                      'ssid',
                    ],
                    decoration: InputDecoration(
                      hintText: 'Имя Wi-Fi сети',
                    ),
                  ),
                  const SizedBox(height: 12),
                  PasswordField(
                    controller: _wifiPasswordController,
                  ),
                  const SizedBox(height: 20),
                  AppFormButton.primary(
                    isLoading: wifiSendingInProgress,
                    onPressed: _sendWifiConfig,
                    child: const Text("Подключить устройство"),
                  ),
                  const SizedBox(height: 20),
                ],
              );
            }),
      ),
    );
  }

  @override
  List<SingleChildWidget> get listeners => [
        WifiNameBlocListener(
          listener: (context, state) => state.mapOrNull(success: (state) {
            // Wi-Fi имя получено
            _wifiSsidController.text = state.data ?? '';
            return null;
          }),
        ),
        CreateDeviceBlocListener(
          listener: (context, state) => state.mapOrNull(success: (state) {
            // Устройство создано в облаке
            // Можно отправить команду provision на устройство
            SignInDeviceScope.of(context).signIn(
              input: SignInDeviceInputEntity(
                deviceId: state.data.id,
              ),
            );
            return null;
          }),
        ),
        SignInDeviceBlocListener(
          listener: (context, state) => state.mapOrNull(success: (state) async {
            final device = CreateDeviceScope.of(context)
                .state
                .mapOrNull(success: (state) => state.data)!;
            return _sendAuthToken(
                state.data.accessToken, device.id, device.projectId);
          }),
        ),
      ];
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required TextEditingController controller,
  }) : _controller = controller;

  final TextEditingController _controller;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget._controller,
      obscureText: _obscureText,
      keyboardType: TextInputType.visiblePassword,
      autofillHints: const [
        AutofillHints.password,
      ],
      decoration: InputDecoration(
        hintText: 'Пароль',
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: AppColors.grey90,
          ),
          onPressed: () => setState(() => _obscureText = !_obscureText),
        ),
      ),
    );
  }
}




  // void createLedDevice() {
  //   CreateDeviceScope.of(context).create(
  //     input: DeviceInputEntity(
  //       name: "Умная лампа",
  //       providerDeviceId: '----',
  //       providerType: DeviceProviderType.wifi,
  //       type: DeviceType.lightLamp,
  //       roomId: null,
  //       inputId: null,
  //       outputId: null,
  //       isHidden: false,
  //       capabilities: [
  //         DeviceCapabilityEntity.onOff(
  //           state: DeviceCapabilityStateEntity.on(value: false),
  //           parameters: DeviceCapabilityParametersEntity.onOff(
  //             split: false,
  //           ),
  //         ),
  //         DeviceCapabilityEntity.colorSetting(
  //           state: DeviceCapabilityStateEntity.rgb(value: 16711680),
  //           parameters: DeviceCapabilityParametersEntity.colorSetting(
  //             colorModel: DeviceColorModel.rgb,
  //             temperatureK: (
  //               min: 2000,
  //               max: 9000,
  //             ),
  //             colorScene: (
  //               scenes: [
  //                 (id: 'Радуга'),
  //                 (id: 'Бегущие огни'),
  //                 (id: 'Конфетти'),
  //                 (id: 'Плазма'),
  //               ],
  //             ),
  //           ),
  //         ),
  //         DeviceCapabilityEntity.float(
  //           state: DeviceCapabilityStateEntity.brightness(
  //             value: 100,
  //           ),
  //           parameters: DeviceCapabilityParametersEntity.brightness(
  //             unit: DeviceUnit.percent,
  //             range: (
  //               min: 0,
  //               max: 100,
  //               precision: 100,
  //             ),
  //           ),
  //         ),
  //       ],
  //       properties: const [],
  //       floorId: null,
  //     ),
  //   );
  // }