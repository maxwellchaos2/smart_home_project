import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_response_model.freezed.dart';
part 'user_response_model.g.dart';

@Freezed(toJson: true)
class UserResponseModel with _$UserResponseModel {
  const UserResponseModel._();

  const factory UserResponseModel({
    required String name,
    required String type,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String username,
    required String? email,
    required List<int> projectsId,
  }) = _UserResponseModel;

  @override
  Map<String, dynamic> toJson();
}
