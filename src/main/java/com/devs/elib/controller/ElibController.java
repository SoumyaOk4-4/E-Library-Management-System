package com.devs.elib.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class ElibController {

    @GetMapping("/")
    public String index() {
        return "index";
    }

    // @GetMapping("/dashboard")
    // public String dashboard(HttpSession session) {
    //     String role = (String) session.getAttribute("role");
        
    //     // Check if user is logged in and is admin
    //     if (role == null || !role.equals("admin")) {
    //         return "redirect:/login";
    //     }
        
    //     return "dashboard";
    // }

    @GetMapping("/login")
    public String login(HttpSession session) {
        // If already logged in, redirect to appropriate page
        String role = (String) session.getAttribute("role");
        if (role != null) {
            if (role.equals("admin")) {
                return "redirect:/dashboard";
            } else {
                return "redirect:/";
            }
        }
        return "login";
    }

    @GetMapping("/signup")
    public String signup(HttpSession session) {
        // If already logged in, redirect to appropriate page
        String role = (String) session.getAttribute("role");
        if (role != null) {
            if (role.equals("admin")) {
                return "redirect:/dashboard";
            } else {
                return "redirect:/";
            }
        }
        return "signup";
    }
}