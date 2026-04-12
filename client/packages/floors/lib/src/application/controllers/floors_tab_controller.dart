import 'package:common/common.dart';
import 'package:floors/floors.dart';

final class FloorsTabController extends TabController {
  FloorsTabController({
    required List<FloorEntity> floors,
    required super.vsync,
  })  : _floors = floors,
        super(
          length: floors.length,
          initialIndex: 0,
        );

  final List<FloorEntity> _floors;

  FloorEntity get selectedFloor => _floors[index];

  FloorEntity? getFloorByIndex(int index) {
    return _floors[index];
  }
}
