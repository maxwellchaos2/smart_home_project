import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class SignInInputMapper {
  static SignInInputModel toModel({required SignInInputEntity from}) {
    return SignInInputModel(
      username: from.username,
      password: from.password,
    );
  }
}
