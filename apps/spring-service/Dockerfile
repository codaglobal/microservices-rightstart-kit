FROM openjdk:8-jdk-alpine

COPY target/*.jar app.jar

EXPOSE 8888

ENTRYPOINT ["sh", "-c", "java -jar /app.jar"]