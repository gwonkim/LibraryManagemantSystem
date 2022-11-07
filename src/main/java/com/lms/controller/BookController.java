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

	// 책목록
	@RequestMapping("list")
	public String list(Model model, Pagination pagination) {
		List<Book> books2 = bookRepository.findByCategoryId(pagination);
		List<Book> books = bookRepository.findAll();
		
		model.addAttribute("category", categoryRepository.findAll());
		model.addAttribute("books", books);
		model.addAttribute("books2", books2);
		return "admin/book/list";
	}

	// 신규 자료 등록
	@GetMapping("register")
	public String create(Model model) {
		Book book = new Book();
		List<State> staties = stateRepository.findAll();
		List<Category> categories = categoryRepository.findAll();
		model.addAttribute("book", book);
		model.addAttribute("staties", staties);
		model.addAttribute("categories", categories);
		return "admin/book/edit";
	}

	@PostMapping("register")
	public String create(Model model, Book book, Pagination pagination) {
		bookRepository.save(book);
		pagination.setDi(0);
		int lastPage = (int) Math.ceil((double) bookRepository.count() / pagination.getSz());
		pagination.setPg(lastPage);
		return "redirect:list?" + pagination.getQueryString();
	}

	// 자료 수정
	@GetMapping("edit")
	public String edit(Model model, @RequestParam("id") int id) {
		Book book = bookRepository.findById(id).get();
		List<State> staties = stateRepository.findAll();
		List<Category> categories = categoryRepository.findAll();
		model.addAttribute("book", book);
		model.addAttribute("staties", staties);
		model.addAttribute("categories", categories);
		return "admin/book/edit";
	}

	@PostMapping(value = "edit", params = "cmd=save")
	public String edit(Model model, Book book, Pagination pagination) {
		bookRepository.save(book);
		return "redirect:list?" + pagination.getQueryString();
	}

	// 자료 삭제
	@PostMapping(value = "edit", params = "cmd=delete")
	public String delete(Model model, @RequestParam("id") int id, Pagination pagination) {
		bookRepository.deleteById(id);
		return "redirect:list?" + pagination.getQueryString();
	}
}
