FROM eclipse-temurin:17-jdk
COPY target/*.jar codePow.jar
ENTRYPOINT ["java","-jar","/codePow.jar"]