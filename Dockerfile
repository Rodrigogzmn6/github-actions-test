# Stage 1: Build
# Use a Maven image to compile project
FROM maven:3.9.6-eclipse-temurin-25 AS build
WORKDIR /app

# Copy the dependencies configuration file
COPY pom.xml .
# Download all dependencies
RUN mvn -B -q -DskipTests dependency:go-offline

# Copy sourcecode and compile JAR
COPY src ./src
RUN mvn -B -DskipTests=false clean package

# Stage 2: Run
# Use a lighter image with only the JRE to run the app
FROM eclipse-temurin:25-jre-jammy
WORKDIR /app

# Assign port with env variable
ENV PORT=8080
EXPOSE 8080

# Copy the generated JAR
# Note: The JAR name must match with the one generated on the pom.xml
COPY --from=build /app/target/*.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]