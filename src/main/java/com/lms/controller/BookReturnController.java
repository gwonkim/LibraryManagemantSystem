package com.lms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.lms.entity.BookReturn;
import com.lms.repository.BookReturnRepository;

@RestController
@RequestMapping("return")
public class BookReturnController {
    @Autowired BookReturnRepository BookReturnRepository;

    // 책목록
    @RequestMapping("list")
    public List<BookReturn> find(Model model) {
        return BookReturnRepository.findAll();
    }
}
