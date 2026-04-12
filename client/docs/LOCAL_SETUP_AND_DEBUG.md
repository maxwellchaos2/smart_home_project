# Client Local Setup and Debug

## 1. Требования

На рабочей машине должны быть:
- Flutter SDK (совместимый с `sdk: ^3.6.0` в `pubspec.yaml`).
- Xcode (для iOS/macOS сборки на macOS).
- Android Studio/SDK (для Android).
- VS Code + Dart/Flutter extensions.
- FVM.

Проверка:

```bash
flutter --version
dart --version
flutter doctor -v
```

## 2. Подготовка проекта

```bash
cd client
flutter pub get
```

## 3. Режимы запуска (VS Code)

Файл: `client/.vscode/launch.json`

Доступные конфигурации:
- `run dev`
- `run dev (profile mode)`
- `run dev (release mode)`
- `run prod (release mode)`
- `run prod (debug mode)`

Они переключают окружение через:
- `--dart-define-from-file=config/dev.json`
- `--dart-define-from-file=config/prod.json`

## 4. Режимы запуска (CLI)

Dev:

```bash
flutter run --dart-define-from-file=config/dev.json
```

Prod-конфиг в debug режиме:

```bash
flutter run --dart-define-from-file=config/prod.json
```

## 5. Как приложение выбирает окружение
- В `main.dart` читается `ENV`.
- `ENV=dev` -> `DevAppConfig`.
- Любое другое значение -> `ProdAppConfig`.

Текущее содержимое конфигов:
- `config/dev.json` -> `{ "ENV": "dev" }`
- `config/prod.json` -> `{ "ENV": "prod" }`

## 6. Отладка API подключения

В `DevAppConfig`:
- API: `http://localhost:8080/api/`
- WS: `ws://localhost:8080/ws`

В `ProdAppConfig`:
- API: `https://api.smart-home-pnz.ru/api/`
- WS: `wss://api.smart-home-pnz.ru/ws`

Если запуск идёт на физическом устройстве, `localhost` будет указывать на устройство, а не на ваш компьютер — используйте доступный IP/hostname backend.

## 7. Типовой цикл разработки
1. Поднять backend локально.
2. Запустить `run dev` в VS Code.
3. Проверить вход пользователя.
4. Проверить загрузку проекта/комнат/устройств.
5. Проверить отправку команд устройствам.

