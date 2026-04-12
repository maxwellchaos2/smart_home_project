import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_user_request_model.freezed.dart';
part 'create_user_request_model.g.dart';

@Freezed(fromJson: true)
class CreateUserRequestModel with _$CreateUserRequestModel {
  const CreateUserRequestModel._();

  const factory CreateUserRequestModel({
    required String name,
    required String type,
    required String username,
    required String password,
    required String? email,
  }) = _CreateUserRequestModel;

  factory CreateUserRequestModel.fromJson(Map<String, Object?> json) =>
      _$CreateUserRequestModelFromJson(json);
}
