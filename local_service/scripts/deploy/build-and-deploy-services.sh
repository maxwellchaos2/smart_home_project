# #!/bin/bash

# # Скрипт для деплоя voice_assistant_service
# # Вызывает универсальный скрипт deploy-service.sh

# # Цвета для вывода
# RED='\033[0;31m'
# GREEN='\033[0;32m'
# YELLOW='\033[1;33m'
# BLUE='\033[0;34m'
# NC='\033[0m' # No Color

# echo_info() {
#     echo -e "${BLUE}ℹ️  $1${NC}"
# }

# echo_success() {
#     echo -e "${GREEN}✅ $1${NC}"
# }

# echo_error() {
#     echo -e "${RED}❌ $1${NC}"
# }

# echo_warning() {
#     echo -e "${YELLOW}⚠️  $1${NC}"
# }


# SERVICE_NAMES=(
#     "scenarios_service"
#     "voice_assistant_service"
#     "sync_service"
#     "zigbee_service"
#     "logo_controller_service"
#     "hikvision_controller_service"
# )
# # Проверяем параметры
# if [ -z "$1" ]; then
#     # Вводим параметры подключения к удаленному серверу
#     read -p "Введите IP-адрес удаленного сервера: " REMOTE_HOST
#     while [ -z "$REMOTE_HOST" ]; do
#         echo "❌ IP-адрес удаленного сервера не может быть пустым. Пожалуйста, введите IP-адрес."
#         read -p "Введите IP-адрес удаленного сервера: " REMOTE_HOST
#     done

#     read -p "Введите имя пользователя на удаленном сервере: " REMOTE_USER
#     while [ -z "$REMOTE_USER" ]; do
#         echo "❌ Имя пользователя не может быть пустым. Пожалуйста, введите имя пользователя."
#         read -p "Введите имя пользователя на удаленном сервере: " REMOTE_USER
#     done
# else
#     REMOTE_HOST="$1"
#     REMOTE_USER="$2"
# fi


# # Получаем путь к директории со скриптом
# SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# # Вызываем универсальный скрипт деплоя с параметрами
# for SERVICE_NAME in "${SERVICE_NAMES[@]}"; do
#     echo_info "🔄 Деплою сервис: ${SERVICE_NAME}"
#     "${SCRIPT_DIR}/deploy-service.sh" "${SERVICE_NAME}" "${REMOTE_HOST}" "${REMOTE_USER}"
#     if [ $? -eq 0 ]; then
#         echo_success "✅ ${SERVICE_NAME} задеплоен успешно"
#     else
#         echo_error "❌ Ошибка деплоя ${SERVICE_NAME}"
#         exit 1
#     fi
# done

# echo_success "🎉 Все сервисы задеплоены успешно!"