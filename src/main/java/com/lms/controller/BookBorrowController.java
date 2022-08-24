package com.lms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.lms.entity.BookBorrow;
import com.lms.repository.BookBorrowRepository;

@RestController
@RequestMapping("borrow")
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class BookBorrowController {
    @Autowired BookBorrowRepository bookBorrowRepository;

    // 책 대출 목록
    @RequestMapping("list")
    public List<BookBorrow> list(Model model) {
        return bookBorrowRepository.findAll();
    }
}
