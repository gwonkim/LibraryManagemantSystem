package com.lms.controller;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lms.entity.Book;
import com.lms.entity.State;
import com.lms.entity.Category;
import com.lms.entity.User;
import com.lms.model.Pagination;
import com.lms.repository.BookRepository;
import com.lms.repository.DepartmentRepository;
import com.lms.repository.CategoryRepository;
import com.lms.repository.StateRepository;
import com.lms.repository.UserRepository;
import com.lms.model.UserRegistration;
import com.lms.service.UserService;

@Controller
public class HomeController {
	@Autowired
	BookRepository bookRepository;
	@Autowired
	DepartmentRepository departmentRepository;
	@Autowired
	CategoryRepository categoryRepository;
	@Autowired
	StateRepository stateRepository;
	@Autowired
	UserRepository userRepository;
	@Autowired UserService userService;
	
    @RequestMapping({"/", "index"})
    public String index() {
        return "home/index";
    }

    @RequestMapping("login")
    public String login(HttpServletRequest request) {	
    	System.out.println("REQUEST : " + request);
    	if (request.isUserInRole("ROLE_ADMIN") || request.isUserInRole("ROLE_HONOR") || request.isUserInRole("ROLE_USER")) {
    		return "redirect:";
    	}
        return "home/login";
    }

    @GetMapping("signup")
    public String register(Model model, HttpServletRequest request) {
    	if (request.isUserInRole("ROLE_ADMIN") || request.isUserInRole("ROLE_HONOR") || request.isUserInRole("ROLE_USER")) {
    		return "redirect:";
    	}
        model.addAttribute(new UserRegistration());
        return "home/signup";
    }

    @PostMapping("signup")
    public String register(Model model, @Valid UserRegistration userRegistration, BindingResult bindingResult) {
        if (userService.hasErrors(userRegistration, bindingResult)) {
            return "home/signup";
        }
        userService.save(userRegistration);
        return "redirect:registerSuccess";
    }

    @RequestMapping("registerSuccess")
    public String registerSurccess() {
        return "home/registerSuccess";
    }
}
