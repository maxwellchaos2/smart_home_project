# syntax=docker/dockerfile:1.4
FROM dart:3.9 AS build

# Copy app source code (except anything in .dockerignore) and AOT compile app.
WORKDIR /app

# Установка git и ssh клиента
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

COPY . .

# Монтируем файл с токеном безопасно
RUN --mount=type=secret,id=github_token \
    mkdir -p ~/.config && \
    echo "machine github.com login USERNAME password $(cat /run/secrets/github_token)" > ~/.netrc && \
    dart pub get && \
    rm ~/.netrc

RUN dart compile exe bin/server.dart -o bin/server

# Build minimal serving image from AOT-compiled `/server`
# and the pre-built AOT-runtime in the `/runtime/` directory of the base image.
FROM scratch
COPY --from=build /runtime/ /
COPY --from=build /app/bin/server /app/bin/

# Start server.
CMD ["/app/bin/server"]
