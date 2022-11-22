package com.lms.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lms.entity.BookBorrow;
import com.lms.entity.BookReturn;
import com.lms.entity.Department;
import com.lms.entity.RequestBook;
import com.lms.entity.State;
import com.lms.entity.User;
import com.lms.model.RequestBookRegistration;
import com.lms.model.UserRegistration;
import com.lms.repository.BookBorrowRepository;
import com.lms.repository.BookReturnRepository;
import com.lms.repository.DepartmentRepository;
import com.lms.repository.StateRepository;
import com.lms.repository.UserRepository;
import com.lms.repository.RequestBookRepository;
import com.lms.service.RequestBookService;
import com.lms.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	UserRepository userRepository;
	@Autowired
	DepartmentRepository departmentRepository;
	@Autowired
	StateRepository stateRepository;
	@Autowired
	UserService userService;
	@Autowired
	RequestBookService requestBookService;
	@Autowired
	RequestBookRepository requestBookRepository;
	@Autowired
	BookReturnRepository bookReturnRepository;
	@Autowired
	BookBorrowRepository bookBorrowRepository;

	@RequestMapping("index")
	public String index(Model model, Authentication authentication) {
		String userId = authentication.getName();
		User user = userRepository.findByUserId(userId);
		List<RequestBook> requestBooks = requestBookRepository.findByUserId(user.getId());
		List<BookReturn> bookReturns = bookReturnRepository.findByUserId(user.getId());
		List<BookBorrow> bookBorrows = bookBorrowRepository.findByUserId(user.getId());
		model.addAttribute("requestBooks", requestBooks);
		model.addAttribute("bookReturns", bookReturns);
		model.addAttribute("bookBorrows", bookBorrows);

		return "user/index";
	}

	@RequestMapping("redirect")
	public String redirect(Model model, HttpServletRequest request) {
		if (request.isUserInRole("ROLE_ADMIN"))
			return "redirect:/admin/index";
		return "redirect:/user/index";
	}

	// 개인 정보 수정
	@GetMapping("edit")
	public String userEdit(Model model, @RequestParam("id") int id) {
		User user = userRepository.findById(id).get();
		List<Department> departments = departmentRepository.findAll();
		model.addAttribute("userRegistration", user);
		model.addAttribute("departments", departments);
		return "user/edit";
	}

	// @GetMapping("user/edit")
	// public String userEdit(Model model, @RequestParam("id") int id) {
	// User user = userRepository.findById(id).get();
	// List<Department> departments = departmentRepository.findAll();
	// model.addAttribute("userRegistration", user);
	// model.addAttribute("departments", departments);
	// return "admin/user/edit";
	// }

	@PostMapping("edit")
	public String userEdit(Model model, @Valid UserRegistration userRegistration, BindingResult bindingResult) {
		if (userService.hasErrors(userRegistration, bindingResult)) {
			return "user/edit";
		}
		userService.edit(userRegistration);
		return "redirect:index";
	}

	// 희망도서신청
	@GetMapping("request")
	public String userRequest(Model model) {
		model.addAttribute("requestBookRegistration", new RequestBookRegistration());
		return "user/request";
	}

	@PostMapping("request")
	public String userRequest(Model model, Authentication auth, @Valid RequestBookRegistration requestBookRegistration, BindingResult bindingResult) {
		if (requestBookService.hasErrors(requestBookRegistration, bindingResult)) {
			return "user/request";
		}
		User user = userRepository.findByUserId(auth.getName());
		requestBookRegistration.setUser(user);
		requestBookRegistration.setState(stateRepository.findById(6));
		requestBookService.save(requestBookRegistration);
		return "redirect:index";
	}

	// 희망도서수정
	@GetMapping("requestEdit")
	public String requestEdit(Model model, @RequestParam("id") int id) {
		RequestBook requestBook = requestBookRepository.findById(id);
		RequestBookRegistration requestBookRegistration = new RequestBookRegistration(requestBook);
		model.addAttribute("requestBookRegistration", requestBookRegistration);
		return "user/request";
	}

	@PostMapping("requestEdit")
	public String requestEdit(Model model, Authentication auth, @Valid RequestBookRegistration requestBookRegistration, BindingResult bindingResult) {
		if (requestBookService.hasErrors(requestBookRegistration, bindingResult)) {
			return "user/request";
		}
		User user = userRepository.findByUserId(auth.getName());
		requestBookRegistration.setUser(user);
		requestBookRegistration.setState(stateRepository.findById(6));
		requestBookService.edit(requestBookRegistration);
		return "redirect:index";
	}
}
