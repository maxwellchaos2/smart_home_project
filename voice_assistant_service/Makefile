# Полный деплой всех сервисов и конфигурации
deploy:
# 	@DOCKER_BUILDKIT=1 docker buildx build  --platform linux/arm64,linux/arm/v7 --secret id=github_token,src=.github_token -t voice_assistant_service:latest .
	@DOCKER_BUILDKIT=1 docker build --secret id=github_token,src=.github_token -t voice_assistant_service:latest .
	@docker tag voice_assistant_service:latest registry.smart-home-pnz.ru/voice_assistant_service:latest
	@docker push registry.smart-home-pnz.ru/voice_assistant_service:latest


tag_latest_as_stable:
	@docker tag registry.smart-home-pnz.ru/voice_assistant_service:latest registry.smart-home-pnz.ru/voice_assistant_service:stable
	@docker push registry.smart-home-pnz.ru/voice_assistant_service:stable