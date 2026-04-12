import 'package:users/src/domain/domain.dart';

abstract interface class IUsersRepository {
  Future<UserEntity> fetch();
}
