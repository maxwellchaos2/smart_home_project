# syntax=docker/dockerfile:1.4

#########################################
# Stage 1: Build stage
#########################################
FROM dart:3.9 AS build

WORKDIR /app

# Устанавливаем зависимости только для сборки
RUN rm -rf /var/lib/apt/lists/* /var/cache/apt/* /tmp/* \
    && apt-get update -o Acquire::AllowInsecureRepositories=true \
    && apt-get download wget xz-utils \
    && dpkg -i --force-depends *.deb \
    && apt-get install -f -y \
    && rm -f *.deb \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/* /tmp/*

COPY . .

# Монтируем секрет с токеном GitHub безопасно
RUN --mount=type=secret,id=github_token \
    mkdir -p ~/.config && \
    echo "machine github.com login USERNAME password $(cat /run/secrets/github_token)" > ~/.netrc && \
    dart pub get && \
    rm ~/.netrc

# Компиляция Dart приложения в исполняемый файл
RUN dart compile exe bin/server.dart -o bin/server

#########################################
# Stage 2: Minimal runtime
#########################################
FROM debian:bookworm-slim

WORKDIR /app
RUN mkdir -p /app/bin /app/voices

# Устанавливаем только необходимые runtime зависимости
# И сразу чистим кэш для экономии места
RUN rm -rf /var/lib/apt/lists/* /var/cache/apt/* /tmp/* \
    && apt-get update -o Acquire::AllowInsecureRepositories=true \
    && mkdir -p /tmp/debs && cd /tmp/debs \
    && apt-get download --allow-unauthenticated \
    ca-certificates openssl \
    alsa-utils \
    sox \
    libsox-fmt-all \
    libasound2 \
    libsox3 \
    libltdl7 \
    libsndfile1 \
    libflac12 \
    libmp3lame0 \
    libvorbis0a \
    libvorbisenc2 \
    libogg0 \
    libopus0 \
    libsox-fmt-base \
    libsox-fmt-alsa \
    libpng16-16 \
    libgomp1 \
    libid3tag0 \
    libmad0 \
    libmagic1 \
    libmagic-mgc \
    libgsm1 \
    && dpkg -i --force-all *.deb 2>&1 | tee /tmp/dpkg.log || true \
    && cd /tmp/debs \
    && apt-get download --allow-unauthenticated \
    $(awk '/depends on/ {for(i=1;i<=NF;i++) if($i~/^[a-z]/) print $i}' /tmp/dpkg.log | sort -u | head -30) \
    && dpkg -i --force-all *.deb || true \
    && cd /app \
    && rm -rf /tmp/debs /tmp/dpkg.log \
    && update-ca-certificates || true \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/cache/apt/*

RUN which arecord || echo "arecord not found"

# Копируем скомпилированный сервер и голосовые файлы
COPY --from=build /app/bin/server /app/bin/
COPY --from=build /app/voices/ /app/voices/

# Права доступа
RUN chmod +x /app/bin/server \
    && find /app/voices -type f -exec chmod 644 {} \; \
    && find /app/voices -type d -exec chmod 755 {} \;

CMD ["/app/bin/server"]
