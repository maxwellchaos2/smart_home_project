import 'package:common/common.dart';

part 'sign_in_input_entity.freezed.dart';

@freezed
sealed class SignInInputEntity with _$SignInInputEntity {
  const factory SignInInputEntity({
    required String username,
    required String password,
  }) = _SignInInputEntity;
}
