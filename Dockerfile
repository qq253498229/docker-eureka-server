FROM maven:3-jdk-8-alpine

COPY pom.xml ./pom.xml
RUN mvn package -P alibaba-maven-repository -Dmaven.test.skip=true
COPY src ./src
RUN mvn package -P alibaba-maven-repository -Dmaven.test.skip=true

FROM openjdk:8-jre-alpine
ENV TZ=Asia/Shanghai
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk add tzdata \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring

COPY --from=0 /target/app.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]