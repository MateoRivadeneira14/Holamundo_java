# Usar una imagen de Maven para compilar el proyecto
FROM maven:3.9.4-eclipse-temurin-17 AS build

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar el archivo pom.xml y el código fuente
COPY pom.xml .
COPY src ./src

# Compilar el proyecto y empaquetar el archivo WAR
RUN mvn clean package

# Usar una imagen oficial de Tomcat con JDK 17
FROM tomcat:10-jdk17

# Copiar el archivo WAR a Tomcat
COPY --from=build /app/target/holamundo_java.war /usr/local/tomcat/webapps/

# Exponer el puerto de Tomcat
EXPOSE 8080

# Iniciar Tomcat
CMD ["catalina.sh", "run"]