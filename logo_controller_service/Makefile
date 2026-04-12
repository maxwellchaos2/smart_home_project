# Полный деплой всех сервисов и конфигурации
deploy:
	@DOCKER_BUILDKIT=1 docker build --secret id=github_token,src=.github_token -t logo_controller_service:latest .
	@docker tag logo_controller_service:latest registry.smart-home-pnz.ru/logo_controller_service:latest
	@docker push registry.smart-home-pnz.ru/logo_controller_service:latest


tag_latest_as_stable:
	@docker tag registry.smart-home-pnz.ru/logo_controller_service:latest registry.smart-home-pnz.ru/logo_controller_service:stable
	@docker push registry.smart-home-pnz.ru/logo_controller_service:stable