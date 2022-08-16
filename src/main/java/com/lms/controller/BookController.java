package com.lms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.lms.entity.Book;
import com.lms.entity.User;
import com.lms.repository.BookRepository;
import com.lms.repository.UserRepository;

@Controller
@RestController
@RequestMapping("book")
public class BookController {
    @Autowired BookRepository bookRepository;

    // 책목록
    @RequestMapping("list")
    public List<Book> list(Model model) {
        return bookRepository.findAll();
    }
}
