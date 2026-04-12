import 'package:access_control/src/data/data.dart';
import 'package:access_control/src/domain/domain.dart';

final class AccessControlRepositoryImpl implements IAccessControlRepository {
  const AccessControlRepositoryImpl({
    required IAccessControlRemoteDatasource remoteSource,
  }) : _remoteSource = remoteSource;

  final IAccessControlRemoteDatasource _remoteSource;

  @override
  Future<bool> openDoor({required int doorId}) async {
    return await _remoteSource.openDoor(doorId: doorId);
  }

  @override
  Future<bool> closeDoor({required int doorId}) async {
    return await _remoteSource.closeDoor(doorId: doorId);
  }
}
