FROM eclipse-temurin:17-jdk-alpine as build

WORKDIR /app

COPY . .

RUN chmod +x ./gradlew && ./gradlew build -x test --no-daemon

FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

COPY --from=build /app/build/libs/*.jar /app/notificacao.jar

EXPOSE 8082

CMD ["java", "-jar", "/app/notificacao.jar"]


