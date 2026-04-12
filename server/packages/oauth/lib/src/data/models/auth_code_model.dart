import 'package:common/common.dart';

part 'auth_code_model.freezed.dart';
part 'auth_code_model.g.dart';

@Freezed(fromJson: true, toJson: true)
sealed class AuthCodeModel with _$AuthCodeModel {
  const AuthCodeModel._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AuthCodeModel({
    required String code,
    required String clientId,
    required int userId,
    @JsonKey(fromJson: dateTimeFromJson) required DateTime expiresAt,
  }) = _AuthCodeModel;

  factory AuthCodeModel.fromJson(Map<String, Object?> json) =>
      _$AuthCodeModelFromJson(json);

  Map<String, Object?> toJson();
}

DateTime dateTimeFromJson(dynamic value) {
  if (value is String) {
    return DateTime.parse(value);
  }
  return value;
}
