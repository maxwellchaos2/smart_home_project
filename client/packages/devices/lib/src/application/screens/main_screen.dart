import 'dart:math' as math;

import 'package:common/common.dart';
import 'package:devices/src/application/application.dart';
import 'package:events/events.dart';
import 'package:floors/floors.dart';
import 'package:projects/projects.dart';
import 'package:rooms/rooms.dart';
import 'package:yandex_auth/yandex_auth.dart';

final class MainScreen extends StatefulWidget
    with ScreenMixin
    implements ScreenWrapper {
  const MainScreen({
    super.key,
  });

  @override
  Widget wrappedScreen(BuildContext context) {
    return MultiProvider(
      providers: [
        EventsScope(),
        UpdateYandexDevicesScope(
          projectId: ProjectScope.of(context).state.data!.id,
        ),
      ],
      child: this,
    );
  }

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends StateWithListeners<MainScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  late RoomsTabController _roomsTabController;
  late final WarningController _warningController;

  bool _showMonitor = true;

  @override
  void initState() {
    super.initState();

    context.read<MainScaffoldKeyController>().setNewKeyWithoutUpdate();

    _warningController = WarningController();

    _roomsTabController = RoomsTabController(
      rooms: RoomsScope.of(context).state.data!,
      vsync: this,
    );

    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _tryUpdateYandexDevices();
    });
  }

  @override
  List<SingleChildWidget> get listeners => [
        ProjectBlocListener(
          listenWhen: (previous, current) =>
              previous.data?.hasYandexAuth != current.data?.hasYandexAuth,
          listener: (context, state) => state.mapOrNull(
            success: (state) => _tryUpdateYandexDevices(),
          ),
        ),
        UpdateYandexDevicesBlocListener(
          listener: (context, state) => state.mapOrNull(
            success: (state) => DevicesScope.of(context).fetch(),
          ),
        ),
        WarningListener(
          controller: _warningController,
        ),
      ];

  void _tryUpdateYandexDevices() {
    if (ProjectScope.of(context).state.data?.hasYandexAuth == true) {
      UpdateYandexDevicesScope.of(context).update();
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      DevicesScope.of(context).fetch();
      _tryUpdateYandexDevices();
    }
  }

  @override
  void dispose() {
    _warningController.dispose();
    _roomsTabController.dispose();

    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  List<SingleChildWidget> get _providers => [
        ChangeNotifierProvider.value(
          value: _warningController,
        ),
        RoomsBlocListener(
          listener: (context, state) {
            if (state.hasData) {
              if (state.data!.length != _roomsTabController.length + 1) {
                _roomsTabController.dispose();
                _roomsTabController = RoomsTabController(
                  rooms: RoomsScope.of(context).state.data!,
                  vsync: this,
                  initialIndex: _roomsTabController.index,
                );
                setState(() {});
              }
            }
          },
        ),
      ];

  Widget buildBody(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _roomsTabController,
      child: OrientationBuilder(
        builder: (context, orientation) {
          return Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
                      child: _Header(
                        isShowMonitor: _showMonitor,
                        setShowMonitor: (value) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            setState(() {
                              _showMonitor = value;
                            });
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (_showMonitor) ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: RoomsTabBar(controller: _roomsTabController),
                      ),
                      const SizedBox(height: 2),
                      Expanded(
                        child: TabBarView(
                          controller: _roomsTabController,
                          children: List.generate(
                              _roomsTabController.length, (i) => i).map(
                            (index) {
                              final room =
                                  _roomsTabController.getRoomByIndex(index);
                              return MonitorPanel(
                                roomId: room?.id,
                                roomTabController: _roomsTabController,
                              );
                            },
                          ).toList(),
                        ),
                      )
                    ] else ...[
                      const SizedBox(height: 10),
                      Expanded(
                        child: FloorLayout(),
                      ),
                    ]
                  ],
                ),
              ),
              if (orientation == Orientation.landscape) ...[
                const SizedBox(width: 4),
                Padding(
                  padding: const EdgeInsets.all(16).copyWith(left: 0),
                  child: RightBanner(),
                ),
              ],
            ],
          );
        },
      ),
    );
  }

  @override
  Widget buildChild(BuildContext context) {
    double scaleSize = 1.0;
    return LayoutBuilder(
      builder: (context, cs) {
        const minimumWidth = 1255.0;
        const minimumHeight = 811.0;

        Widget child = MultiProvider(
          providers: _providers,
          child: SafeArea(
            bottom: false,
            child: WarningWrapper(
              controller: _warningController,
              child: buildBody(context),
            ),
          ),
        );

        if (MediaQuery.orientationOf(context) == Orientation.landscape &&
            (cs.maxWidth < minimumWidth || cs.maxHeight < minimumHeight)) {
          scaleSize = math
              .min(
                cs.maxWidth / minimumWidth,
                cs.maxHeight / minimumHeight,
              )
              .clamp(0.0, 1.0);
          child = FittedBox(
            fit: BoxFit.scaleDown,
            child: SizedBox(
              width: minimumWidth,
              height: minimumHeight,
              child: child,
            ),
          );
        }
        return Provider.value(
          value: scaleSize,
          child: Scaffold(
            key: context.mainScaffoldKey,
            drawer: const AppDrawer(),
            body: Stack(
              children: [
                Positioned(
                  right: -130,
                  top: -130,
                  child: _BackgroundCircle(),
                ),
                Align(
                  alignment: Alignment.center,
                  child: child,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Header extends StatefulWidget {
  const _Header({
    required this.isShowMonitor,
    required this.setShowMonitor,
  });

  final bool isShowMonitor;
  final Function(bool value) setShowMonitor;

  @override
  State<_Header> createState() => _HeaderState();
}

class _HeaderState extends State<_Header> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.isShowMonitor ? 0 : 1,
    );

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        return;
      }
      widget.setShowMonitor(_tabController.index == 0);
    });
  }

  @override
  void didUpdateWidget(covariant _Header oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isShowMonitor != widget.isShowMonitor) {
      _tabController.index = widget.isShowMonitor ? 0 : 1;
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.orientationOf(context);
    return Container(
      height: orientation == Orientation.portrait ? 100 : 125,
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 25,
      ),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Assets.logo.image(),
          ),
          const SizedBox(width: 20),
          if (orientation == Orientation.portrait) ...[
            Spacer(),
            SizedBox(
              width: 160,
              child: TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(
                    icon: Text('Панель'),
                  ),
                  Tab(
                    icon: Text('Схема'),
                  ),
                ],
              ),
            ),
          ] else ...[
            SizedBox(
              child: AppButton(
                onPressed: () => widget.setShowMonitor(true),
                minimumSize: const Size(100, double.infinity),
                isActive: widget.isShowMonitor,
                child: const Text('Панель управления'),
              ),
            ),
            const SizedBox(width: 16),
            AppButton(
              onPressed: () => widget.setShowMonitor(false),
              minimumSize: const Size(100, double.infinity),
              isActive: !widget.isShowMonitor,
              child: const Text('Схема в 2D'),
            ),
            const SizedBox(width: 16),
            const Spacer(),
            // AnimatedBuilder(
            //     animation: _lightsController,
            //     builder: (context, _) {
            //       return Row(
            //         children: [
            //           SwitchButton(
            //             icon: Assets.icons.sleep,
            //             onChanged: (value) {
            //               _lightsController.setLightType(
            //                 value
            //                     ? LightType.sleep
            //                     : LightType.none,
            //               );
            //             },
            //             isActive:
            //                 _lightsController.lightType ==
            //                     LightType.sleep,
            //             title: 'Сон',
            //           ),
            //           const SizedBox(width: 16),
            //           SwitchButton(
            //             icon: Assets.icons.cinema,
            //             onChanged: (value) {
            //               _lightsController.setLightType(
            //                 value
            //                     ? LightType.cinema
            //                     : LightType.none,
            //               );
            //             },
            //             isActive:
            //                 _lightsController.lightType ==
            //                     LightType.cinema,
            //             title: 'Кино',
            //           ),
            //           const SizedBox(width: 16),
            //           SwitchButton(
            //             icon: Assets.icons.guests,
            //             onChanged: (value) {
            //               _lightsController.setLightType(
            //                 value
            //                     ? LightType.guests
            //                     : LightType.none,
            //               );
            //             },
            //             isActive:
            //                 _lightsController.lightType ==
            //                     LightType.guests,
            //             title: 'Гости',
            //           ),
            //         ],
            //       );
            //     }),
          ],
        ],
      ),
    );
  }
}

class _BackgroundCircle extends StatelessWidget {
  const _BackgroundCircle();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 347,
      height: 347,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF4E4E4E),
      ),
      child: Center(
        child: Container(
          width: 221,
          height: 221,
          padding: const EdgeInsets.all(100),
          decoration: const BoxDecoration(
            color: Color(0xFF3E3E3E),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
