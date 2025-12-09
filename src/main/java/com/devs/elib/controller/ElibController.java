package com.devs.elib.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ElibController {

    @GetMapping("/")
    public String Index() {
        return "index";
    }

    @GetMapping("/dash")
    public String dashboard() {
        return "dashboard";
    }
    
}
