FROM maven:3.6.1 AS build
WORKDIR /opt/workspace
COPY . ./
RUN mvn install

FROM openjdk:8-jdk-alpine
RUN addgroup -S hexaware && adduser -S service -G hexaware
USER service:hexaware
COPY --from=build /opt/workspace/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.jar"]
