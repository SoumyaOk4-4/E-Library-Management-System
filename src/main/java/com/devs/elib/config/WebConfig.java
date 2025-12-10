package com.devs.elib.config;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Autowired
    private FileUploadProperties fileUploadProperties;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        String uploadDir = new File(fileUploadProperties.getUploadDir()).getAbsolutePath();

        // Ensure directory exists
        File uploadsDir = new File(uploadDir);
        if (!uploadsDir.exists() && !uploadsDir.mkdirs()) {
            throw new RuntimeException("Could not create upload directory: " + uploadDir);
        }

        // Map /images/** URL to physical upload directory
        registry.addResourceHandler("/images/**")
                .addResourceLocations("file:" + uploadDir + "/");
    }
}

