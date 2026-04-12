import 'package:common/common.dart';
import 'package:devices/src/application/application.dart';
import 'package:devices/src/domain/entities/entities.dart';
import 'package:rooms/rooms.dart';

class DeviceEditScreen extends StatefulWidget
    with ScreenMixin
    implements ScreenWrapper {
  const DeviceEditScreen({
    super.key,
    required this.device,
  });

  final DeviceEntity device;

  @override
  Widget wrappedScreen(BuildContext context) {
    final projectId = context.read<ProjectIdController>().value!;
    return MultiProvider(
      providers: [
        UpdateDeviceScope(deviceId: device.id, projectId: projectId),
        DeleteDeviceScope(deviceId: device.id, projectId: projectId),
      ],
      child: this,
    );
  }

  @override
  State<DeviceEditScreen> createState() => _DeviceEditScreenState();
}

class _DeviceEditScreenState extends StateWithListeners<DeviceEditScreen>
    with HikvisionCustomDataEditMixin, HikvisionCameraCustomDataEditMixin {
  late final TextEditingController _nameController;
  late final ValueNotifier<int?> _roomIdController;
  late final ValueNotifier<DeviceType> _typeController;
  late final ValueNotifier<bool> _isHiddenController;
  late bool isValid = true;
  late final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.device.name);
    _roomIdController = ValueNotifier(widget.device.roomId);
    _typeController = ValueNotifier(widget.device.type);
    _isHiddenController = ValueNotifier(widget.device.isHidden);
  }

  void _submit() {
    final name = _nameController.textOrNull!;
    Map<String, Object?>? customData;
    if (widget.device.type == DeviceType.doorWithLock &&
        widget.device.providerType == DeviceProviderType.hikvision) {
      customData = {
        ...?widget.device.customData,
        ...getHikvisionCustomData(),
      };
    } else if (widget.device.type == DeviceType.cameraHub &&
        widget.device.providerType == DeviceProviderType.hikvision) {
      customData = {
        ...?widget.device.customData,
        ...getHikvisionCustomData(),
      };
    }
    //  else if (widget.device.type == DeviceType.camera &&
    //     widget.device.providerType == DeviceProviderType.hikvision) {
    //   customData = {
    //     ...?widget.device.customData,
    //     ...getHikvisionCameraCustomData(),
    //   };
    // }
    final DeviceInputEntity input = DeviceInputEntity(
      providerDeviceId: widget.device.providerDeviceId,
      providerType: widget.device.providerType,
      type: _typeController.value,
      name: name,
      isHidden: _isHiddenController.value,
      capabilities: widget.device.capabilities,
      properties: widget.device.properties,
      roomId: _roomIdController.value,
      floorId: widget.device.floorId,
      customData: customData ?? widget.device.customData,
    );

    UpdateDeviceScope.of(context).update(input: input);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _roomIdController.dispose();
    disposeHikvision();
    disposeCameraHikvision();
    super.dispose();
  }

  bool get isChanged {
    final nameChanged = _nameController.text.trim() != widget.device.name;
    final roomChanged = _roomIdController.value != widget.device.roomId;
    final hiddenChanged = _isHiddenController.value != widget.device.isHidden;
    return nameChanged || roomChanged || hiddenChanged;
  }

  @override
  List<SingleChildWidget> get listeners => [
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
            success: (state) => context.rootContext.navigator.popForced(),
          ),
        ),
      ];

  @override
  Widget buildChild(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      canPop: !isChanged,
      onPopInvokedWithResult: (canPop, result) {
        if (!canPop && isChanged) {
          showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Есть несохранённые изменения'),
              content: const Text(
                  'Вы уверены, что хотите выйти без сохранения изменений?'),
              actions: [
                TextButton(
                  onPressed: () {
                    context.navigator.popForced(false);
                  },
                  child: const Text('Отмена'),
                ),
                TextButton(
                  onPressed: () {
                    context.navigator.popForced(true);
                  },
                  child: const Text('Выйти'),
                ),
              ],
            ),
          ).then((value) {
            if (value == true) {
              context.navigator.popForced(result);
            }
          });
        }
        //  else {
        //   context.navigator.popForced(result);
        // }
      },
      onChanged: () {
        final isValidate = _formKey.currentState?.validate() ?? false;
        setState(() {
          isValid = isValidate;
        });
      },
      child: FocusWatcher(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Редактирование устройства',
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () async {
                  final result = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Удалить устройство?'),
                      content: const Text(
                          'Вы уверены, что хотите удалить это устройство?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            context.navigator.popForced(false);
                          },
                          child: const Text('Отмена'),
                        ),
                        TextButton(
                          onPressed: () {
                            context.navigator.popForced(true);
                          },
                          child: const Text('Удалить'),
                        ),
                      ],
                    ),
                  );
                  if (result == true) {
                    DeleteDeviceScope.of(context).delete();
                  }
                },
              ),
            ],
          ),
          floatingActionButton: Builder(builder: (context) {
            final isLoading =
                UpdateDeviceScope.of(context, listen: true).state.isLoading ||
                    DeleteDeviceScope.of(context, listen: true).state.isLoading;
            return FloatingActionButton(
              onPressed: isValid ? _submit : null,
              backgroundColor: isValid
                  ? context.theme.colorScheme.primary
                  : context.theme.colorScheme.surface,
              child: isLoading
                  ? const CircularProgressIndicator()
                  : const Icon(Icons.save),
            );
          }),
          body: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 400),
              child: SafeArea(
                top: false,
                child: ListView(
                  controller: ModalScrollController.of(context),
                  padding: AppPaddings.horizontal.copyWith(top: 20),
                  children: [
                    Text(
                      'Название устройства',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withValues(alpha: .7),
                      ).reverseMerge(context.textTheme.labelLarge),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _nameController,
                      textCapitalization: TextCapitalization.sentences,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Введите название устройства';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Введите название устройства',
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Комната',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withValues(alpha: .7),
                      ).reverseMerge(context.textTheme.labelLarge),
                    ),
                    const SizedBox(height: 5),
                    ValueListenableBuilder<int?>(
                      valueListenable: _roomIdController,
                      builder: (context, value, child) {
                        final rooms =
                            RoomsScope.of(context, listen: true).state.data!;
                        return Wrap(
                          spacing: 8,
                          children: [
                            AppChoiceChip(
                              isSelected: value == null,
                              label: const Text('Без комнаты'),
                              onSelected: (selected) {
                                _roomIdController.value =
                                    selected ? null : value;
                              },
                            ),
                            for (final room in rooms)
                              AppChoiceChip(
                                label: Text(room.name),
                                isSelected: room.id == value,
                                onSelected: (selected) {
                                  _roomIdController.value =
                                      selected ? room.id : null;
                                },
                              ),
                            AppChoiceChip(
                              isSelected: false,
                              label: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.edit,
                                    size: 16,
                                    color: context.theme.colorScheme.onSurface
                                        .withValues(alpha: .7),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Изменить',
                                    style: TextStyle(
                                      color:
                                          context.theme.colorScheme.onSurface,
                                    ),
                                  ),
                                ],
                              ),
                              onSelected: (selected) {
                                context.navigator.pushRoute('/rooms');
                              },
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Тип устройства',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withValues(alpha: .7),
                      ).reverseMerge(context.textTheme.labelLarge),
                    ),
                    const SizedBox(height: 5),
                    ValueListenableBuilder<DeviceType>(
                      valueListenable: _typeController,
                      builder: (context, value, child) {
                        return Wrap(
                          spacing: 8,
                          children: [
                            AppChoiceChip(
                              label: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  getIconsByDeviceType(
                                          type: _typeController.value)
                                      .icon
                                      .svg(
                                        width: 20,
                                        height: 20,
                                      ),
                                  const SizedBox(width: 8),
                                  Text(getNameByType(
                                      type: _typeController.value)),
                                ],
                              ),
                              isSelected: true,
                              onSelected: (_) {},
                            ),
                            AppChoiceChip(
                              isSelected: false,
                              label: Text(
                                'Выбрать',
                                style: TextStyle(
                                  color: context.theme.colorScheme.onSurface,
                                ),
                              ),
                              onSelected: (selected) async {
                                final result = await ChoiceDeviceTypeModal(
                                  currentType: _typeController.value,
                                ).show(context);
                                if (result != null) {
                                  _typeController.value = result;
                                }
                              },
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Отображение',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withValues(alpha: .7),
                      ).reverseMerge(context.textTheme.labelLarge),
                    ),
                    const SizedBox(height: 8),
                    ValueListenableBuilder(
                      valueListenable: _isHiddenController,
                      builder: (context, value, child) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: context.theme.scaffoldBackgroundColor,
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(51, 0, 0, 0),
                                offset: Offset(0, 1),
                                blurRadius: 3,
                                spreadRadius: 0,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Скрыть из списка устройств',
                                  style: context.textTheme.bodyMedium,
                                ),
                              ),
                              Switch(
                                value: value,
                                onChanged: (value) {
                                  _isHiddenController.value = value;
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    if (widget.device.type == DeviceType.doorWithLock &&
                        widget.device.providerType ==
                            DeviceProviderType.hikvision)
                      buildHikvisionCustomDataFields(context)
                    else if (widget.device.type == DeviceType.cameraHub &&
                        widget.device.providerType ==
                            DeviceProviderType.hikvision)
                      buildHikvisionCustomDataFields(context)
                    // else if (widget.device.type == DeviceType.camera &&
                    //     widget.device.providerType ==
                    //         DeviceProviderType.hikvision)
                    //   buildHikvisionCameraCustomDataFields(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ChoiceDeviceTypeModal extends AppModalBottomSheet<DeviceType> {
  const ChoiceDeviceTypeModal({
    super.key,
    required this.currentType,
  }) : super(
          padding: EdgeInsets.zero,
          bottomSafeArea: false,
        );

  final DeviceType currentType;
  @override
  Widget buildChild(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => ValueNotifier<DeviceType>(currentType),
        child: Builder(builder: (context) {
          final controller = context.watch<ValueNotifier<DeviceType>>();
          return SingleChildScrollView(
            controller: ModalScrollController.of(context),
            padding: AppPaddings.horizontal.copyWith(top: 20, bottom: 30),
            child: Wrap(
              spacing: 8,
              children: [
                for (final type in DeviceType.values)
                  AppChoiceChip(
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        getIconsByDeviceType(type: type).icon.svg(
                              width: 20,
                              height: 20,
                            ),
                        const SizedBox(width: 8),
                        Text(getNameByType(type: type)),
                      ],
                    ),
                    isSelected: type == controller.value,
                    onSelected: (selected) {
                      controller.value = type;
                      context.navigator.popForced(type);
                    },
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

mixin HikvisionCustomDataEditMixin implements State<DeviceEditScreen> {
  late final TextEditingController ipController = TextEditingController(
      text: (widget.device.customData?['ip'] ?? '') as String);
  late final TextEditingController portController = TextEditingController(
      text: (widget.device.customData?['port'] ?? '') as String);

  late final TextEditingController rtspPortController = TextEditingController(
      text: (widget.device.customData?['rtspPort'] ?? '') as String);

  late final TextEditingController usernameController = TextEditingController(
      text: (widget.device.customData?['username'] ?? '') as String);
  late final TextEditingController passwordController = TextEditingController(
      text: (widget.device.customData?['password'] ?? '') as String);

  Widget buildHikvisionCustomDataFields(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          'Настройки подключения Hikvision',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white.withValues(alpha: .7),
          ).reverseMerge(context.textTheme.labelLarge),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: ipController,
          decoration: const InputDecoration(
            labelText: 'IP-адрес',
            hintText: 'Введите IP-адрес устройства',
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: portController,
          decoration: const InputDecoration(
            labelText: 'Порт',
            hintText: 'Введите порт устройства',
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: rtspPortController,
          decoration: const InputDecoration(
            labelText: 'RTSP Порт',
            hintText: 'Введите RTSP порт устройства',
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: usernameController,
          decoration: const InputDecoration(
            labelText: 'Имя пользователя',
            hintText: 'Введите имя пользователя',
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: passwordController,
          decoration: const InputDecoration(
            labelText: 'Пароль',
            hintText: 'Введите пароль',
          ),
          obscureText: true,
        ),
      ],
    );
  }

  Map<String, Object?> getHikvisionCustomData() {
    return {
      'ip': ipController.textOrNull,
      'port': portController.textOrNull,
      'rtspPort': rtspPortController.textOrNull,
      'username': usernameController.textOrNull,
      'password': passwordController.textOrNull,
    };
  }

  void disposeHikvision() {
    ipController.dispose();
    portController.dispose();
    rtspPortController.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }
}

mixin HikvisionCameraCustomDataEditMixin implements State<DeviceEditScreen> {
  late final TextEditingController ipController = TextEditingController(
      text: (widget.device.customData?['ip'] ?? '') as String);
  late final TextEditingController portController = TextEditingController(
      text: (widget.device.customData?['port'] ?? '') as String);

  late final TextEditingController channelController = TextEditingController(
      text: (widget.device.customData?['channel'] ?? '') as String);

  late final TextEditingController usernameController = TextEditingController(
      text: (widget.device.customData?['username'] ?? '') as String);
  late final TextEditingController passwordController = TextEditingController(
      text: (widget.device.customData?['password'] ?? '') as String);

  Widget buildHikvisionCameraCustomDataFields(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          'Настройки подключения Hikvision',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white.withValues(alpha: .7),
          ).reverseMerge(context.textTheme.labelLarge),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: ipController,
          decoration: const InputDecoration(
            labelText: 'IP-адрес',
            hintText: 'Введите IP-адрес устройства',
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: portController,
          decoration: const InputDecoration(
            labelText: 'Порт',
            hintText: 'Введите порт устройства',
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: channelController,
          decoration: const InputDecoration(
            labelText: 'Channel',
            hintText: 'Введите channel устройства',
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: usernameController,
          decoration: const InputDecoration(
            labelText: 'Имя пользователя',
            hintText: 'Введите имя пользователя',
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: passwordController,
          decoration: const InputDecoration(
            labelText: 'Пароль',
            hintText: 'Введите пароль',
          ),
          obscureText: true,
        ),
      ],
    );
  }

  Map<String, Object?> getHikvisionCameraCustomData() {
    return {
      'ip': ipController.textOrNull,
      'port': portController.textOrNull,
      'channel': channelController.textOrNull,
      'username': usernameController.textOrNull,
      'password': passwordController.textOrNull,
    };
  }

  void disposeCameraHikvision() {
    ipController.dispose();
    portController.dispose();
    channelController.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }
}
