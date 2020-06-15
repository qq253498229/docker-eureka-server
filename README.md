# Spring Cloud Eureka Server

```bash
docker run -d -p 8761:8761 registry.cn-beijing.aliyuncs.com/codeforfun/eureka-server:latest
```

```bash
docker run -d -p 8761:8761 \
--name eureka \
-e SERVER_PORT=8761 \
-e APPLICATION_NAME=eureka-server \
-e SECURITY_USERNAME=admin \
-e SECURITY_PASSWORD=admin \
-e SERVICE_URL='http://${SECURITY_USERNAME}:${SECURITY_PASSWORD}@localhost:8761/eureka/' \
registry.cn-beijing.aliyuncs.com/codeforfun/eureka-server:latest
```

```yaml
version: "3"
services:
  eureka:
    image: registry.cn-beijing.aliyuncs.com/codeforfun/eureka-server:latest
    environment:
      - APPLICATION_NAME=demo-eureka-server
      - SECURITY_USERNAME=admin
      - SECURITY_PASSWORD=admin
      - SERVICE_URL=http://$${SECURITY_USERNAME}:$${SECURITY_PASSWORD}@localhost:8761/eureka/
    ports:
      - "8761:8761"
```

参数 | 说明
---|---
SERVER_PORT | 对应 spring 中的 `server.port`，默认 `8761`
APPLICATION_NAME | 对应 spring 中的 `spring.application.name`，默认 `eureka-server`
SECURITY_USERNAME | 对应 spring 中的 `spring.security.user.name`，默认 `admin`
SECURITY_PASSWORD | 对应 spring 中的 `spring.security.user.password`，默认 `admin`
SERVICE_URL | 对应 spring 中的 `eureka.client.service-url.defaultZone`，默认 `http://${SECURITY_USERNAME}:${SECURITY_PASSWORD}@localhost:8761/eureka/`

