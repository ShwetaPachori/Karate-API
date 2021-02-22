FROM maven:3.6.3-jdk-11

WORKDIR /usr/scr/app

COPY pom.xml /usr/scr/app

COPY ./src/test/java  /usr/scr/app/src/test/java

CMD mvn test