#!/bin/bash

# Скрипт полного деплоя с предустановленными параметрами
# Вызывает универсальный скрипт full-deploy.sh

REMOTE_PATH="/home/zotov/smart_home"
REMOTE_HOST="192.168.1.133"
REMOTE_USER="zotov"


# Получаем путь к директории со скриптом
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Вызываем универсальный скрипт полного деплоя
exec "${SCRIPT_DIR}/full-deploy.sh" "${REMOTE_PATH}" "${REMOTE_HOST}" "${REMOTE_USER}"
