package com.devs.elib.config;

import java.io.File;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix = "file")
public class FileUploadProperties {

    private String uploadDir = "uploads/images";

    public String getUploadDir() {
        // Convert to absolute path based on user.dir (project root)
        return new File(System.getProperty("user.dir"), uploadDir).getAbsolutePath();
    }

    public void setUploadDir(String uploadDir) {
        this.uploadDir = uploadDir;
    }
}

