import 'package:access_control/src/data/data.dart';

abstract interface class IAccessControlRemoteDatasource {
  Future<bool> openDoor({required int doorId});
  Future<bool> closeDoor({required int doorId});
}

final class AccessControlRemoteDatasourceImpl
    implements IAccessControlRemoteDatasource {
  const AccessControlRemoteDatasourceImpl(
      {required IAccessControlApiClient client})
      : _client = client;

  final IAccessControlApiClient _client;

  Future<bool> openDoor({required int doorId}) async {
    final result = await _client.openDoor(doorId: doorId);
    return result['statusCode'] == '1';
  }

  Future<bool> closeDoor({required int doorId}) async {
    final result = await _client.closeDoor(doorId: doorId);
    return result['statusCode'] == '1';
  }
}
