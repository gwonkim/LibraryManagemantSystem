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
import com.lms.model.UserRegistration;
import com.lms.repository.BookBorrowRepository;
import com.lms.repository.BookReturnRepository;
import com.lms.repository.DepartmentRepository;
import com.lms.repository.StateRepository;
import com.lms.repository.UserRepository;
import com.lms.repository.RequestBookRepository;
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
	RequestBookRepository requestBookRepository;
	@Autowired
	BookReturnRepository bookReturnRepository;
	@Autowired
	BookBorrowRepository bookBorrowRepository;

	@RequestMapping("index")
	public String index(Model model, Authentication authentication) {
        String userId = authentication.getName();
		User user = userRepository.findByUserId(userId);
		List<BookReturn> bookReturns = bookReturnRepository.findByUserId(user.getId());
		List<BookBorrow> bookBorrows = bookBorrowRepository.findByUserId(user.getId());
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

	// @Secured("ROLE_ADMIN")
	// @RequestMapping("admin_only")
	// public String admin_only(Model model) {
	// 	return "user/admin_only";
	// }

	// 개인 정보 수정
	@GetMapping("edit")
	public String userEdit(Model model, @RequestParam("id") int id) {
		User user = userRepository.findById(id).get();
		List<Department> departments = departmentRepository.findAll();
		model.addAttribute("userRegistration", new UserRegistration(user));
		model.addAttribute("departments", departments);
		return "user/edit";
	}

	@PostMapping("edit")
	public String userEdit(Model model, @Valid UserRegistration userRegistration, BindingResult bindingResult) {
		if (userService.hasErrors(userRegistration, bindingResult)) {
			// System.out.println("사용자의 회원 수정 : bindingResult" + bindingResult);
			return "user/edit";
		}
		userService.edit(userRegistration);
		return "redirect:list";
	}

	// 희망도서신청
	@GetMapping("request")
	public String userRequest(Model model) {
		List<State> staties = stateRepository.findAll();
		model.addAttribute("book", new RequestBook());
		model.addAttribute("staties", staties);
		return "user/request";
	}

	@PostMapping("request")
	public String userRequest(Model model, RequestBook book) {
		// List<State> staties = stateRepository.findAll();
		if (book == null) {
			return "redirect:";
		}
		// model.addAttribute("book", new RequestBook());
		requestBookRepository.save(book);
		// model.addAttribute("staties", staties);
		return "user/request";
	}

}
