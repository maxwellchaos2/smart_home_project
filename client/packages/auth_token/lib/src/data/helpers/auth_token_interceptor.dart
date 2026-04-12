import 'package:dio/dio.dart';
import 'package:synchronized/synchronized.dart';

import '../../domain/domain.dart';

final class AuthTokenInterceptor extends InterceptorsWrapper {
  // ignore: unused_field
  final Dio _dio;
  final IAuthTokenRepository Function() _getAuthRepository;
  IAuthTokenRepository get _authRepository => _getAuthRepository();

  AuthTokenInterceptor(
      Dio dio, IAuthTokenRepository Function() getAuthRepository)
      : _dio = dio,
        _getAuthRepository = getAuthRepository;

  final getTokenLock = Lock();

  Future<AuthTokenEntity?> getToken() async {
    AuthTokenEntity? token = await _authRepository.fetchToken();
    return token;
  }

  void setTokenToOptions(RequestOptions options, AuthTokenEntity token) {
    options.headers['Authorization'] = 'Bearer ${token.accessToken}';
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.path == '/tokens/refresh') {
      AuthTokenEntity? token = await getToken();
      if (token != null) {
        setTokenToOptions(options, token);
      }
      return handler.next(options);
    }
    await getTokenLock.synchronized(() async {
      AuthTokenEntity? token = await getToken();
      if (token != null) {
        setTokenToOptions(options, token);
      }
    });
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.requestOptions.path == '/api/tokens/refresh') {
      return handler.reject(err);
    }
    if (err.response?.statusCode == 401) {
      final bool isFailed = await getTokenLock.synchronized(
        () async {
          AuthTokenEntity? token = await getToken();
          if (token == null) {
            return true;
          }
          // if (token.refreshTokenExpiredDate.isBefore(DateTime.now())) {
          //   await _authRepository.revokeToken();
          //   return true;
          // }
          try {
            token = await _authRepository.refreshToken(
              data: RefreshTokenInputEntity(
                refreshToken: token.refreshToken!,
              ),
            );
            setTokenToOptions(err.requestOptions, token);
          } catch (e) {
            await _authRepository.revokeToken();
            return true;
          }
          return false;
        },
      );
      if (isFailed) {
        return handler.reject(err);
      }
      return handler.resolve(
        await _dio.request(
          err.requestOptions.path,
          cancelToken: err.requestOptions.cancelToken,
          data: err.requestOptions.data,
          onReceiveProgress: err.requestOptions.onReceiveProgress,
          onSendProgress: err.requestOptions.onSendProgress,
          queryParameters: err.requestOptions.queryParameters,
          options: _requestOptionsToOptions(err.requestOptions),
        ),
      );
    }
    return handler.next(err);
  }
}

Options _requestOptionsToOptions(RequestOptions requestOptions) {
  return Options(
    method: requestOptions.method,
    headers: requestOptions.headers,
    extra: requestOptions.extra,
    responseType: requestOptions.responseType,
    contentType: requestOptions.contentType,
    validateStatus: requestOptions.validateStatus,
    receiveTimeout: requestOptions.receiveTimeout,
    sendTimeout: requestOptions.sendTimeout,
    followRedirects: requestOptions.followRedirects,
    maxRedirects: requestOptions.maxRedirects,
    requestEncoder: requestOptions.requestEncoder,
    responseDecoder: requestOptions.responseDecoder,
    listFormat: requestOptions.listFormat,
  );
}
