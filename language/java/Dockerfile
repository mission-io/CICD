FROM maven:3.6.1 AS build
WORKDIR /opt/workspace
# Copy All source code to workspace
COPY . ./
RUN mvn install

FROM openjdk:8-jdk-alpine
RUN addgroup -S svc-group && adduser -S svc-user -G svc-group
USER svc-user:svc-group
COPY --from=build /opt/workspace/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.jar"]
