import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class FloorInputMapper {
  static FloorInputModel toModel({required FloorInputEntity from}) {
    return FloorInputModel(
      name: from.name,
    );
  }
}
