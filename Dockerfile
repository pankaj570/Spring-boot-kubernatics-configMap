FROM openjdk:8-jdk-alpine
ARG JAR_FILE=target/*.jar
COPY target/customer-service-0.0.1-SNAPSHOT.jar /customer-service.jar
EXPOSE 80
ENTRYPOINT ["java","-jar","/customer-service.jar"]