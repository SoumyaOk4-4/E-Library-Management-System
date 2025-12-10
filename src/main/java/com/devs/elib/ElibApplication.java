package com.devs.elib;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;

import com.devs.elib.config.FileUploadProperties;

@SpringBootApplication
@EnableConfigurationProperties(FileUploadProperties.class)
public class ElibApplication {

	public static void main(String[] args) {
		SpringApplication.run(ElibApplication.class, args);
	}

}
