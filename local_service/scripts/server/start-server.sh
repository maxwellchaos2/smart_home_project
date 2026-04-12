#!/bin/bash

# 🍊 Первый запуск  сервер
echo "🍊 Запуск и настройка сервера"

# Проверяем Docker
if ! command -v docker &> /dev/null; then
    echo "🐳 Устанавливаем Docker..."
    sudo apt update -qq
    
    # Устанавливаем docker.io для надежности
    sudo apt install -y docker.io docker-compose
    sudo systemctl start docker
    sudo systemctl enable docker
    sudo usermod -aG docker $(whoami)
    
    echo "✅ Docker установлен. Пользователь $(whoami) добавлен в группу docker"
    echo "⚠️  Для применения прав выйдите и зайдите снова, или выполните: newgrp docker"
fi

echo "✅ Docker найден"

# Проверяем что Docker daemon запущен
echo "🔄 Проверяю Docker daemon..."
if ! sudo docker version >/dev/null 2>&1; then
    echo "🔄 Запускаю Docker daemon..."
    
    if command -v systemctl >/dev/null 2>&1; then
        sudo systemctl start docker
    elif command -v service >/dev/null 2>&1; then
        sudo service docker start
    else
        echo "❌ Не удалось найти способ запустить Docker"
        exit 1
    fi
    
    sleep 3
    
    if ! sudo docker version >/dev/null 2>&1; then
        echo "❌ Docker daemon не запустился"
        exit 1
    fi
fi

echo "✅ Docker daemon работает"

# Проверяем Docker Compose
if ! command -v docker-compose &> /dev/null && ! docker compose version &> /dev/null; then
    echo "📦 Устанавливаем Docker Compose..."
    # Удаляем конфликтующие пакеты
    sudo apt-get remove -y docker-compose 2>/dev/null || true
    # Используем docker compose plugin
    echo "✅ Используется Docker Compose v2 (встроенный plugin)"
fi

echo "✅ Docker Compose найден"

# Установка vim
if ! command -v vim &> /dev/null; then
    echo "📝 Устанавливаем vim..."
    sudo apt-get install -y vim
    echo "✅ vim установлен"
fi

echo "✅ vim найден"


# Включаем Bluetooth (если есть)
if command -v bluetoothctl &> /dev/null; then
    echo "🔵 Включаем Bluetooth..."
    sudo rfkill unblock bluetooth
    sudo systemctl enable bluetooth
    sudo systemctl start bluetooth
    echo "✅ Bluetooth включен"
else
    echo "ℹ️  Bluetooth не найден, пропускаем"
fi



# Настройка .env файла, сейчас будет перечисление переменных с дефолтными значениями и запрос на ввод
if [ ! -f .env ]; then
    echo "⚙️ Настройка .env файла..."
    read -p "Введите окружение (по умолчанию DEV): " ENV
    ENV=${ENV:-DEV}
    read -p "Введите URL синхронизационного сервиса (по умолчанию http://sync_service:8080): " SYNC_SERVICE_URL
    SYNC_SERVICE_URL=${SYNC_SERVICE_URL:-http://sync_service:8080}
    read -p "Введите тип брокера Zigbee (по умолчанию mqtt): " ZIGBEE_BROKER
    ZIGBEE_BROKER=${ZIGBEE_BROKER:-mqtt}
    read -p "Введите порт брокера Zigbee (по умолчанию 1883): " ZIGBEE_PORT
    ZIGBEE_PORT=${ZIGBEE_PORT:-1883}
    read -p "Введите URL удаленного сервиса (по умолчанию https://api.smart-home-pnz.ru): " REMOTE_SERVER_URL
    REMOTE_SERVER_URL=${REMOTE_SERVER_URL:-https://api.smart-home-pnz.ru}
    read -p "Введите IP контроллера Лого (по умолчанию 192.168.1.108): " LOGO_CONTROLLER_IP
    LOGO_CONTROLLER_IP=${LOGO_CONTROLLER_IP:-192.168.1.108}
    read -p "Введите URL Vosk сервера (по умолчанию http://vosk-server:2700): " VOSK_URL
    VOSK_URL=${VOSK_URL:-http://vosk-server:2700}
    read -p "Введите URL RHVoice сервера (по умолчанию http://rhvoice-server:2800): " RHVOICE_URL
    RHVOICE_URL=${RHVOICE_URL:-http://rhvoice-server:2800}
    read -p "Введите адаптер Zigbee (по умолчанию ezsp): " ZIGBEE_ADAPTER
    ZIGBEE_ADAPTER=${ZIGBEE_ADAPTER:-ezsp}
    read -p "Введите путь к Zigbee устройству (по умолчанию /dev/ttyUSB0): " ZIGBEE_ADAPTER_PORT
    ZIGBEE_ADAPTER_PORT=${ZIGBEE_ADAPTER_PORT:-/dev/ttyUSB0}
    read -p "Введите Hikvision IP (по умолчанию 192.168.1.88): " HIKVISION_IP
    HIKVISION_IP=${HIKVISION_IP:-192.168.1.88}
    read -p "Введите Hikvision пользователя (по умолчанию admin): " HIKVISION_USER
    HIKVISION_USER=${HIKVISION_USER:-admin}
    read -p "Введите Hikvision пароль (по умолчанию 565758Ss): " HIKVISION_PASSWORD
    HIKVISION_PASSWORD=${HIKVISION_PASSWORD:-565758Ss}
    cat <<EOF > .env
# Окружение: DEV или PROD
ENV=$ENV
# URL синхронизационного сервиса
SYNC_SERVICE_URL=$SYNC_SERVICE_URL
# Тип брокера Zigbee (mqtt или другие)
ZIGBEE_BROKER=$ZIGBEE_BROKER
# Порт брокера Zigbee
ZIGBEE_PORT=$ZIGBEE_PORT
# URL удаленного сервиса
REMOTE_SERVER_URL=$REMOTE_SERVER_URL
# IP контроллера Лого
LOGO_CONTROLLER_IP=$LOGO_CONTROLLER_IP
# URL Vosk сервера
VOSK_URL=$VOSK_URL
# URL RHVoice сервера
RHVOICE_URL=$RHVOICE_URL
# Адаптер Zigbee (zstack для белого, ezsp для черного от orange pi)
ZIGBEE_ADAPTER=$ZIGBEE_ADAPTER
# Hikvision IP
HIKVISION_IP=$HIKVISION_IP
# Hikvision пользователь
HIKVISION_USER=$HIKVISION_USER
# Hikvision пароль
HIKVISION_PASSWORD=$HIKVISION_PASSWORD
EOF
    echo "✅ .env файл создан"
else
    echo "✅ .env файл уже существует, пропускаем настройку"
fi

# Запуск Docker Compose
echo "🚀 Запускаю Docker Compose..."
# Пробуем docker compose, если не получается - с sudo
if ! docker compose up -d 2>/dev/null; then
    sudo docker compose up -d
fi
echo "✅ Сервисы запущены"

echo "🍊 Сервер запущен и готов к использованию!
Команды для управления:
  - Просмотр логов: docker compose logs -f
  - Остановка сервисов: docker compose down
  - Перезапуск сервисов: docker compose restart"

