# Etapa 1: Construcción
FROM maven:3.9-eclipse-temurin-21 AS build

WORKDIR /app

# Copiar o pom.xml e descargar as dependencias
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copiar o código fonte e construír a aplicación
COPY src ./src
RUN mvn clean package -DskipTests

# Etapa 2: Execución
FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

# Copiar o JAR construído desde a etapa anterior
COPY --from=build /app/target/*.jar app.jar

# Expor o porto da aplicación
EXPOSE 8080

# Comando para executar a aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]
