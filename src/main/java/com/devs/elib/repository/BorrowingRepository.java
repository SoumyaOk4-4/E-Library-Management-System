package com.devs.elib.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.devs.elib.model.Book;
import com.devs.elib.model.Borrowing;
import com.devs.elib.model.User;

public interface BorrowingRepository extends JpaRepository<Borrowing, Integer> {
    List<Borrowing> findByUser(User user);
    List<Borrowing> findByUserAndStatus(User user, String status);
    List<Borrowing> findByStatus(String status);
    
    // NEW: Check if user has active borrowing of specific book
    List<Borrowing> findByUserAndBookAndStatus(User user, Book book, String status);
}