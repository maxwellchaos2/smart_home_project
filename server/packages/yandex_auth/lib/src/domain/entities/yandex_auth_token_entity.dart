import 'package:common/common.dart';

part 'yandex_auth_token_entity.freezed.dart';

@Freezed(copyWith: true, equal: true)
sealed class YandexAuthTokenEntity with _$YandexAuthTokenEntity {
  const YandexAuthTokenEntity._();

  const factory YandexAuthTokenEntity({
    required String accessToken,
    required String refreshToken,
    required DateTime expiresAt,
    required int? projectId,
  }) = _YandexAuthTokenEntity;
}
