package com.lms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.lms.entity.Department;
import com.lms.entity.User;
import com.lms.repository.DepartmentRepository;
import com.lms.repository.UserRepository;

@Controller
@RequestMapping("user")
public class UserController {

	@Autowired
	UserRepository userRepository;
	@Autowired
	DepartmentRepository departmentRepository;

	@RequestMapping("list")
	public String list(Model model) {
		List<User> users = userRepository.findAll();
		model.addAttribute("users", users);
		return "user/list";
	}

	@GetMapping("create")
	public String create(Model model) {
		User user = new User();
		List<Department> departments = departmentRepository.findAll();
		model.addAttribute("user", user);
		model.addAttribute("departments", departments);
		return "user/edit";
	}

	@PostMapping("create")
	public String create(Model model, User user) {
		List<User> users = userRepository.findAll();
		String borrowId = user.borrowCode(user.getDepartment(), users.size());
		user.setBorrowId(borrowId);
		userRepository.save(user);
		return "redirect:list";
	}

	@GetMapping("edit")
	public String edit(Model model, @RequestParam("id") int id) {
		User user = userRepository.findById(id).get();
		List<Department> departments = departmentRepository.findAll();
		model.addAttribute("user", user);
		model.addAttribute("departments", departments);
		return "user/edit";
	}

	@PostMapping("edit")
	public String edit(Model model, User user) {
		userRepository.save(user);
		return "redirect:list";
	}

	@RequestMapping("delete")
	public String delete(Model model, @RequestParam("id") int id) {
		userRepository.deleteById(id);
		return "redirect:list";
	}
}
