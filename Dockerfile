FROM maven:3.9.4-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package

FROM tomcat:10-jdk17
COPY --from=build /app/target/holamundo_java.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]