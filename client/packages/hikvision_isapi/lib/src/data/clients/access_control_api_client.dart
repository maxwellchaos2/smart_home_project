import 'dart:async';
import 'dart:convert';

import 'package:hikvision_isapi/src/data/clients/isapi_client.dart';
import 'package:hikvision_isapi/src/data/data.dart';
import 'package:hikvision_isapi/src/domain/domain.dart';
import 'package:http/http.dart' as http;
import 'package:http_auth/http_auth.dart';
import 'package:http_auth/src/http_auth_utils.dart' as utils;

abstract interface class IAccessControlApiClient {
  Future<IsapiEventsChunkModel> fetchChunkEvents({
    required AccessInfoInputEntity accessInfo,
    required IsapiEventInputModel input,
  });

  // Под одним пользователем не работает
  Stream<Map<String, dynamic>> listenEvents({
    required AccessInfoInputEntity accessInfo,
  });
}

final class AccessControlApiClientImpl implements IAccessControlApiClient {
  const AccessControlApiClientImpl();

  @override
  Future<IsapiEventsChunkModel> fetchChunkEvents({
    required AccessInfoInputEntity accessInfo,
    required IsapiEventInputModel input,
  }) async {
    final client = DigestAuthClient(
      accessInfo.username,
      accessInfo.password,
    );

    final inputJson = input.toJson();
    final response = await client.post(
      Uri.parse(
          'http://${accessInfo.ipAddress}:${accessInfo.port}/ISAPI/AccessControl/AcsEvent?format=json'),
      body: jsonEncode(
        {
          "AcsEventCond": inputJson,
        },
      ),
    );

    final result = jsonDecode(response.body) as Map<String, dynamic>;
    return IsapiEventsChunkModel.fromJson(
        result['AcsEvent'] as Map<String, dynamic>);
  }

  @override
  Stream<Map<String, dynamic>> listenEvents({
    required AccessInfoInputEntity accessInfo,
  }) {
    final url =
        'http://${accessInfo.ipAddress}:${accessInfo.port}/ISAPI/Event/notification/alertStream';
    final isapiClient = ISAPIClientImpl(
      getClient: () => DigestAuthClient(
        accessInfo.username,
        accessInfo.password,
      ),
      url: url,
    );
    return isapiClient.listenEvents();
  }
}

class DigestAuthClient extends http.BaseClient {
  final http.Client _inner;

  final utils.DigestAuth _auth;

  /// Creates a client wrapping [inner] that uses Basic HTTP auth.
  ///
  /// Constructs a new [BasicAuthClient] which will use the provided [username]
  /// and [password] for all subsequent requests.
  DigestAuthClient(String username, String password,
      {http.Client? inner, String? authenticationHeader})
      : _auth = utils.DigestAuth(username, password),
        _inner = inner ?? http.Client() {
    if (authenticationHeader != null) {
      _auth.initFromAuthenticateHeader(authenticationHeader);
    }
  }

  String? _lastAuthInfo;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    if (_auth.isReady()) {
      request.headers[utils.HttpConstants.headerAuthorization] =
          _auth.getAuthString(request.method, request.url);
    }
    final response = await _inner.send(request);

    if (response.statusCode == 401) {
      final newRequest = utils.copyRequest(request);
      final authInfo =
          (response.headers[utils.HttpConstants.headerWwwAuthenticate] ??
              _lastAuthInfo)!;

      _lastAuthInfo = authInfo;
      _auth.initFromAuthenticateHeader(authInfo);

      newRequest.headers[utils.HttpConstants.headerAuthorization] =
          _auth.getAuthString(newRequest.method, newRequest.url);

      return _inner.send(newRequest);
    }

    // we should reach this point only with errors other than 401
    return response;
  }

  @override
  void close() {
    _inner.close();
  }
}
