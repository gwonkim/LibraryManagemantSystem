package com.lms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.lms.entity.Book;
import com.lms.entity.BookReturn;
import com.lms.entity.Department;
import com.lms.repository.BookReturnRepository;

@Controller
@RequestMapping("return")
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class BookReturnController {
    @Autowired BookReturnRepository bookReturnRepository;

    // 책목록
	@RequestMapping("list")
	public String list(Model model) {
		List<BookReturn> bookreturns = bookReturnRepository.findAll();
		model.addAttribute("bookreturns", bookreturns);
		return "return/list";
	}
}
