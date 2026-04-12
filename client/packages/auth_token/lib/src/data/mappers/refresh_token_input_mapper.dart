import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class RefreshTokenInputMapper {
  static RefreshTokenInputModel toModel(
      {required RefreshTokenInputEntity from}) {
    return RefreshTokenInputModel(
      refreshToken: from.refreshToken,
    );
  }
}
