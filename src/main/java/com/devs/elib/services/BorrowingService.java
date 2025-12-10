package com.devs.elib.services;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devs.elib.model.Book;
import com.devs.elib.model.Borrowing;
import com.devs.elib.model.User;
import com.devs.elib.repository.BookRepository;
import com.devs.elib.repository.BorrowingRepository;
import com.devs.elib.repository.UserRepository;

@Service
public class BorrowingService {

    @Autowired
    private BorrowingRepository borrowingRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BookRepository bookRepository;

    // Borrow a book (7 days borrowing period)
    public Borrowing borrowBook(int userId, String bookId) {
        Optional<User> user = userRepository.findById(userId);
        Optional<Book> book = bookRepository.findById(bookId);

        if (user.isPresent() && book.isPresent()) {
            User userObj = user.get();
            Book bookObj = book.get();
            
            // CHECK: User already borrowed this book and hasn't returned it?
            List<Borrowing> activeBorrowings = borrowingRepository.findByUserAndBookAndStatus(
                userObj, bookObj, "BORROWED"
            );
            
            if (activeBorrowings != null && !activeBorrowings.isEmpty()) {
                // User already has an active borrowing of this book
                System.out.println("User already has this book borrowed!");
                return null;
            }
            
            // Check if book is available
            if (!bookObj.getAvailable() || bookObj.getQuantity() <= 0) {
                System.out.println("Book not available!");
                return null;
            }

            // Create borrowing record
            Borrowing borrowing = new Borrowing();
            borrowing.setUser(userObj);
            borrowing.setBook(bookObj);
            borrowing.setBorrowDate(LocalDate.now());
            borrowing.setDueDate(LocalDate.now().plusDays(7)); // 7 days to return
            borrowing.setStatus("BORROWED");

            // Decrease book quantity
            bookObj.setQuantity(bookObj.getQuantity() - 1);
            if (bookObj.getQuantity() <= 0) {
                bookObj.setAvailable(false);
            }
            bookRepository.save(bookObj);

            return borrowingRepository.save(borrowing);
        }
        return null;
    }

    // Return a book and calculate fine
    public Borrowing returnBook(int borrowingId) {
        Optional<Borrowing> borrowing = borrowingRepository.findById(borrowingId);

        if (borrowing.isPresent()) {
            Borrowing borrowObj = borrowing.get();
            borrowObj.setReturnDate(LocalDate.now());
            borrowObj.setStatus("RETURNED");
            borrowObj.calculateFine();

            // Increase book quantity
            Book book = borrowObj.getBook();
            book.setQuantity(book.getQuantity() + 1);
            book.setAvailable(true);
            bookRepository.save(book);

            return borrowingRepository.save(borrowObj);
        }
        return null;
    }

    // Get all borrowings for a user
    public List<Borrowing> getUserBorrowings(int userId) {
        Optional<User> user = userRepository.findById(userId);
        if (user.isPresent()) {
            return borrowingRepository.findByUser(user.get());
        }
        return null;
    }

    // Get active borrowings (not returned)
    public List<Borrowing> getActiveBorrowings(int userId) {
        Optional<User> user = userRepository.findById(userId);
        if (user.isPresent()) {
            return borrowingRepository.findByUserAndStatus(user.get(), "BORROWED");
        }
        return null;
    }

    // Get all overdue books
    public List<Borrowing> getOverdueBooks() {
        List<Borrowing> allBorrowings = borrowingRepository.findByStatus("BORROWED");
        allBorrowings.removeIf(b -> !b.isOverdue());
        return allBorrowings;
    }

    // Calculate fine for a borrowing
    public Double calculateFine(int borrowingId) {
        Optional<Borrowing> borrowing = borrowingRepository.findById(borrowingId);
        if (borrowing.isPresent()) {
            return borrowing.get().calculateFine();
        }
        return 0.0;
    }

    // Get all borrowing records
    public List<Borrowing> getAllBorrowings() {
        return borrowingRepository.findAll();
    }
}