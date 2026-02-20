FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

COPY target/*.jar app.jar

EXPOSE ${SPRING_APP_PORT}

ENTRYPOINT ["java","-jar","/app/app.jar"]