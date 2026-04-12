import 'package:common/common.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@Freezed(fromJson: true)
sealed class UserModel with _$UserModel {
  const UserModel._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UserModel({
    required int id,
    required String name,
    required String type,
    @JsonKey(fromJson: dateTimeFromJson) required DateTime createdAt,
    @JsonKey(fromJson: dateTimeFromJson) required DateTime updatedAt,
    required List<int> projectsId,
    required String? email,
    required String username,
    required String passwordHash,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}

DateTime dateTimeFromJson(DateTime value) {
  return value;
}
