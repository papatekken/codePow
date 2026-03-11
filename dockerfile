# STAGE 1: Build the React Frontend
#FROM node:18-alpine AS frontend-build
#WORKDIR /app/frontend
#COPY frontend/package*.json ./
#RUN npm install
#COPY frontend/ ./
#RUN npm run build

# STAGE 2: Build the Spring Boot Backend
FROM maven:3.9-eclipse-temurin-17 AS backend-build
WORKDIR /app/backend
COPY backend/pom.xml ./
# Pre-download dependencies to speed up future builds
RUN mvn dependency:go-offline

COPY backend/src ./src
# Copy the React build into Spring Boot's static resources
#COPY --from=frontend-build /app/frontend/dist ./src/main/resources/static
RUN mvn clean package -DskipTests

# STAGE 3: Final Production Image
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
# Copy only the final JAR from the build stage
COPY --from=backend-build /app/backend/target/*.jar app.jar

EXPOSE 8090
ENTRYPOINT ["java", "-jar", "pow.jar"]