

PORT=8080

build:
	@docker build -t server .


run: 
	@docker run -p $(PORT):$(PORT) server


up: 
	@docker compose up -d --build

down:
	@docker compose down


up-db:
	@docker compose up -d db


up-debug: 
	@docker compose -f compose-debug.yaml up -d --build


# create admin
# docker compose exec db psql -U postgres -d smart_home -c "CREATE EXTENSION IF NOT EXISTS pgcrypto; INSERT INTO users (name, type, username, password_hash) VALUES ('Admin', 'admin', 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918');"