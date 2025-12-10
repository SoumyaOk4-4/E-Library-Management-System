package com.devs.elib.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devs.elib.model.Book;
import com.devs.elib.repository.BookRepository;

@Service
public class BookService {

    @Autowired
    private BookRepository bookRepository;

    // Get all books
    public List<Book> getAllBooks() {
        return bookRepository.findAll();
    }

    // Get book by ID
    public Optional<Book> getBookById(String id) {
        return bookRepository.findById(id);
    }

    // Save new book
    public Book saveBook(Book book) {
        // Set availability based on quantity
        if (book.getQuantity() > 0) {
            book.setAvailable(true);
        } else {
            book.setAvailable(false);
        }
        return bookRepository.save(book);
    }

    // Update existing book
    public Book updateBook(String id, Book bookDetails) {
        Optional<Book> optionalBook = bookRepository.findById(id);
        if (optionalBook.isPresent()) {
            Book existingBook = optionalBook.get();
            existingBook.setName(bookDetails.getName());
            existingBook.setAuthor(bookDetails.getAuthor());
            existingBook.setPublisher(bookDetails.getPublisher());
            existingBook.setQuantity(bookDetails.getQuantity());
            existingBook.setDescription(bookDetails.getDescription());
            existingBook.setCoverImageUrl(bookDetails.getCoverImageUrl());
            
            // Update availability based on quantity
            if (bookDetails.getQuantity() > 0) {
                existingBook.setAvailable(true);
            } else {
                existingBook.setAvailable(false);
            }
            
            return bookRepository.save(existingBook);
        }
        return null;
    }

    // Delete book
    public void deleteBook(String id) {
        bookRepository.deleteById(id);
    }

    // Search books by name or author
    public List<Book> searchBooks(String query) {
        return bookRepository.findByNameContainingIgnoreCaseOrAuthorContainingIgnoreCase(query, query);
    }

    // Get available books only
    public List<Book> getAvailableBooks() {
        return bookRepository.findByAvailableTrue();
    }
}