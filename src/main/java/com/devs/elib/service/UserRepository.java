package com.devs.elib.service;

import org.springframework.data.jpa.repository.JpaRepository;

import com.devs.elib.model.User;

public interface UserRepository extends JpaRepository<User, Integer> {
User findByEmailAndPassword(String email,String pass);
}
