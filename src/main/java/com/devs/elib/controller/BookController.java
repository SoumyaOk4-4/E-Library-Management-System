package com.devs.elib.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.devs.elib.model.Book;
import com.devs.elib.services.BookService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/books")
public class BookController {

    @Autowired
    private BookService bookService;

    // Display all books - PUBLIC
    @GetMapping("")
    public String getAllBooks(Model model) {
        List<Book> books = bookService.getAllBooks();
        model.addAttribute("books", books);
        return "books";
    }

    // Display book by ID - PUBLIC
    @GetMapping("/{id}")
    public String getBookById(@PathVariable String id, Model model) {
        Optional<Book> book = bookService.getBookById(id);
        if (book.isPresent()) {
            model.addAttribute("book", book.get());
            return "book-detail";
        }
        return "redirect:/books";
    }

    // Show add book form - ADMIN ONLY
    @GetMapping("/add")
    public String showAddBookForm(HttpSession session, Model model) {
        String role = (String) session.getAttribute("role");
        
        // Check if user is logged in and is admin
        if (role == null || !role.equals("admin")) {
            return "redirect:/login";
        }
        
        model.addAttribute("book", new Book());
        return "add-book";
    }

    // Save new book - ADMIN ONLY
    @PostMapping("/add")
    public String addBook(Book book, HttpSession session) {
        String role = (String) session.getAttribute("role");
        
        // Check if user is logged in and is admin
        if (role == null || !role.equals("admin")) {
            return "redirect:/login";
        }
        
        bookService.saveBook(book);
        return "redirect:/books";
    }

    // Show edit book form - ADMIN ONLY
    @GetMapping("/edit/{id}")
    public String showEditBookForm(@PathVariable String id, HttpSession session, Model model) {
        String role = (String) session.getAttribute("role");
        
        // Check if user is logged in and is admin
        if (role == null || !role.equals("admin")) {
            return "redirect:/login";
        }
        
        Optional<Book> book = bookService.getBookById(id);
        if (book.isPresent()) {
            model.addAttribute("book", book.get());
            return "edit-book";
        }
        return "redirect:/books";
    }

    // Update book - ADMIN ONLY
    @PostMapping("/edit/{id}")
    public String editBook(@PathVariable String id, Book bookDetails, HttpSession session) {
        String role = (String) session.getAttribute("role");
        
        // Check if user is logged in and is admin
        if (role == null || !role.equals("admin")) {
            return "redirect:/login";
        }
        
        bookService.updateBook(id, bookDetails);
        return "redirect:/books";
    }

    // Delete book - ADMIN ONLY
    @GetMapping("/delete/{id}")
    public String deleteBook(@PathVariable String id, HttpSession session) {
        String role = (String) session.getAttribute("role");
        
        // Check if user is logged in and is admin
        if (role == null || !role.equals("admin")) {
            return "redirect:/login";
        }
        
        bookService.deleteBook(id);
        return "redirect:/books";
    }

    // Search books - PUBLIC
    @GetMapping("/search")
    public String searchBooks(@RequestParam String query, Model model) {
        List<Book> books = bookService.searchBooks(query);
        model.addAttribute("books", books);
        model.addAttribute("searchQuery", query);
        return "books";
    }

    // Get available books only - PUBLIC
    @GetMapping("/available")
    public String getAvailableBooks(Model model) {
        List<Book> books = bookService.getAvailableBooks();
        model.addAttribute("books", books);
        return "books";
    }
}