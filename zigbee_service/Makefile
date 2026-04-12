# Полный деплой всех сервисов и конфигурации
deploy:
	@DOCKER_BUILDKIT=1 docker build --secret id=github_token,src=.github_token -t zigbee_service:latest .
	@docker tag zigbee_service:latest registry.smart-home-pnz.ru/zigbee_service:latest
	@docker push registry.smart-home-pnz.ru/zigbee_service:latest

tag_latest_as_stable:
	@docker tag registry.smart-home-pnz.ru/zigbee_service:latest registry.smart-home-pnz.ru/zigbee_service:stable
	@docker push registry.smart-home-pnz.ru/zigbee_service:stable