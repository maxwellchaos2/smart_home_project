
load-dockers:
	@docker load -i scenarios_service.tar
	@docker load -i sync_service.tar
	@docker load -i zigbee_service.tar
	@docker load -i logo_controller_service.tar

up: 
	@docker compose up -d

down:
	@docker compose down

up-db:
	@docker compose up -d db

# SSH настройка
setup-ssh:
	@chmod +x scripts/setup/setup-ssh.sh
	@./scripts/setup/setup-ssh.sh

# Сборка Vosk для ARM64
build-vosk-arm64:
	@chmod +x scripts/build/build-native-vosk.sh
	@./scripts/build/build-native-vosk.sh

# Сборка Vosk малой модели для ARM64
build-vosk-small-arm64:
	@chmod +x scripts/build/build-native-vosk-small.sh
	@./scripts/build/build-native-vosk-small.sh

# Деплой отдельного сервиса
deploy-service:
	@chmod +x scripts/deploy/deploy-service.sh
	@./scripts/deploy/deploy-service.sh $(SERVICE)

# Полный деплой всех сервисов и конфигурации
deploy-all:
	@chmod +x scripts/deploy/deploy-all.sh
	@./scripts/deploy/deploy-all.sh

# Универсальный полный деплой с параметрами
deploy-full:
	@chmod +x scripts/deploy/full-deploy.sh
	@./scripts/deploy/full-deploy.sh $(REMOTE_PATH) $(REMOTE_HOST) $(REMOTE_USER)

# Сборка и деплой всех сервисов
build-deploy-services:
	@chmod +x scripts/deploy/build-and-deploy-services.sh
	@./scripts/deploy/build-and-deploy-services.sh

# Запуск сервера
start-server:
	@chmod +x scripts/server/start-server.sh
	@./scripts/server/start-server.sh

# Установить права выполнения на все .sh файлы
chmod-scripts:
	@find scripts -name "*.sh" -type f -exec chmod +x {} \;
	@echo "✅ Права выполнения установлены для всех скриптов"

# Проверка SSH agent
check-ssh:
	@if [ -z "$$SSH_AUTH_SOCK" ]; then \
		echo "⚠️  SSH agent не запущен. Запускаю..."; \
		eval "$$(ssh-agent -s)"; \
		ssh-add ~/.ssh/id_rsa; \
	else \
		echo "✅ SSH agent активен"; \
	fi

# Деплой с проверкой SSH
deploy-all-safe: check-ssh deploy-all