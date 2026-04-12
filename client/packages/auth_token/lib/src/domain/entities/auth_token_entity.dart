import 'package:common/common.dart';

part 'auth_token_entity.freezed.dart';

@Freezed(copyWith: true, equal: true)
sealed class AuthTokenEntity with _$AuthTokenEntity {
  const AuthTokenEntity._();

  const factory AuthTokenEntity({
    required String accessToken,
    required String? refreshToken,
    required int? userId,
  }) = _AuthTokenEntity;
}
