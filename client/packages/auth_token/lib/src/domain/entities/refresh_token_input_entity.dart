import 'package:common/common.dart';

part 'refresh_token_input_entity.freezed.dart';

@freezed
sealed class RefreshTokenInputEntity with _$RefreshTokenInputEntity {
  const factory RefreshTokenInputEntity({
    required String refreshToken,
  }) = _RefreshTokenInputEntity;
}
