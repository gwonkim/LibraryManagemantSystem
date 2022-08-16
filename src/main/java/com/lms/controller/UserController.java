package com.lms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.lms.entity.User;
import com.lms.repository.DepartmentRepository;
import com.lms.repository.UserRepository;

@Controller
@RestController
@RequestMapping("user")
public class UserController {

    @Autowired UserRepository userRepository;
    @Autowired DepartmentRepository departmentRepository;

    // 사용자 리스트
    @RequestMapping("list")
    public List<User> find(Model model) {
        return userRepository.findAll();
    }
}
