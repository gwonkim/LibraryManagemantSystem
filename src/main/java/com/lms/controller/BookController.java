package com.lms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lms.entity.Book;
import com.lms.model.Pagination;
import com.lms.repository.BookRepository;
import com.lms.repository.DepartmentRepository;
import com.lms.repository.CategoryRepository;
import com.lms.repository.StateRepository;

@Controller
@RequestMapping("book")
public class BookController {
	@Autowired
	BookRepository bookRepository;
	@Autowired
	DepartmentRepository departmentRepository;
	@Autowired
	CategoryRepository categoryRepository;
	@Autowired
	StateRepository stateRepository;
	
	// 도서 검색
	// 외부인 책 검색 허용
	@RequestMapping("list")
	public String bookList(Model model, Pagination pagination) {
		List<Book> books = bookRepository.findByTitleContainingIgnoreCaseOrAuthorContainingIgnoreCaseOrPublisherContainingIgnoreCase(pagination);
		model.addAttribute("books", books);

		return "book/list";
	}
	
	// 신규도서
	@RequestMapping("new")
	public String newBookList(Model model, Pagination pagination) {
		// List<Book> books = bookRepository.findByTitleContainingIgnoreCaseOrAuthorContainingIgnoreCaseOrPublisherContainingIgnoreCase(pagination);
		List<Book> newBooks = bookRepository.findByNewBook(pagination);
        model.addAttribute("newBooks", newBooks);
		// model.addAttribute("books", books);
		return "book/new";
	}
}
