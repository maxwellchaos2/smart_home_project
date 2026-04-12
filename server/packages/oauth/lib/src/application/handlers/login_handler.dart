import 'package:shelf/shelf.dart';

const yandexClientId = 'yandex-1';

Future<Response> loginHandler(Request request) async {
  final queryParams = request.url.queryParameters;

  final state = queryParams['state'];
  final redirectUri = queryParams['redirect_uri'];
  final clientId = queryParams['client_id'];
  final responseType = queryParams['response_type'];

  if (responseType != 'code') {
    return Response(400, body: 'Invalid response_type');
  }

  // Проверка client_id (например, из базы данных)
  if (clientId != yandexClientId) {
    return Response(400, body: 'Invalid client_id');
  }

  // Отображение страницы авторизации (HTML-форма)
  return Response.ok('''
    <!DOCTYPE html>
    <html lang="ru">
      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Вход в систему</title>
        <style>
          * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
          }
          
          body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            background: rgba(32, 32, 32, 0.8);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
          }
          
          .container {
            background: #3E3E3E;
            border-radius: 16px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.3);
            padding: 40px 30px;
            width: 100%;
            max-width: 400px;
          }
          
          h1 {
            color: #FFFFFF;
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 8px;
            text-align: center;
          }
          
          .subtitle {
            color: #B0B0B0;
            font-size: 14px;
            text-align: center;
            margin-bottom: 32px;
          }
          
          .form-group {
            margin-bottom: 20px;
          }
          
          label {
            display: block;
            color: #E0E0E0;
            font-size: 14px;
            font-weight: 500;
            margin-bottom: 8px;
          }
          
          input[type="text"],
          input[type="password"] {
            width: 100%;
            padding: 14px 16px;
            border: 2px solid #555555;
            border-radius: 8px;
            font-size: 16px;
            transition: all 0.3s ease;
            background: #2A2A2A;
            color: #FFFFFF;
          }
          
          input[type="text"]:focus,
          input[type="password"]:focus {
            outline: none;
            border-color: #F49911;
            background: #333333;
          }
          
          button {
            width: 100%;
            padding: 16px;
            background: #F49911;
            color: #FFFFFF;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
            margin-top: 10px;
          }
          
          button:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 20px rgba(244, 153, 17, 0.4);
            background: #E58A0A;
          }
          
          button:active {
            transform: translateY(0);
          }
          
          @media (max-width: 480px) {
            .container {
              padding: 30px 20px;
            }
            
            h1 {
              font-size: 24px;
            }
          }
        </style>
      </head>
      <body>
        <div class="container">
          <h1>Вход в систему</h1>
          <p class="subtitle">Введите свои учетные данные</p>
          
          <form action="/oauth/login/submit" method="post">
            <input type="hidden" name="state" value="$state">
            <input type="hidden" name="redirect_uri" value="$redirectUri">
            <input type="hidden" name="client_id" value="$clientId">
            
            <div class="form-group">
              <label for="username">Логин</label>
              <input type="text" id="username" name="username" required autocomplete="username" autofocus>
            </div>
            
            <div class="form-group">
              <label for="password">Пароль</label>
              <input type="password" id="password" name="password" required autocomplete="current-password">
            </div>
            
            <button type="submit">Войти</button>
          </form>
        </div>
      </body>
    </html>
  ''', headers: {'content-type': 'text/html'});
}
