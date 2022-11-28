FROM adoptopenjdk/openjdk11
RUN mvn -B package --file pom.xml

FROM adoptopenjdk/openjdk11
COPY target/onlinestore-0.0.1-SNAPSHOT.jar /app/application.jar
ENTRYPOINT ["java","-jar","/app/application.jar"]