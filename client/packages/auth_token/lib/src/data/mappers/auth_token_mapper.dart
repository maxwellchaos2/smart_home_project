import 'package:jwt_decoder/jwt_decoder.dart';

import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class AuthTokenMapper {
  static AuthTokenEntity toEntity({required AuthTokenModel from}) {
    final jwtInfo = JwtDecoder.decode(from.token);
    return AuthTokenEntity(
      accessToken: from.token,
      refreshToken: from.refreshToken,
      userId: jwtInfo['userId'] as int?,
    );
  }

  static AuthTokenModel toModel({required AuthTokenEntity from}) {
    return AuthTokenModel(
      token: from.accessToken,
      refreshToken: from.refreshToken,
    );
  }
}
