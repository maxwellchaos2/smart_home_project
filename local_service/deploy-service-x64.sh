#!/bin/bash

set -e # Прекратить выполнение при ошибке

# Проверяем, что передан SERVICE_NAME
if [ -z "$1" ]; then
    echo "❌ Ошибка: Необходимо указать SERVICE_NAME"
    echo "Использование: $0 <SERVICE_NAME> [REMOTE_HOST] [REMOTE_USER]"
    echo "Пример: $0 voice_assistant_service"
    echo "Пример: $0 voice_assistant_service 192.168.0.140 acer"
    echo ""
    echo "Также можно использовать переменные окружения:"
    echo "  REMOTE_HOST - адрес удаленного хоста"
    echo "  REMOTE_USER - имя пользователя"
    exit 1
fi

# Конфигурация
SERVICE_NAME="$1"
IMAGE_NAME="${SERVICE_NAME}:latest"
TAR_NAME="${SERVICE_NAME}.tar"

# Получаем REMOTE_HOST из параметра, переменной окружения или используем по умолчанию
REMOTE_HOST="${2:-${REMOTE_HOST:-192.168.0.140}}"

# Получаем REMOTE_USER из параметра, переменной окружения или используем по умолчанию
REMOTE_USER="${3:-${REMOTE_USER:-acer}}"

BUILD_CONTEXT="../$SERVICE_NAME/"

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
    echo_info "Запустите сначала setup-ssh.sh"
    exit 1
fi
echo_success "SSH подключение OK"

# 2. Проверяем существование директории сборки
if [ ! -d "${BUILD_CONTEXT}" ]; then
    echo_error "Директория ${BUILD_CONTEXT} не найдена!"
    exit 1
fi

echo_info "🔧 Подготавливаю buildx builder..."
if ! docker buildx inspect multiplatform &>/dev/null; then
    echo_info "Создаю новый builder multiplatform..."
    docker buildx create --name multiplatform --use
else
    echo_info "Использую существующий builder multiplatform..."
    docker buildx use multiplatform
fi

# 3. Сборка Docker образа для AMD64/x86_64
echo_info "🔨 Собираю Docker образ для AMD64/x86_64..."
if docker buildx build --platform linux/amd64 -t ${IMAGE_NAME} --load ${BUILD_CONTEXT}; then
    echo_success "Образ собран успешно"
    
    # Проверяем архитектуру собранного образа
    IMAGE_ARCH=$(docker inspect ${IMAGE_NAME} --format='{{.Architecture}}' 2>/dev/null || echo "unknown")
    echo_info "Архитектура собранного образа: ${IMAGE_ARCH}"
    
    if [ "${IMAGE_ARCH}" != "amd64" ]; then
        echo_error "Образ собран для неправильной архитектуры: ${IMAGE_ARCH}"
        exit 1
    fi
else
    echo_error "Ошибка сборки образа"
    exit 1
fi


# 4. Сохранение образа в tar
echo_info "📦 Сохраняю образ в tar архив..."
if docker save -o ${TAR_NAME} ${IMAGE_NAME}; then
    echo_success "Образ сохранен в ${TAR_NAME}"
    TAR_SIZE=$(du -h ${TAR_NAME} | cut -f1)
    echo_info "Размер архива: ${TAR_SIZE}"
else
    echo_error "Ошибка сохранения образа"
    exit 1
fi

# 5. Копирование на сервер
echo_info "📤 Копирую образ на сервер..."
if scp -C ${TAR_NAME} ${REMOTE_USER}@${REMOTE_HOST}:~/${TAR_NAME}; then
    echo_success "Образ скопирован на сервер"
else
    echo_error "Ошибка копирования на сервер"
    exit 1
fi

# 6. Удаляем локальный tar
rm -f ${TAR_NAME}
echo_info "Удален локальный ${TAR_NAME}"

# 7. Выполняем команды на сервере с дополнительными проверками
echo_info "🔄 Обновляю сервис на сервере..."
ssh ${REMOTE_USER}@${REMOTE_HOST} << EOF
    set -e
    
    echo "📥 Проверяю установку Docker..."
    if ! command -v docker &> /dev/null; then
        echo "🐳 Docker не найден! Устанавливаю..."
        sudo apt update -qq
        curl -fsSL https://get.docker.com | sudo sh
        sudo usermod -aG docker \$USER
        echo "✅ Docker установлен. Перезайдите в систему или выполните: newgrp docker"
        exit 1
    fi
    
    echo "🗑️  Удаляю старый образ если есть..."
    docker rmi ${IMAGE_NAME} 2>/dev/null || true
    
    echo "📥 Загружаю Docker образ..."
    if docker load -i ~/${TAR_NAME}; then
        echo "✅ Образ загружен"
    else
        echo "❌ Ошибка загрузки образа"
        exit 1
    fi
    
    echo "🔍 Проверяю архитектуру загруженного образа..."
    IMAGE_ARCH=\$(docker inspect ${IMAGE_NAME} --format='{{.Architecture}}' 2>/dev/null || echo "unknown")
    HOST_ARCH=\$(uname -m)
    echo "Архитектура образа: \$IMAGE_ARCH"
    echo "Архитектура хоста: \$HOST_ARCH"
    
    if [ "\$IMAGE_ARCH" != "amd64" ] && [ "\$HOST_ARCH" = "x86_64" ]; then
        echo "❌ Несоответствие архитектур! Образ: \$IMAGE_ARCH, нужен: amd64"
        echo "Попробуйте пересобрать образ с правильной архитектурой"
        exit 1
    fi
    
    echo "🗑️  Удаляю временный файл..."
    rm -f ~/${TAR_NAME}
    
EOF

echo_success "🎉 Деплой ${SERVICE_NAME} завершен успешно!"
