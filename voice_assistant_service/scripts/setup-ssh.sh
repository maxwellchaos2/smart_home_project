#!/bin/bash

# Настройка SSH ключей для автоматического входа
REMOTE_HOST="192.168.0.140"
REMOTE_USER="acer"

echo "🔐 Настройка SSH ключей для ${REMOTE_USER}@${REMOTE_HOST}"

# Генерируем SSH ключ если его нет
if [ ! -f ~/.ssh/id_rsa ]; then
    echo "🔑 Генерирую SSH ключ..."
    ssh-keygen -t rsa -b 4096 -C "$(whoami)@$(hostname)" -f ~/.ssh/id_rsa -N ""
fi

# Копируем публичный ключ на сервер
echo "📤 Копирую SSH ключ на сервер..."
ssh-copy-id -i ~/.ssh/id_rsa.pub ${REMOTE_USER}@${REMOTE_HOST}

echo "✅ SSH настроен! Теперь можно подключаться без пароля"

# Тестируем подключение
echo "🧪 Тестирую подключение..."
ssh ${REMOTE_USER}@${REMOTE_HOST} "echo 'Подключение работает!'"

echo "🎉 Готово! Теперь можно использовать скрипт деплоя"