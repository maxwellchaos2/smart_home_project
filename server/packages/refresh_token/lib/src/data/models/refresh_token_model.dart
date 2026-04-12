import 'package:common/common.dart';

part 'refresh_token_model.freezed.dart';
part 'refresh_token_model.g.dart';

@Freezed(fromJson: true)
sealed class RefreshTokenModel with _$RefreshTokenModel {
  const RefreshTokenModel._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RefreshTokenModel({
    required int id,
    required String token,
    required int userId,
    @JsonKey(fromJson: dateTimeFromJson) required DateTime expiresAt,
    @JsonKey(fromJson: dateTimeFromJson) required DateTime createdAt,
  }) = _RefreshTokenModel;

  factory RefreshTokenModel.fromJson(Map<String, Object?> json) =>
      _$RefreshTokenModelFromJson(json);
}

DateTime dateTimeFromJson(DateTime value) {
  return value;
}
