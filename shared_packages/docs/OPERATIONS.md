# Shared Packages Operations

## 1. Базовый workflow изменения
Для каждого изменяемого пакета:

```bash
cd shared_packages/<package_name>
dart pub get
dart run build_runner build --delete-conflicting-outputs
dart analyze
dart test
```

Рекомендуемые кандидаты для первичной проверки совместимости: `sync_service`, `zigbee_service`, `scenarios_service`, `voice_assistant_service`.
