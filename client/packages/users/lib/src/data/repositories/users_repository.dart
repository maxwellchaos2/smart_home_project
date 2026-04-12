import 'package:users/src/data/data.dart';
import 'package:users/src/domain/domain.dart';

final class UsersRepositoryImpl implements IUsersRepository {
  const UsersRepositoryImpl({
    required IUsersRemoteDatasource remoteSource,
  }) : _remoteSource = remoteSource;

  final IUsersRemoteDatasource _remoteSource;

  @override
  Future<UserEntity> fetch() {
    return _remoteSource.fetch();
  }
}
