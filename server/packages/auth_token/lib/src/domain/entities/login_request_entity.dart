import 'package:common/common.dart';

part 'login_request_entity.freezed.dart';

@Freezed(copyWith: true, equal: true)
sealed class LoginRequestEntity with _$LoginRequestEntity {
  const LoginRequestEntity._();

  const factory LoginRequestEntity({
    required String username,
    required String password,
  }) = _LoginRequestEntity;
}
