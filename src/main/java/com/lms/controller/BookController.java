package com.lms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lms.entity.Book;
import com.lms.entity.State;
import com.lms.entity.Category;
import com.lms.model.Pagination;
import com.lms.repository.BookRepository;
import com.lms.repository.DepartmentRepository;
import com.lms.repository.CategoryRepository;
import com.lms.repository.StateRepository;

@Controller
@RequestMapping("admin/book")
public class BookController {
	@Autowired
	BookRepository bookRepository;
	@Autowired
	DepartmentRepository departmentRepository;
	@Autowired
	CategoryRepository categoryRepository;
	@Autowired
	StateRepository stateRepository;

	
}
