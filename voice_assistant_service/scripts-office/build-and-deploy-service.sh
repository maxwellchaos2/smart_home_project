#!/bin/bash

set -e # Прекратить выполнение при ошибке

# Конфигурация
SERVICE_NAME="voice_assistant_service"
IMAGE_NAME="${SERVICE_NAME}:latest"
TAR_NAME="${SERVICE_NAME}.tar"
REMOTE_HOST="192.168.1.53"
REMOTE_USER="root"
REMOTE_PATH="/office"
BUILD_CONTEXT="."

# Цвета для вывода
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

echo_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

echo_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

echo_error() {
    echo -e "${RED}❌ $1${NC}"
}

# Функция очистки временных файлов
cleanup() {
    if [ -f "${TAR_NAME}" ]; then
        rm -f "${TAR_NAME}"
        echo_info "Удален локальный ${TAR_NAME}"
    fi
}

# Ловим сигналы для очистки
trap cleanup EXIT

echo_info "🚀 Начинаю деплой ${SERVICE_NAME} на ${REMOTE_HOST}"

# 1. Проверяем SSH подключение
echo_info "🔐 Проверяю SSH подключение..."
if ! ssh -o ConnectTimeout=5 -o BatchMode=yes ${REMOTE_USER}@${REMOTE_HOST} exit 2>/dev/null; then
    echo_error "SSH подключение не работает!"
    echo_info "Запустите сначала: ./scripts/setup-ssh.sh"
    exit 1
fi
echo_success "SSH подключение OK"

# 2. Сборка Docker образа
echo_info "🔨 Собираю Docker образ..."
if docker build -t ${IMAGE_NAME} ${BUILD_CONTEXT}; then
    echo_success "Образ собран успешно"
else
    echo_error "Ошибка сборки образа"
    exit 1
fi

# 3. Сохранение образа в tar
echo_info "📦 Сохраняю образ в tar архив..."
if docker save -o ${TAR_NAME} ${IMAGE_NAME}; then
    echo_success "Образ сохранен в ${TAR_NAME}"
    TAR_SIZE=$(du -h ${TAR_NAME} | cut -f1)
    echo_info "Размер архива: ${TAR_SIZE}"
else
    echo_error "Ошибка сохранения образа"
    exit 1
fi

# 4. Копирование на сервер
echo_info "📤 Копирую образ на сервер..."
if scp -C ${TAR_NAME} ${REMOTE_USER}@${REMOTE_HOST}:~/${TAR_NAME}; then
    echo_success "Образ скопирован на сервер"
else
    echo_error "Ошибка копирования на сервер"
    exit 1
fi

# 5. Удаляем локальный tar
rm -f ${TAR_NAME}
echo_info "Удален локальный ${TAR_NAME}"

# 6. Выполняем команды на сервере
echo_info "🔄 Обновляю сервис на сервере..."
ssh ${REMOTE_USER}@${REMOTE_HOST} << EOF
    set -e
    
    echo "📥 Загружаю Docker образ..."
    if docker load -i ~/${TAR_NAME}; then
        echo "✅ Образ загружен"
    else
        echo "❌ Ошибка загрузки образа"
        exit 1
    fi
    
    echo "🗑️  Удаляю временный файл..."
    rm -f ~/${TAR_NAME}
    
    echo "📁 Перехожу в директорию..."
    cd ${REMOTE_PATH}
    
    echo "🛑 Останавливаю старый контейнер..."
    docker compose down ${SERVICE_NAME} || echo "Контейнер уже остановлен"
    
    echo "🚀 Запускаю новый контейнер..."
    if docker compose up -d ${SERVICE_NAME}; then
        echo "✅ Сервис запущен"
    else
        echo "❌ Ошибка запуска сервиса"
        exit 1
    fi
    
    echo "⏰ Жду запуска сервиса..."
    sleep 3
    
    echo "📊 Проверяю статус сервиса..."
    docker compose ps ${SERVICE_NAME}
    
    echo "🎉 Деплой завершен успешно!"
EOF

if [ $? -eq 0 ]; then
    echo_success "🎉 Деплой ${SERVICE_NAME} завершен успешно!"
    echo_info "📋 Показать логи: ./scripts/logs.sh"
    echo_info "🔄 Перезапустить: ./scripts/restart.sh"
else
    echo_error "Ошибка выполнения команд на сервере"
    exit 1
fi