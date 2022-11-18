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
import com.lms.model.Pagination;
import com.lms.entity.Category;
import com.lms.repository.BookRepository;
import com.lms.repository.DepartmentRepository;
import com.lms.repository.CategoryRepository;
import com.lms.repository.StateRepository;

@Controller
@RequestMapping("book")
// 외부인 책 검색 허용
public class BookController {
	@Autowired
	BookRepository bookRepository;
	@Autowired
	DepartmentRepository departmentRepository;
	@Autowired
	CategoryRepository categoryRepository;
	@Autowired
	StateRepository stateRepository;

	@RequestMapping("list")
	public String bookList(Model model, Pagination pagination) {
		List<Book> books = bookRepository.findByCategoryId(pagination);
		model.addAttribute("categories", categoryRepository.findAll());
		model.addAttribute("books", books);

		return "book/list";
	}
}
