package com.lms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import com.lms.entity.Book;
import com.lms.repository.BookRepository;
import com.lms.repository.DepartmentRepository;

@Controller
@RestController
@CrossOrigin(origins = "*", allowedHeaders = "*")
@RequestMapping("book")
public class BookController {
    @Autowired BookRepository bookRepository;
    @Autowired DepartmentRepository departmentRepository;

    // 책목록
    @RequestMapping("list")
    public ResponseEntity<List<Book>> list(Model model) {
    	return ResponseEntity.ok().body(bookRepository.findAll());
    }
    
    // 신규 서적 등록
    @GetMapping("register")
    public ResponseEntity<Book> create(Model model) {
        Book book = new Book();
        // return bookRepository.findAll();
        return ResponseEntity.ok().body(book);
    }

    @PostMapping("register")
    public String create(Model model, Book book) {
    	bookRepository.save(book);
        return "redirect:list";
    }

    // 서적 수정
    @GetMapping("edit")
    public ResponseEntity<Book> edit(Model model, @RequestParam("id") int id) {
        Book book = bookRepository.findById(id).get();
        // List<Department> departments = departmentRepository.findAll();
        return ResponseEntity.ok().body(book);
    }

    @PostMapping("edit")
    public String edit(Model model, Book book) {
        bookRepository.save(book);
        return "redirect:list";
    }

    @RequestMapping("delete")
    public String delete(Model model, @RequestParam("id") int id) {
    	bookRepository.deleteById(id);
        return "redirect:list";
    }

}
