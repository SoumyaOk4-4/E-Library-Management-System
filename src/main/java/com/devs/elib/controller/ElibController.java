package com.devs.elib.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.devs.elib.model.Borrowing;
import com.devs.elib.services.BorrowingService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ElibController {

    @Autowired
    private BorrowingService borrowingService;

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

    // Admin: view all borrowings
    @GetMapping("/borrowlist")
    public String borrowList(HttpSession session, Model model) {
        String role = (String) session.getAttribute("role");
        if (role == null || !role.equals("admin")) {
            return "redirect:/login";
        }
        List<Borrowing> borrowings = borrowingService.getAllBorrowings();
        model.addAttribute("borrowings", borrowings);
        return "borrow-list";
    }
}