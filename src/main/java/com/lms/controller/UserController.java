package com.lms.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.CrossOrigin;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.lms.entity.Department;
import com.lms.entity.User;
import com.lms.repository.DepartmentRepository;
import com.lms.repository.UserRepository;

@Controller
@RestController
@CrossOrigin(origins = "*", allowedHeaders = "*")
@RequestMapping("user")
public class UserController {

    @Autowired UserRepository userRepository;
    @Autowired DepartmentRepository departmentRepository;

    // 사용자 리스트
    @RequestMapping("list")
    public List<User> find() {
        return userRepository.findAll();
    }

    @RequestMapping("create1")
    public ResponseEntity<String> create1(@RequestBody Map<String, User> newUser) {
    	System.out.println("create11111  :"+ newUser);
       if (newUser != null) {
       	System.out.println("HAPPYYYYY");
       // 	userRepository.save(newUser);    		
   	}
        return ResponseEntity.ok().body("success");
    }
    
    @JsonProperty("u")
    @PostMapping("create_user")
	public ResponseEntity<String> create3(@RequestBody Object u) {
    	User users = new User();
    	users.setName("김랄라");
    	users.setBorrow_id("B0000009");
    	users.setUser_id("qwe123qwe");
    	users.setSex("여자");
    	users.setPhone("01066656676");
    	users.setEmail("happyyyy@naver.com");
    	users.setPassword("qweqwe1233"); 	
		System.out.println("create11111  :" + u);
		userRepository.save(users);
		return  ResponseEntity.ok().body("성공");
	}
}
