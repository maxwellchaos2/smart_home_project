import 'package:common/common.dart';
import 'package:devices/src/application/application.dart';
import 'package:devices/src/domain/entities/entities.dart';

class ControllerDeviceEditScreen extends StatefulWidget
    with ScreenMixin
    implements ScreenWrapper {
  const ControllerDeviceEditScreen({
    super.key,
    this.device,
  });

  final DeviceEntity? device;

  @override
  Widget wrappedScreen(BuildContext context) {
    final projectId = context.read<ProjectIdController>().value!;
    return MultiProvider(
      providers: [
        if (device case DeviceEntity device) ...[
          UpdateDeviceScope(deviceId: device.id, projectId: projectId),
          DeleteDeviceScope(deviceId: device.id, projectId: projectId),
        ] else
          CreateDeviceScope(
            projectId: projectId,
          ),
      ],
      child: this,
    );
  }

  @override
  State<ControllerDeviceEditScreen> createState() =>
      _ControllerDeviceEditScreenState();
}

class _ControllerDeviceEditScreenState
    extends StateWithListeners<ControllerDeviceEditScreen> {
  late final TextEditingController _nameController;
  late final ValueNotifier<DeviceType> _deviceTypeController;
  late final ValueNotifier<InOutType> _inOutTypeController;
  late final ValueNotifier<String?> _inOutIdController;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController(text: widget.device?.name);
    _inOutIdController = ValueNotifier(widget.device?.providerDeviceId);

    _inOutTypeController = ValueNotifier(
      (widget.device?.providerDeviceId?.startsWith('I') ?? false)
          ? InOutType.in_
          : InOutType.out,
    );

    _deviceTypeController =
        ValueNotifier(widget.device?.type ?? DeviceType.light);
  }

  void _submit() {
    final name = _nameController.textOrNull!;
    final roomId = widget.device?.roomId;
    final floorId = widget.device?.floorId;
    final DeviceInputEntity input = switch (_inOutTypeController.value) {
      InOutType.in_ => DeviceInputEntity(
          isHidden: false,
          providerDeviceId: _inOutIdController.value,
          providerType: DeviceProviderType.logoSiemens,
          type: _deviceTypeController.value,
          name: name,
          capabilities: [
            if (widget.device != null)
              ...widget.device!.capabilities
            else
              DeviceCapabilityEntity.onOff(
                state: DeviceCapabilityStateEntity.on(value: false),
                parameters: null,
              ),
          ],
          properties: [],
          roomId: roomId,
          floorId: floorId,
          customData: widget.device?.customData,
        ),
      InOutType.out => DeviceInputEntity(
          isHidden: false,
          name: name,
          providerDeviceId: _inOutIdController.value,
          providerType: DeviceProviderType.logoSiemens,
          type: _deviceTypeController.value,
          capabilities: [
            if (widget.device != null)
              ...widget.device!.capabilities
            else
              DeviceCapabilityEntity.onOff(
                state: DeviceCapabilityStateEntity.on(value: false),
                parameters: null,
              ),
          ],
          properties: [],
          roomId: roomId,
          floorId: floorId,
          customData: widget.device?.customData,
        ),
    };

    if (widget.device case DeviceEntity _) {
      UpdateDeviceScope.of(context).update(input: input);
      return;
    }
    CreateDeviceScope.of(context).create(input: input);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _inOutTypeController.dispose();
    _inOutIdController.dispose();
    super.dispose();
  }

  @override
  List<SingleChildWidget> get listeners => [
        if (widget.device case DeviceEntity _) ...[
          UpdateDeviceBlocListener(
            listener: (context, state) => state.mapOrNull(
              failure: (state) =>
                  context.app.showErrorDialog(message: state.failure.message),
              success: (state) => context.navigator.popForced(),
            ),
          ),
          DeleteDeviceBlocListener(
            listener: (context, state) => state.mapOrNull(
              failure: (state) =>
                  context.app.showErrorDialog(message: state.failure.message),
              success: (state) => context.navigator.popForced(),
            ),
          ),
        ] else
          CreateDeviceBlocListener(
            listener: (context, state) => state.mapOrNull(
              failure: (state) =>
                  context.app.showErrorDialog(message: state.failure.message),
              success: (state) => context.navigator.popForced(),
            ),
          ),
      ];

  @override
  Widget buildChild(BuildContext context) {
    return FocusWatcher(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            (widget.device != null)
                ? 'Редактирование устройства'
                : 'Создание устройства',
          ),
          actions: [
            if (widget.device case DeviceEntity _) ...[
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  DeleteDeviceScope.of(context).delete();
                },
              ),
            ],
          ],
        ),
        floatingActionButton: Builder(builder: (context) {
          final isLoading = switch (widget.device) {
            null => CreateDeviceScope.of(context, listen: true).state.isLoading,
            _ => UpdateDeviceScope.of(context, listen: true).state.isLoading ||
                DeleteDeviceScope.of(context, listen: true).state.isLoading,
          };
          return FloatingActionButton(
            onPressed: _submit,
            child: isLoading
                ? const CircularProgressIndicator()
                : const Icon(Icons.save),
          );
        }),
        body: SafeArea(
          child: ListView(
            padding: AppPaddings.horizontal.copyWith(top: 20),
            children: [
              Text(
                'Название устройства',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ).reverseMerge(context.textTheme.titleMedium),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _nameController,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  hintText: 'Введите название устройства',
                ),
              ),
              const SizedBox(height: 20),
              // Text('Тип'),
              // AnimatedBuilder(
              //   animation: _inOutTypeController,
              //   builder: (context, _) {
              //     return Wrap(
              //       spacing: 10,
              //       runSpacing: 10,
              //       children: [
              //         ChoiceChip(
              //           label: Text('Вход'),
              //           selected: _inOutTypeController.value == InOutType.in_,
              //           onSelected: (value) {
              //             _inOutTypeController.value = InOutType.in_;
              //           },
              //         ),
              //         ChoiceChip(
              //           label: Text('Выход'),
              //           selected: _inOutTypeController.value == InOutType.out,
              //           onSelected: (value) {
              //             _inOutTypeController.value = InOutType.out;
              //           },
              //         ),
              //       ],
              //     );
              //   },
              // ),
              Text(
                'Тип устройства',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ).reverseMerge(context.textTheme.titleMedium),
              ),
              const SizedBox(height: 10),
              ValueListenableBuilder<DeviceType>(
                valueListenable: _deviceTypeController,
                builder: (context, value, child) {
                  return PopupMenuButton<DeviceType>(
                    constraints: BoxConstraints(
                      maxHeight: 400,
                      minWidth: 100,
                    ),
                    itemBuilder: (context) => [
                      for (final type in [
                        DeviceType.light,
                        DeviceType.lightCeiling,
                        DeviceType.lightLamp,
                        DeviceType.lightStrip,
                        DeviceType.socket,
                        DeviceType.openable,
                        DeviceType.openableCurtain,
                        DeviceType.openableValve,
                        DeviceType.ventilation,
                        DeviceType.ventilationFan,
                        DeviceType.thermostat,
                        DeviceType.thermostatAc,
                        DeviceType.other,
                      ])
                        PopupMenuItem(
                          value: type,
                          child: Text(
                            getNameByType(type: type),
                            textAlign: TextAlign.center,
                          ),
                        ),
                    ],
                    onSelected: (value) {
                      _deviceTypeController.value = value;
                    },
                    child: InputDecorator(
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.arrow_drop_down),
                      ),
                      child: Text(
                        getNameByType(type: value),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              Text(
                'Выход',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ).reverseMerge(context.textTheme.titleMedium),
              ),
              const SizedBox(height: 10),
              ValueListenableBuilder<String?>(
                valueListenable: _inOutIdController,
                builder: (context, value, child) {
                  final devices = DevicesScope.of(context, listen: true)
                      .state
                      .data!
                      .where(
                        (e) => e.providerType == DeviceProviderType.logoSiemens,
                      );
                  return PopupMenuButton<String>(
                    constraints: BoxConstraints(
                      maxHeight: 400,
                      minWidth: 100,
                    ),
                    itemBuilder: (context) => List.generate(
                      20,
                      (index) => PopupMenuItem(
                        value: 'Q${index + 1}',
                        enabled: !devices.any((element) =>
                            element.providerDeviceId == 'Q${index + 1}'),
                        child: Text(
                          'Q${index + 1}',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    onSelected: (value) {
                      _inOutIdController.value = value;
                    },
                    child: InputDecorator(
                      isEmpty: value == null,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.arrow_drop_down),
                        hintText: 'Выберите выход',
                      ),
                      child: value == null
                          ? null
                          : Text(
                              value,
                            ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              // ValueListenableBuilder<String?>(
              //     valueListenable: _inOutIdController,
              //     builder: (context, value, child) {
              //       return value == null
              //           ? const SizedBox()
              //           : Align(
              //               alignment: Alignment.centerRight,
              //               child: DevicesScope(
              //                 projectId:
              //                     context.read<ProjectIdController>().value!,
              //                 child: AppFormButton.secondary(
              //                   onPressed: () {
              //                     // TODO
              //                     DevicesScope.of(context)
              //                         .updateDevicesCapabilities(
              //                       inputs: [
              //                         (
              //                           device: DeviceEntity(
              //                             isHidden: false,
              //                             providerDeviceId: null,
              //                             providerType:
              //                                 DeviceProviderType.logoSiemens,
              //                             id: -1,
              //                             outputId: value,
              //                             name: 'Test',
              //                             type: DeviceType.other,
              //                             capabilities: [],
              //                             properties: [],
              //                             inputId: null,
              //                             roomId: -1,
              //                             floorId: -1,
              //                             createdAt: DateTime.now(),
              //                             updatedAt: DateTime.now(),
              //                             projectId: -1,
              //                           ),
              //                           input: [
              //                             DeviceCapabilityEntity.onOff(
              //                               state:
              //                                   DeviceCapabilityStateEntity.on(
              //                                       value: null),
              //                               parameters: null,
              //                             ),
              //                           ],
              //                         ),
              //                       ],
              //                     );
              //                   },
              //                   style: ElevatedButton.styleFrom(
              //                     minimumSize: Size(50, 40),
              //                     maximumSize: Size(100, 40),
              //                   ),
              //                   child: Text('Test'),
              //                 ),
              //               ),
              //             );
              //     }),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

enum InOutType {
  in_,
  out,
}
