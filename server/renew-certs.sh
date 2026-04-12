#!/bin/bash

# Скрипт для обновления SSL сертификатов

echo "Обновление SSL сертификатов..."

# Обновляем сертификаты
docker compose run --rm certbot renew --webroot -w /var/www/certbot

# Проверяем, были ли обновлены сертификаты
if [ $? -eq 0 ]; then
    echo "Сертификаты успешно обновлены. Сигнализируем nginx о перезагрузке..."
    # Создаем файл-флаг для перезагрузки nginx
    docker compose run --rm --volume nginx-reload:/tmp/nginx-reload alpine:latest touch /tmp/nginx-reload/reload
    echo "Сигнал отправлен nginx для перезагрузки конфигурации."
else
    echo "Ошибка обновления сертификатов."
    exit 1
fi