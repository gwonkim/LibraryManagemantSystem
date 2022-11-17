package com.lms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import javax.validation.Valid;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.validation.BindingResult;

import com.lms.entity.Department;
import com.lms.entity.User;
import com.lms.repository.DepartmentRepository;
import com.lms.repository.UserRepository;

@Controller
public class LoginController {

	@Autowired
	UserRepository userRepository;
	@Autowired
	DepartmentRepository departmentRepository;

	@GetMapping("signup")
	public String create(Model model) {
		User user = new User();
		List<Department> departments = departmentRepository.findAll();
		model.addAttribute("user", user);
		model.addAttribute("departments", departments);
		return "signup";
	}

	@PostMapping("signup")
	public String create(Model model, @Valid  User user, BindingResult bindingResult) {
		User find = userRepository.findByUserId(user.getUserId());
		
		if(bindingResult.hasErrors()){
			System.out.println("회원가입 리젝");
            return "redirect:signup";
       }
		
		if (user != null) {
			if (find == null) {
				List<User> users = userRepository.findAll();
				user.setDepartment(departmentRepository.findById(2)); // 일반회원가입
				String borrowId = user.borrowCode(user.getDepartment(), users.size());
				user.setBorrowId(borrowId);
				userRepository.save(user);
				System.out.println("회원가입 성공");
				return "redirect:";
			} else {
				System.out.println("회원가입 실패11");
				bindingResult.rejectValue("userId", null, "중복된 아이디입니다.");
			}
		}
		return "redirect:signup";
	}

	@GetMapping("login")
	public String login(Model model) {
		User login = new User();
		model.addAttribute("login", login);
		String message = "dfdffdsffsd";
		model.addAttribute("message", message);
		return "login";
	}

	@PostMapping("login")
	public String login(Model model, @Valid User login, BindingResult bindingResult) {
		String message = "";
		User user = userRepository.findByUserId(login.getUserId());
		if (login != null && user != null) {

			if (user.getUserId().equals(login.getUserId()) && user.getPassword().equals(login.getPassword())) {
				message = "로그인 성공";
				System.out.println("로그인 성공");
				model.addAttribute("message", message);
				return "redirect:";
			} else {
				message = "아이디 또는 비밀번호가 잘못되었습니다.";
				System.out.println("로그인 실패~~");
				return "redirect:login";
			}
		} else {
			System.out.println("로그인 실패11");
			bindingResult.rejectValue("password", null, "아이디 또는 비밀번호가 잘못되었습니다.");
			return "redirect:login";
		}
	}

}
