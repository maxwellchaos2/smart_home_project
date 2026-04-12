import 'package:common/common.dart';

part 'verification_code_model.freezed.dart';
part 'verification_code_model.g.dart';

@Freezed(fromJson: true)
sealed class VerificationCodeModel with _$VerificationCodeModel {
  const VerificationCodeModel._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory VerificationCodeModel({
    required int id,
    required String email,
    required String code,
    @JsonKey(fromJson: dateTimeFromJson) required DateTime createdAt,
    @JsonKey(fromJson: dateTimeFromJson) required DateTime expiresAt,
    @JsonKey(fromJson: dateTimeVFromJson) required DateTime? verifiedAt,
  }) = _VerificationCodeModel;

  factory VerificationCodeModel.fromJson(Map<String, Object?> json) =>
      _$VerificationCodeModelFromJson(json);
}

DateTime dateTimeFromJson(DateTime value) {
  return value;
}

DateTime? dateTimeVFromJson(DateTime? value) {
  return value;
}
