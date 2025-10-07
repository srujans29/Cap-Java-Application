FROM maven:3.9.5-eclipse-temurin-17 as build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM tomcat:10.1-jdk17-temurin-jammy
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080