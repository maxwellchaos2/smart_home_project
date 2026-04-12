# Client Configuration

## 1. Источник конфигурации

Клиент использует compile-time defines:
- `--dart-define=...`
- `--dart-define-from-file=config/*.json`

Основной ключ:
- `ENV`

## 2. Файлы окружений

### `config/dev.json`
```json
{
  "ENV": "dev"
}
```

### `config/prod.json`
```json
{
  "ENV": "prod"
}
```

## 3. Маппинг ENV -> AppConfig

В `lib/main.dart`:
- `ENV == "dev"` -> `DevAppConfig`
- иначе -> `ProdAppConfig`

## 4. Значения endpoint'ов

### DevAppConfig
- `baseUrl`: `http://localhost:8080/`
- `apiUrl`: `http://localhost:8080/api/`
- `wsUrl`: `ws://localhost:8080/ws`

### ProdAppConfig
- `baseUrl`: `https://api.smart-home-pnz.ru/`
- `apiUrl`: `https://api.smart-home-pnz.ru/api/`
- `wsUrl`: `wss://api.smart-home-pnz.ru/ws`

## 5. Где конфигурация используется
- `AppRunner` создаёт `Dio(BaseOptions(baseUrl: appConfig.apiUrl))`.
- Модули и репозитории используют зарегистрированный `Dio`.
- Навигация/экранные данные зависят от успешного доступа к backend.

## 6. VS Code launch profiles

Конфиги запуска из `.vscode/launch.json` уже используют `--dart-define-from-file`.

Практический паттерн:
- Разработка: `run dev`.
- Проверка прод-конфига: `run prod (debug mode)`.
- Предрелизная проверка: `run prod (release mode)`.

## 7. Изменение dev endpoint

Если backend не на localhost, обновите `DevAppConfig` (`lib/src/app_config.dart`) и перезапустите приложение.
