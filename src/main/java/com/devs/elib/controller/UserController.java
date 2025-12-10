package com.devs.elib.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.devs.elib.model.User;
import com.devs.elib.repository.UserRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	@Autowired
	UserRepository urepo;

	@PostMapping("/regproc")
	public String regProcess(@RequestParam("name") String name, @RequestParam("email") String email,
			@RequestParam("phone") String phno, @RequestParam("password") String pass, ModelMap model) {
		User user = new User();
		user.setName(name);
		user.setEmail(email);
		user.setPhno(Long.parseLong(phno));
		user.setPassword(pass);
		user.setRole("customer");
		urepo.save(user);
		model.put("msg", "Sucessfully Registered!");
		return "signup";
	}

	@PostMapping("/logproc")
	public String loginProcess(@RequestParam("email") String email, @RequestParam("password") String pass,
			ModelMap model, HttpSession session) {
		User user = null;
		user = urepo.findByEmailAndPassword(email, pass);
		if (user != null) {
			String role = user.getRole();
			if (role.equals("customer")) {
				session.setAttribute("udata", email);
				return "index";
			} else {
				return "redirect:/viewitems";
			}
		} else {
			model.put("msg", "Wrong credential try again!");
			return "login";
		}
	}

	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "index";
	}

	@GetMapping("/viewusers")
	public String getAllUsers(Model model) {
		List<User> user = urepo.findAll();
		model.addAttribute("userdata", user);
		return "user";
	}
}
