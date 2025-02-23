package com.lms.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lms.entity.BookBorrow;
import com.lms.entity.BookReturn;
import com.lms.entity.RequestBook;
import com.lms.entity.User;
import com.lms.model.PwRegistration;
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

	@RequestMapping({ "index", "/" })
	public String index(Model model, Authentication authentication) {
		String userId = authentication.getName();
		int id = userRepository.findByUserId(userId).getId();
		List<RequestBook> requestBooks = requestBookRepository.findByUserId(id);
		List<BookReturn> bookReturns = bookReturnRepository.findByUserId(id);
		List<BookBorrow> bookBorrows = bookBorrowRepository.findByUserId(id);
		model.addAttribute("userId", userId); // 개인정보수정용
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
	public String userEdit(Model model, @RequestParam("userId") String userId) {
		model.addAttribute("userRegistration", new UserRegistration(userRepository.findByUserId(userId)));
		model.addAttribute("departments", departmentRepository.findAll());
		model.addAttribute("userId", userId); // 비밀번호 수정용
		return "user/edit";
	}

	@PostMapping("edit")
	public String userEdit(Model model, HttpServletRequest request, @Valid UserRegistration userRegistration,
			BindingResult bindingResult) {
		if (request.isUserInRole("ROLE_ADMIN")) {
			if (userService.hasEditErrors(userRegistration, bindingResult)) {
				return "user/edit";
			}
			userService.editUser(userRegistration);
			return "redirect:/admin/index";
		}

		if (request.isUserInRole("ROLE_HONOR")
				|| request.isUserInRole("ROLE_USER")) {
			if (userService.hasEditErrors(userRegistration, bindingResult)) {
				return "user/edit";
			}
			userService.editUser(userRegistration);
			return "redirect:/user/index";
		}
		return "redirect:index";
	}

	// 비밀번호 수정
	@GetMapping("editPw")
	public String pWEdit(Model model, @RequestParam("userId") String userId) {
		model.addAttribute("pwRegistration", new PwRegistration(userId));
		return "user/editPw";
	}

	@PostMapping("editPw")
	public String pWEdit(Model model, HttpServletRequest request, @Valid PwRegistration pwRegistration,
			BindingResult bindingResult) {
		if (userService.hasEditPwErrors(pwRegistration, bindingResult)) {
			return "user/editPw";
		}
		userService.editPw(pwRegistration);
		if (request.isUserInRole("ROLE_ADMIN")) {
			return "redirect:/admin/index";
		}
		return "redirect:/user/index";
	}

	// 희망도서신청
	@GetMapping("request")
	public String userRequest(Model model) {
		model.addAttribute("requestBookRegistration", new RequestBookRegistration());
		return "user/request";
	}

	@PostMapping("request")
	public String userRequest(Model model, Authentication auth, @Valid RequestBookRegistration requestBookRegistration,
			BindingResult bindingResult) {
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
	public String requestEdit(Model model, Authentication auth, @Valid RequestBookRegistration requestBookRegistration,
			BindingResult bindingResult) {
		if (requestBookService.hasErrors(requestBookRegistration, bindingResult)) {
			return "user/request";
		}
		User user = userRepository.findByUserId(auth.getName());
		requestBookRegistration.setUser(user);
		requestBookRegistration.setState(stateRepository.findById(6));
		requestBookService.edit(requestBookRegistration);
		return "redirect:index";
	}

	@RequestMapping("requestDelete")
	public String userDelete(Model model, @RequestParam("id") int id) {
	  requestBookRepository.deleteById(id);
	  return "redirect:/user/index";
	}
}
