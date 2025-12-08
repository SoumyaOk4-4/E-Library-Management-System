package com.devs.elib;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ElibController {
    @GetMapping("/hello")
    public String Hello () {
        return "Hello World!";
    }
}
