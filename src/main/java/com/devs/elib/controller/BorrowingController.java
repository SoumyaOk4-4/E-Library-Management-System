package com.devs.elib.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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
    @PostMapping("/borrow/{bookId}")
    public String borrowBook(@PathVariable String bookId, HttpSession session) {
        String email = (String) session.getAttribute("udata");
        if (email != null) {
            // In real scenario, you'd get user ID from email
            // For now, we'll redirect to books
            borrowingService.borrowBook(1, bookId); // Replace 1 with actual user ID
            return "redirect:/books";
        }
        return "redirect:/login.jsp";
    }

    // Return a book
    @GetMapping("/return/{borrowingId}")
    public String returnBook(@PathVariable int borrowingId, HttpSession session) {
        String email = (String) session.getAttribute("udata");
        if (email != null) {
            Borrowing borrowing = borrowingService.returnBook(borrowingId);
            if (borrowing != null) {
                return "redirect:/borrowing/mybookings";
            }
        }
        return "redirect:/login.jsp";
    }

    // View user's borrowings
    @GetMapping("/mybookings")
    public String getMyBookings(HttpSession session, Model model) {
        String email = (String) session.getAttribute("udata");
        if (email != null) {
            // In real scenario, get actual user ID from email
            List<Borrowing> borrowings = borrowingService.getUserBorrowings(1);
            model.addAttribute("borrowings", borrowings);
            return "my-borrowings";
        }
        return "redirect:/login.jsp";
    }

    // View all overdue books (admin only)
    @GetMapping("/overdue")
    public String getOverdueBooks(Model model) {
        List<Borrowing> overdueBooks = borrowingService.getOverdueBooks();
        model.addAttribute("overdueBooks", overdueBooks);
        return "overdue-books";
    }

    // Calculate fine
    @GetMapping("/fine/{borrowingId}")
    public String calculateFine(@PathVariable int borrowingId, Model model) {
        Double fine = borrowingService.calculateFine(borrowingId);
        model.addAttribute("fine", fine);
        return "fine-details";
    }
}