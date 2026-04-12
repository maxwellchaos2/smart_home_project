#!/bin/bash

SERVICE_NAME="voice_assistant_service"
REMOTE_HOST="192.168.1.53"
REMOTE_USER="root"
REMOTE_PATH="/office"

echo "📋 Показываю логи ${SERVICE_NAME}..."

ssh ${REMOTE_USER}@${REMOTE_HOST} << EOF
    cd ${REMOTE_PATH}
    docker compose logs -f --tail=50 ${SERVICE_NAME}
EOF