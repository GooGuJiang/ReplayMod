FROM eclipse-temurin:17-jdk AS build
RUN apt-get update && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*
WORKDIR /opt/ReplayMod
COPY . .
RUN ./gradlew --parallel

FROM scratch AS export
COPY --from=build /opt/ReplayMod/versions /versions
