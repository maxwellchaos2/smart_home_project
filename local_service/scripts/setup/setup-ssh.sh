#!/bin/bash

# Настройка SSH ключей для автоматического входа
REMOTE_HOST="192.168.0.140"
REMOTE_USER="zotov"

echo "🔐 Настройка SSH ключей для ${REMOTE_USER}@${REMOTE_HOST}"

# Проверяем и исправляем проблемы с host key
echo "🔍 Проверяю SSH host key..."
if ssh-keygen -F ${REMOTE_HOST} | grep -q ${REMOTE_HOST}; then
    echo "⚠️  Найден старый host key, удаляю..."
    ssh-keygen -R ${REMOTE_HOST}
    echo "✅ Старый host key удален"
fi

# Генерируем SSH ключ если его нет
if [ ! -f ~/.ssh/id_rsa ]; then
    echo "🔑 Генерирую SSH ключ..."
    ssh-keygen -t rsa -b 4096 -C "$(whoami)@$(hostname)" -f ~/.ssh/id_rsa -N ""
fi

# Добавляем новый host key и копируем публичный ключ
echo "📤 Добавляю новый host key и копирую SSH ключ..."
ssh-copy-id -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa.pub ${REMOTE_USER}@${REMOTE_HOST}

echo "✅ SSH настроен! Теперь можно подключаться без пароля"

# Тестируем подключение
echo "🧪 Тестирую подключение..."
if ssh -o ConnectTimeout=5 ${REMOTE_USER}@${REMOTE_HOST} "echo 'Подключение работает!'"; then
    echo "🎉 Готово! Теперь можно использовать скрипт деплоя"
else
    echo "❌ Ошибка подключения. Проверьте настройки сети и учетные данные"
    exit 1
fi