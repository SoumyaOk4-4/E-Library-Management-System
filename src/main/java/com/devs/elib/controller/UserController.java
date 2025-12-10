package com.devs.elib.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
            session.setAttribute("udata", email);
            session.setAttribute("userId", user.getId());
            session.setAttribute("role", role);
            
            if (role.equals("admin")) {
                return "redirect:/dashboard";
            } else {
                return "redirect:/";
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
    public String getAllUsers(HttpSession session, Model model) {
        String role = (String) session.getAttribute("role");
        
        // Check if user is logged in and is admin
        if (role == null || !role.equals("admin")) {
            return "redirect:/login";
        }
        
        List<User> users = userService.getAllUsers();
        model.addAttribute("userdata", users);
        return "user";
    }

    @GetMapping("/viewusers/edit/{id}")
    public String showEditUserForm(@PathVariable int id, HttpSession session, Model model) {
        String role = (String) session.getAttribute("role");
        if (role == null || !role.equals("admin")) {
            return "redirect:/login";
        }

        User user = userService.getUserById(id);
        if (user == null) {
            return "redirect:/viewusers";
        }

        model.addAttribute("user", user);
        return "edit-user";
    }

    @PostMapping("/viewusers/edit/{id}")
    public String editUser(@PathVariable int id,
            @RequestParam("name") String name,
            @RequestParam("email") String email,
            @RequestParam("phone") String phone,
            @RequestParam(value = "role", required = false) String role,
            HttpSession session) {
        String sessionRole = (String) session.getAttribute("role");
        if (sessionRole == null || !sessionRole.equals("admin")) {
            return "redirect:/login";
        }

        User updated = new User();
        updated.setName(name);
        updated.setEmail(email);
        try {
            updated.setPhno(Long.parseLong(phone));
        } catch (NumberFormatException e) {
            updated.setPhno(0);
        }
        if (role != null && !role.isEmpty()) {
            updated.setRole(role);
        }

        userService.updateUser(id, updated);
        return "redirect:/viewusers";
    }

    @GetMapping("/viewusers/delete/{id}")
    public String deleteUser(@PathVariable int id, HttpSession session) {
        String sessionRole = (String) session.getAttribute("role");
        Integer sessionUserId = (Integer) session.getAttribute("userId");
        if (sessionRole == null || !sessionRole.equals("admin")) {
            return "redirect:/login";
        }

        // Prevent admin from deleting themselves
        if (sessionUserId != null && sessionUserId == id) {
            return "redirect:/viewusers";
        }

        userService.deleteUser(id);
        return "redirect:/viewusers";
    }
}