FROM eclipse-temurin:17-jdk AS build
WORKDIR /opt/ReplayMod
COPY . .
RUN ./gradlew --parallel

FROM scratch AS export
COPY --from=build /opt/ReplayMod/versions /versions
