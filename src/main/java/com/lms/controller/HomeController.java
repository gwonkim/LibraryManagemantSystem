package com.lms.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lms.model.UserRegistration;
import com.lms.service.UserService;

@Controller
public class HomeController {
    @Autowired
    UserService userService;

    @RequestMapping({ "/", "index" })
    public String index() {
        return "home/index";
    }

    @RequestMapping("login")
    public String login(HttpServletRequest request) {
        System.out.println("REQUEST : " + request);
        if (request.isUserInRole("ROLE_ADMIN") || request.isUserInRole("ROLE_HONOR")
                || request.isUserInRole("ROLE_USER")) {
            return "redirect:";
        }
        return "home/login";
    }

    @GetMapping("signup")
    public String register(Model model, HttpServletRequest request) {
        if (request.isUserInRole("ROLE_ADMIN") || request.isUserInRole("ROLE_HONOR")
                || request.isUserInRole("ROLE_USER")) {
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
