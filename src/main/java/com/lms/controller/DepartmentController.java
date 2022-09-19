package com.lms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.lms.entity.Department;
import com.lms.entity.User;
import com.lms.repository.DepartmentRepository;

@RestController
@RequestMapping("department")
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class DepartmentController {

    @Autowired DepartmentRepository departmentRepository;
    
    // 그룹 리스트
    @GetMapping("list")
    public List<Department> list(Model model) {
        return departmentRepository.findAll();
    }
    
}
