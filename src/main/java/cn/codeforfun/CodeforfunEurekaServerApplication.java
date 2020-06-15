package cn.codeforfun;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer
public class CodeforfunEurekaServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(CodeforfunEurekaServerApplication.class, args);
    }

}
