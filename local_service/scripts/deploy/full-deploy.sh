#!/bin/bash

set -e # Прекратить выполнение при ошибке

# Проверяем параметры
if [ -z "$1" ]; then
    echo "❌ Ошибка: Необходимо указать путь к папке на сервере"
    echo "Использование: $0 <REMOTE_PATH> [REMOTE_HOST] [REMOTE_USER]"
    echo "Пример: $0 /home/acer/smart_home"
    echo "Пример: $0 /home/acer/smart_home 192.168.0.140 acer"
    echo ""
    echo "Также можно использовать переменные окружения:"
    echo "  REMOTE_HOST - адрес удаленного хоста"
    echo "  REMOTE_USER - имя пользователя"
    exit 1
fi

# Конфигурация
REMOTE_PATH="$1"
REMOTE_HOST="${2:-${REMOTE_HOST:-192.168.0.140}}"
REMOTE_USER="${3:-${REMOTE_USER:-acer}}"

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

echo_info "🚀 Начинаю полный деплой на ${REMOTE_HOST} в папку ${REMOTE_PATH}"

# 1. Проверяем SSH подключение
echo_info "🔐 Проверяю SSH подключение..."
if ! ssh -o ConnectTimeout=5 -o BatchMode=yes ${REMOTE_USER}@${REMOTE_HOST} exit 2>/dev/null; then
    echo_error "SSH подключение не работает!"
    echo_info "Запустите сначала setup-ssh.sh"
    exit 1
fi
echo_success "SSH подключение OK"

# 3. Создаем папку на сервере
echo_info "📁 Создаю папку на сервере..."
ssh ${REMOTE_USER}@${REMOTE_HOST} "mkdir -p ${REMOTE_PATH}"
echo_success "Папка ${REMOTE_PATH} создана"

# 4. Копируем файлы и папки на сервер
echo_info "📤 Копирую конфигурационные файлы..."

# Файлы для копирования из корневой директории
FILES_TO_COPY=(
    "compose.yaml"
    "Makefile"
    "README.md"
)

# Копируем отдельные файлы из корневой директории
cd "${ROOT_DIR}"
for file in "${FILES_TO_COPY[@]}"; do
    if [ -f "./$file" ]; then
        echo_info "Копирую $file..."
        if scp -C "./$file" "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_PATH}/$file"; then
            echo_success "$file скопирован"
        else
            echo_error "Ошибка копирования $file"
            exit 1
        fi
    else
        echo_warning "$file не найден, пропускаю"
    fi
done

# Копируем папку scripts целиком
echo_info "📁 Копирую папку scripts..."
if scp -C -r "./scripts" "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_PATH}/"; then
    echo_success "Папка scripts скопирована"
else
    echo_error "Ошибка копирования папки scripts"
    exit 1
fi

# Папки для копирования
DIRS_TO_COPY=(
    "mosquitto"
    "zigbee2mqtt"
)

# Копируем папки целиком
for dir in "${DIRS_TO_COPY[@]}"; do
    if [ -d "./$dir" ]; then
        echo_info "Копирую папку $dir..."
        if scp -C -r "./$dir" "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_PATH}/"; then
            echo_success "Папка $dir скопирована"
        else
            echo_error "Ошибка копирования папки $dir"
            exit 1
        fi
    else
        echo_warning "Папка $dir не найдена, пропускаю"
    fi
done

# 5. Делаем скрипты исполняемыми на сервере
echo_info "🔧 Настраиваю права доступа..."
ssh ${REMOTE_USER}@${REMOTE_HOST} "chmod +x ${REMOTE_PATH}/scripts/server/start-server.sh"
ssh ${REMOTE_USER}@${REMOTE_HOST} "find ${REMOTE_PATH}/scripts -name '*.sh' -type f -exec chmod +x {} \;"
echo_success "Права доступа настроены"

# 6. Запускаем start-server.sh на сервере
echo_info "🚀 Запускаю start-server.sh на сервере..."
ssh ${REMOTE_USER}@${REMOTE_HOST} << EOF
    set -e
    cd ${REMOTE_PATH}
    
    echo "📍 Текущая директория: \$(pwd)"
    echo "📋 Содержимое директории:"
    ls -la
    
    echo ""
    echo "� Устанавливаю права выполнения на скрипты..."
    chmod +x scripts/server/start-server.sh
    
    echo "�🚀 Запускаю start-server.sh..."
    if [ -f "./scripts/server/start-server.sh" ]; then
        ./scripts/server/start-server.sh
    else
        echo "❌ start-server.sh не найден в ${REMOTE_PATH}/scripts/server/"
        exit 1
    fi
EOF

if [ $? -eq 0 ]; then
    echo_success "🎉 Полный деплой завершен успешно!"
    echo_info "Сервер запущен в папке ${REMOTE_PATH} на хосте ${REMOTE_HOST}"
else
    echo_error "Ошибка при запуске start-server.sh на сервере"
    exit 1
fi
