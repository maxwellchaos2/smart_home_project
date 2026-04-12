import 'package:common/common.dart';

part 'sign_in_input_model.freezed.dart';
part 'sign_in_input_model.g.dart';

@Freezed(toJson: true)
sealed class SignInInputModel with _$SignInInputModel {
  const SignInInputModel._();

  const factory SignInInputModel({
    required String username,
    required String password,
  }) = _SignInInputModel;

  @override
  Map<String, dynamic> toJson();
}
