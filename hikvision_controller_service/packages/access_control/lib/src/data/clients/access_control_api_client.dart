import 'package:isapi/isapi.dart';

abstract interface class IAccessControlApiClient {
  Future<Map<String, dynamic>> openDoor({required int doorId});
  Future<Map<String, dynamic>> closeDoor({required int doorId});
}

final class AccessControlApiClientImpl implements IAccessControlApiClient {
  const AccessControlApiClientImpl({required IISAPIClient client})
      : _client = client;

  final IISAPIClient _client;

  @override
  Future<Map<String, dynamic>> openDoor({required int doorId}) async {
    return await _client.put(
      '/AccessControl/RemoteControl/door/$doorId',
      xmlName: 'RemoteControlDoor',
      nest: (builder) {
        builder.element('cmd', nest: 'open');
      },
    );
  }

  @override
  Future<Map<String, dynamic>> closeDoor({required int doorId}) async {
    return await _client.put(
      '/AccessControl/RemoteControl/door/$doorId',
      xmlName: 'RemoteControlDoor',
      nest: (builder) {
        builder.element('cmd', nest: 'close');
      },
    );
  }
}
