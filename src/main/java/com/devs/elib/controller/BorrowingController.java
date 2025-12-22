package com.devs.elib.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.devs.elib.model.Borrowing;
import com.devs.elib.services.BorrowingService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/borrowing")
public class BorrowingController {

    @Autowired
    private BorrowingService borrowingService;

    // Borrow a book
    @GetMapping("/borrow/{bookId}")
    public String borrowBook(@PathVariable String bookId, HttpSession session) {
        Integer userId = (Integer) session.getAttribute("userId");
        String userEmail = (String) session.getAttribute("udata");
        
        if (userEmail == null) {
            return "redirect:/login";
        }
        
        if (userId != null) {
            Borrowing borrowing = borrowingService.borrowBook(userId, bookId);
            if (borrowing != null) {
                return "redirect:/borrowing/mybookings?success=Book borrowed successfully!";
            } else {
                // Book not available or already borrowed
                return "redirect:/books/" + bookId + "?error=You already have this book borrowed or it's not available!";
            }
        }
        return "redirect:/login";
    }

    // Return a book (admin only)
    @GetMapping("/return/{borrowingId}")
    public String returnBook(@PathVariable int borrowingId, HttpSession session) {
        String role = (String) session.getAttribute("role");
        if (role == null || !role.equals("admin")) {
            return "redirect:/login";
        }
        Borrowing borrowing = borrowingService.returnBook(borrowingId);
        if (borrowing != null) {
            return "redirect:/borrowlist?success=Book returned successfully!";
        }
        return "redirect:/borrowlist?error=Unable to return book";
    }

    // View user's borrowings (Profile/My Bookings)
    @GetMapping("/mybookings")
    public String getMyBookings(HttpSession session, Model model) {
        Integer userId = (Integer) session.getAttribute("userId");
        String email = (String) session.getAttribute("udata");
        String role = (String) session.getAttribute("role");
        
        if (email == null) {
            return "redirect:/login";
        }
        
        if (userId != null) {
            List<Borrowing> borrowings = borrowingService.getUserBorrowings(userId);
            model.addAttribute("borrowings", borrowings);
            model.addAttribute("userEmail", email);
            model.addAttribute("role", role);
            return "my-bookings";
        }
        return "redirect:/login";
    }

    // View all overdue books (admin only)
    @GetMapping("/overdue")
    public String getOverdueBooks(HttpSession session, Model model) {
        String role = (String) session.getAttribute("role");
        
        if (role == null || !role.equals("admin")) {
            return "redirect:/login";
        }
        
        List<Borrowing> overdueBooks = borrowingService.getOverdueBooks();
        model.addAttribute("overdueBooks", overdueBooks);
        return "overdue-books";
    }
}