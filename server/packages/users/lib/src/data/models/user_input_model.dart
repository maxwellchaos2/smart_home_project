import 'package:common/common.dart';

part 'user_input_model.freezed.dart';
part 'user_input_model.g.dart';

@Freezed(toJson: true)
sealed class UserInputModel with _$UserInputModel {
  const UserInputModel._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UserInputModel({
    required String name,
    required String type,
    required String? email,
    required String username,
    required String passwordHash,
  }) = _UserInputModel;

  @override
  Map<String, dynamic> toJson();
}
