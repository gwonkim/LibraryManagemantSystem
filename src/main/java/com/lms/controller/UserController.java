package com.lms.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lms.entity.Department;
import com.lms.entity.User;
import com.lms.model.UserRegistration;
import com.lms.repository.DepartmentRepository;
import com.lms.repository.UserRepository;
import com.lms.service.UserService;

@Controller
public class UserController {
	@Autowired
	UserRepository userRepository;
	@Autowired
	DepartmentRepository departmentRepository;
	@Autowired
	UserService userService;

	@RequestMapping("user/index")
	public String index(Model model) {
		return "user/index";
	}

	@RequestMapping("user/redirect")
	public String redirect(Model model, HttpServletRequest request) {
		if (request.isUserInRole("ROLE_ADMIN"))
			return "redirect:/admin/index";
		return "redirect:/user/index";
	}

	@Secured("ROLE_ADMIN")
	@RequestMapping("user/admin_only")
	public String admin_only(Model model) {
		return "user/admin_only";
	}

	// 개인 정보 수정
	@GetMapping("user/edit")
	public String userEdit(Model model, @RequestParam("id") int id) {
		User user = userRepository.findById(id).get();
		List<Department> departments = departmentRepository.findAll();
		model.addAttribute("userRegistration", new UserRegistration(user));
		model.addAttribute("departments", departments);
		return "user/edit";
	}

	@PostMapping("user/edit")
	public String userEdit(Model model, @Valid UserRegistration userRegistration, BindingResult bindingResult) {
//		userRegistration.setEnabled(true);
//		userRepository.save(userRegistration);
//		return "redirect:list";

		if (userService.hasErrors(userRegistration, bindingResult)) {
			System.out.println("사용자의 회원 수정 : bindingResult" + bindingResult); //
			return "user/edit";
		}
		userService.edit(userRegistration);
		return "redirect:list";
	}

}
