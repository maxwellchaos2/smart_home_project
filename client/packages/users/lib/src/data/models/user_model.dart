import 'package:common/common.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@Freezed(fromJson: true)
sealed class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required String name,
    required String type,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String username,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}
