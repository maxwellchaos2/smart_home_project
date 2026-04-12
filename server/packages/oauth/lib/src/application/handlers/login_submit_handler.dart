import 'package:common/common.dart';
import 'package:oauth/src/domain/domain.dart';
import 'package:shelf/shelf.dart';
import 'package:users/users.dart';
import 'package:uuid/uuid.dart';

Future<Response> loginSubmitHandler(Request request) async {
  final locator = request.context['locator'] as GetIt;

  final body = await request.readAsString();
  final formData = Uri.splitQueryString(body);

  final username = formData['username'];
  final password = formData['password'];
  final state = formData['state'];
  final scope = formData['scope'];
  final redirectUri = formData['redirect_uri'];
  final clientId = formData['client_id'];

  // Проверка учетных данных (например, из базы данных)
  final user = await locator.get<IUsersRepository>().authenticateUser(
        username: username!,
        password: password!,
      );
  if (user == null) {
    return Response(400, body: 'Invalid credentials');
  }

  // Генерация кода авторизации
  final authCode = _generateAuthCode(
    clientId: clientId!,
    userId: user.id,
  );

  await locator.get<IAuthCodeRepository>().create(input: authCode);

  // Перенаправление на redirect_uri
  final redirectUrl = Uri.parse(redirectUri!).replace(queryParameters: {
    'code': authCode.code,
    'state': state,
    'client_id': clientId,
    'scope': scope,
  }).toString();

  return Response.found(redirectUrl);
}

AuthCodeEntity _generateAuthCode({
  required String clientId,
  required int userId,
}) {
  final code = Uuid().v4();
  final expiresAt = DateTime.now().add(Duration(minutes: 5));

  return AuthCodeEntity(
    code: code,
    expiresAt: expiresAt,
    clientId: clientId,
    userId: userId,
  );
}
