package com.devs.elib.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.validation.BindingResult;

import com.devs.elib.config.FileUploadProperties;
import com.devs.elib.model.Book;
import com.devs.elib.services.BookService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/books")
public class BookController {

    @Autowired
    private BookService bookService;

    @Autowired
    private FileUploadProperties fileUploadProperties;

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
    public String addBook(@Valid Book book, BindingResult bindingResult, 
            @RequestParam("image") MultipartFile coverImage, 
            HttpSession session, Model model)
            throws IOException {
        String role = (String) session.getAttribute("role");

        // Check if user is logged in and is admin
        if (role == null || !role.equals("admin")) {
            return "redirect:/login";
        }

        // Check for binding errors
        if (bindingResult.hasErrors()) {
            model.addAttribute("book", book);
            model.addAttribute("errors", bindingResult.getAllErrors());
            return "add-book";
        }

        Book savedBook = bookService.saveBook(book);

        // Handle image upload
        if (coverImage != null && !coverImage.isEmpty()) {
            String fileName = handleImageUpload(savedBook.getId(), coverImage);
            if (fileName != null) {
                savedBook.setCoverImage(fileName);
                bookService.saveBook(savedBook);
            }
        }

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
    public String editBook(
            @PathVariable String id,
            @RequestParam String name,
            @RequestParam String author,
            @RequestParam String publisher,
            @RequestParam int quantity,
            @RequestParam(required = false) String description,
            @RequestParam(required = false) MultipartFile coverImage,
            HttpSession session) throws IOException {

        String role = (String) session.getAttribute("role");

        if (role == null || !role.equals("admin")) {
            return "redirect:/login";
        }

        // Fetch existing book
        Book existingBook = bookService.getBookById(id).orElse(null);
        if (existingBook == null) {
            return "redirect:/books";
        }

        // Update manually
        existingBook.setName(name);
        existingBook.setAuthor(author);
        existingBook.setPublisher(publisher);
        existingBook.setQuantity(quantity);
        existingBook.setDescription(description);

        // Handle new image
        if (coverImage != null && !coverImage.isEmpty()) {
            String fileName = handleImageUpload(id, coverImage);
            if (fileName != null) {
                existingBook.setCoverImage(fileName);
            }
        }

        bookService.saveBook(existingBook);
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

    // Handle image upload
    private String handleImageUpload(String bookId, MultipartFile file) throws IOException {
        if (file.isEmpty()) {
            return null;
        }

        // Create book-specific directory
        String uploadDir = fileUploadProperties.getUploadDir();
        String bookUploadDir = uploadDir + File.separator + bookId;
        File dir = new File(bookUploadDir);
        if (!dir.exists()) {
            dir.mkdirs();
        }

        // Generate unique filename
        String originalFilename = file.getOriginalFilename();
        String filename = System.currentTimeMillis() + "_" + originalFilename;

        // Save file
        File destinationFile = new File(bookUploadDir + File.separator + filename);
        file.transferTo(destinationFile);

        return filename;
    }
}