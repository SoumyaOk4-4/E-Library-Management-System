package com.devs.elib.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devs.elib.model.User;
import com.devs.elib.repository.UserRepository;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    // Register new user
    public User registerUser(String name, String email, String phone, String password) {
        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPhno(Long.parseLong(phone));
        user.setPassword(password);
        user.setRole("customer");
        return userRepository.save(user);
    }

    // Login user
    public User loginUser(String email, String password) {
        return userRepository.findByEmailAndPassword(email, password);
    }

    // Get all users
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    // Get user by ID
    public User getUserById(int id) {
        return userRepository.findById(id).orElse(null);
    }

    // Update user
    public User updateUser(int id, User userDetails) {
        User user = userRepository.findById(id).orElse(null);
        if (user != null) {
            user.setName(userDetails.getName());
            user.setEmail(userDetails.getEmail());
            user.setPhno(userDetails.getPhno());
            user.setRole(userDetails.getRole());
            return userRepository.save(user);
        }
        return null;
    }

    // Delete user
    public void deleteUser(int id) {
        userRepository.deleteById(id);
    }
}