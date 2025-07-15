# Use Maven image with Java 11
FROM maven:3.8.8-openjdk-11-slim AS build

# Set working directory inside the container
WORKDIR /app

# Copy only the Maven files first (to leverage Docker cache)
COPY pom.xml .
COPY src ./src

# Build the project
RUN mvn clean package -DskipTests

# Final image to run the app (optional if you just want the build)
FROM openjdk:11-jre-slim

WORKDIR /app

# Copy the built artifact from the build stage
COPY --from=build /app/target/*.jar ./app.jar
# Or if it's an .hpi plugin, adjust accordingly:
# COPY --from=build /app/target/*.hpi ./plugin.hpi

# Default command: run the jar (adjust if needed)
CMD ["java", "-jar", "app.jar"]
