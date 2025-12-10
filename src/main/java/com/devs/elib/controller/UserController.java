package com.devs.elib.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.devs.elib.model.User;
import com.devs.elib.services.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("/regproc")
    public String regProcess(@RequestParam("name") String name, @RequestParam("email") String email,
            @RequestParam("phone") String phno, @RequestParam("password") String pass, ModelMap model) {
        try {
            userService.registerUser(name, email, phno, pass);
            model.put("msg", "Successfully Registered!");
            return "signup";
        } catch (Exception e) {
            model.put("msg", "Registration failed: " + e.getMessage());
            return "signup";
        }
    }

    @PostMapping("/logproc")
    public String loginProcess(@RequestParam("email") String email, @RequestParam("password") String pass,
            ModelMap model, HttpSession session) {
        User user = userService.loginUser(email, pass);
        if (user != null) {
            String role = user.getRole();
            if (role.equals("customer")) {
                session.setAttribute("udata", email);
                return "index";
            } else {
                return "redirect:/dashboard";
            }
        } else {
            model.put("msg", "Wrong credentials, try again!");
            return "login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().invalidate();
        return "redirect:/";
    }

    @GetMapping("/viewusers")
    public String getAllUsers(Model model) {
        List<User> users = userService.getAllUsers();
        model.addAttribute("userdata", users);
        return "user";
    }
}