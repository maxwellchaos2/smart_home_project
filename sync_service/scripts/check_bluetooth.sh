#!/bin/bash

echo "🔍 Проверка Bluetooth конфигурации..."

# Проверяем наличие rfkill
if command -v rfkill >/dev/null 2>&1; then
    echo "📡 Проверяем RF-kill статус..."
    rfkill list bluetooth
    
    # Разблокируем Bluetooth если заблокирован
    echo "🔓 Разблокируем Bluetooth устройства..."
    rfkill unblock bluetooth || echo "⚠️  Не удалось разблокировать через rfkill"
else
    echo "⚠️  rfkill не найден, пропускаем проверку RF блокировки"
fi

# Проверяем наличие hci0 адаптера
if [ -d "/sys/class/bluetooth/hci0" ]; then
    echo "✅ Bluetooth адаптер hci0 найден"
else
    echo "❌ Bluetooth адаптер hci0 не найден"
    exit 1
fi

# Проверяем D-Bus
if [ -S "/var/run/dbus/system_bus_socket" ]; then
    echo "✅ D-Bus система доступна"
else
    echo "❌ D-Bus система недоступна"
    exit 1
fi

# Проверяем, запущен ли bluetoothd процесс
if pgrep -x "bluetoothd" > /dev/null; then
    echo "✅ Служба bluetoothd запущена"
else
    echo "⚠️  Служба bluetoothd не найдена, но это нормально в контейнере"
fi

# Проверяем доступность hciconfig
if command -v hciconfig >/dev/null 2>&1; then
    echo "🔧 Проверяем статус Bluetooth адаптера через hciconfig..."
    hciconfig hci0 up 2>/dev/null || echo "⚠️  hciconfig не смог активировать hci0"
    hciconfig hci0 2>/dev/null || echo "⚠️  Не удалось получить статус через hciconfig"
else
    echo "⚠️  hciconfig недоступен, используем только D-Bus"
fi

# Проверяем bluetoothctl
if command -v bluetoothctl >/dev/null 2>&1; then
    echo "🔧 Проверяем bluetoothctl..."
    timeout 5s bash -c 'echo -e "show\nquit" | bluetoothctl' 2>/dev/null || echo "⚠️  bluetoothctl недоступен или таймаут"
else
    echo "⚠️  bluetoothctl недоступен"
fi

# Дополнительная диагностика через dbus
echo "📊 Диагностика D-Bus Bluetooth интерфейсов..."
if command -v dbus-send >/dev/null 2>&1; then
    # Проверяем, доступен ли org.bluez через D-Bus
    dbus-send --system --print-reply --dest=org.bluez / org.freedesktop.DBus.Peer.Ping 2>/dev/null && \
        echo "✅ org.bluez доступен через D-Bus" || \
        echo "⚠️  org.bluez недоступен через D-Bus"
else
    echo "⚠️  dbus-send недоступен для диагностики"
fi

echo "🎯 Скрипт проверки Bluetooth завершен!"
echo "📋 Сводка: BLE сервер может работать через прямое D-Bus подключение"