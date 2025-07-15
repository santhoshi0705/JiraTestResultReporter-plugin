# Use official Maven image with JDK 11 (or your required Java version)
FROM maven:3.9.4-eclipse-temurin-11

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven project files (pom.xml and source code)
COPY . .

# Run mvn compile to compile the project
RUN mvn compile

# By default, run nothing (you can override this if you want to run something)
CMD ["bash"]
