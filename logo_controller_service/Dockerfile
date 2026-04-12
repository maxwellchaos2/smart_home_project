# syntax=docker/dockerfile:1.4
FROM dart:3.9 AS build

RUN apt-get update \
    && apt-get install -y git wget p7zip-full build-essential \
    && wget https://downloads.sourceforge.net/project/snap7/1.4.2/snap7-full-1.4.2.7z \
    && 7z x snap7-full-1.4.2.7z \
    && cd snap7-full-1.4.2/build/unix \
    && make -f x86_64_linux.mk \
    && cp ../bin/x86_64-linux/libsnap7.so /usr/local/lib/ \
    && cd / \
    && rm -rf snap7-full-1.4.2.7z snap7-full-1.4.2

WORKDIR /app
COPY . .

# Монтируем файл с токеном безопасно
RUN --mount=type=secret,id=github_token \
    mkdir -p ~/.config && \
    echo "machine github.com login USERNAME password $(cat /run/secrets/github_token)" > ~/.netrc && \
    dart pub get && \
    rm ~/.netrc

RUN dart compile exe bin/server.dart -o bin/server

FROM debian:stable-slim
RUN apt-get update && apt-get install -y ca-certificates && rm -rf /var/lib/apt/lists/*
# COPY --from=build /runtime/ /
COPY --from=build /usr/local/lib/libsnap7.so /usr/local/lib/
COPY --from=build /app/bin/server /app/bin/
RUN ldconfig
CMD ["/app/bin/server"]
