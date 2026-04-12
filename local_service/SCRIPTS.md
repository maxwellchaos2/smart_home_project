# 📁 Структура скриптов

Все скрипты организованы по категориям в папке `scripts/`:

## 🔧 scripts/setup/
- `setup-ssh.sh` - Настройка SSH ключей для автоматического входа

## 🔨 scripts/build/
- `build-native-vosk.sh` - Сборка полной модели Vosk для ARM64
- `build-native-vosk-small.sh` - Сборка уменьшенной модели Vosk для ARM64

## 🚀 scripts/deploy/
- `deploy-service.sh` - Универсальный деплой отдельного сервиса
- `deploy-all.sh` - Полный деплой с предустановленными параметрами
- `full-deploy.sh` - Универсальный полный деплой с параметрами
- `build-and-deploy-services.sh` - Сборка и деплой всех сервисов

## 🖥️ scripts/server/
- `start-server.sh` - Запуск сервера с Docker Compose

## 📋 Использование через Makefile

```bash
# Настройка SSH
make setup-ssh

# Сборка образов
make build-vosk-arm64
make build-vosk-small-arm64

# Деплой
make deploy-all                    # Полный деплой с предустановленными параметрами
make deploy-service SERVICE=name   # Деплой отдельного сервиса
make deploy-full REMOTE_PATH=/path # Универсальный деплой

# Управление
make start-server                  # Запуск сервера
make chmod-scripts                 # Установка прав выполнения
```

## 🏗️ Структура проекта

```
local_service/
├── compose.yaml              # Docker Compose конфигурация
├── Makefile                 # Автоматизация команд
├── README.md                # Документация
├── mosquitto/               # Конфигурация MQTT брокера
├── zigbee2mqtt/            # Конфигурация Zigbee2MQTT
└── scripts/                # Все скрипты организованы по папкам
    ├── setup/              # Скрипты настройки
    ├── build/              # Скрипты сборки
    ├── deploy/             # Скрипты деплоя
    └── server/             # Скрипты управления сервером
```