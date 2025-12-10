package com.devs.elib.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.devs.elib.model.Book;

public interface BookRepository extends JpaRepository<Book, String> {
    List<Book> findByNameContainingIgnoreCaseOrAuthorContainingIgnoreCase(String name, String author);
    List<Book> findByAvailableTrue();
}