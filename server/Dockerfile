# Use latest stable channel SDK.
FROM dart:stable AS build

# Copy app source code (except anything in .dockerignore) and AOT compile app.
WORKDIR /app
COPY . .
RUN dart pub get
RUN dart compile exe bin/server.dart -o bin/server

# Build minimal serving image from AOT-compiled `/server`
# and the pre-built AOT-runtime in the `/runtime/` directory of the base image.
FROM scratch
WORKDIR /app
COPY --from=build /runtime/ /
COPY --from=build /app/bin/server /app/bin/
COPY --from=build /app/assets /app/assets

# Start server.
EXPOSE 8080
CMD ["/app/bin/server"]
