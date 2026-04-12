# Полный деплой всех сервисов и конфигурации
deploy:
	@DOCKER_BUILDKIT=1 docker build --secret id=github_token,src=.github_token -t sync_service:latest .
	@docker tag sync_service:latest registry.smart-home-pnz.ru/sync_service:latest
	@docker push registry.smart-home-pnz.ru/sync_service:latest


tag_latest_as_stable:
	@docker tag registry.smart-home-pnz.ru/sync_service:latest registry.smart-home-pnz.ru/sync_service:stable
	@docker push registry.smart-home-pnz.ru/sync_service:stable



tag_latest_as_control_box_hub-stable:
	@docker tag registry.smart-home-pnz.ru/sync_service:latest registry.smart-home-pnz.ru/sync_service:control_box_hub-stable
	@docker push registry.smart-home-pnz.ru/sync_service:control_box_hub-stable