import 'package:common/common.dart';

part 'yandex_auth_token_model.freezed.dart';
part 'yandex_auth_token_model.g.dart';

@Freezed(fromJson: true, toJson: true)
sealed class YandexAuthTokenModel with _$YandexAuthTokenModel {
  const YandexAuthTokenModel._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory YandexAuthTokenModel({
    required String accessToken,
    required String refreshToken,
    @JsonKey(fromJson: dateTimeFromJson) required DateTime expiresAt,
    required int? projectId,
  }) = _YandexAuthTokenModel;

  factory YandexAuthTokenModel.fromJson(Map<String, Object?> json) {
    json['expires_at'] = json['expires_at'] ?? json['expires_in'];

    return _$YandexAuthTokenModelFromJson(json);
  }

  Map<String, Object?> toJson();
}

DateTime dateTimeFromJson(dynamic value) {
  if (value is String) {
    return DateTime.parse(value);
  }
  if (value is int) {
    return DateTime.fromMillisecondsSinceEpoch(value * 1000);
  }
  return value;
}
