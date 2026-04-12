import 'package:floors/src/domain/domain.dart';

abstract interface class IFloorsRepository {
  Future<List<FloorEntity>> fetchAll({
    required int projectId,
  });

  Future<FloorEntity> create({
    required FloorInputEntity input,
    required int projectId,
  });
}
