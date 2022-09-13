package com.iroc.spring;

import com.iroc.spring.property.FileStorageProperties;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
@EnableConfigurationProperties({
		FileStorageProperties.class
})
public class EntryPoint {
	public static void main(String[] args) {
		SpringApplication.run(EntryPoint.class, args);
	}

}
