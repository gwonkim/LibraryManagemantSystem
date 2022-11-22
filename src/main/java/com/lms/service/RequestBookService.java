package com.lms.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.lms.entity.RequestBook;
import com.lms.model.RequestBookRegistration;
import com.lms.repository.UserRepository;
import com.lms.repository.DepartmentRepository;
import com.lms.repository.RequestBookRepository;

@Service
public class RequestBookService {
	@Autowired
	UserRepository userRepository;
	@Autowired
	DepartmentRepository departmentRepository;
	@Autowired
	RequestBookRepository requestBookRepository;

	public List<RequestBook> findAll() {
		return requestBookRepository.findAll();
	}

	public boolean hasErrors(RequestBookRegistration rBRegistration, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) return true;
		return false;
	}

	public RequestBook createEntity(RequestBookRegistration rBRegistration) {
		RequestBook requestBook = new RequestBook();
		requestBook.setTitle(rBRegistration.getTitle());
		requestBook.setAuthor(rBRegistration.getAuthor());
		requestBook.setPublisher(rBRegistration.getPublisher());
		requestBook.setIsbn(rBRegistration.getIsbn());
		requestBook.setUser(rBRegistration.getUser());
		requestBook.setState(rBRegistration.getState());
		requestBook.setDate(LocalDateTime.now());
		return requestBook;
	}

	public void save(RequestBookRegistration rBRegistration) {
		RequestBook requestBook = createEntity(rBRegistration);
		requestBookRepository.save(requestBook);
	}

	public void edit(RequestBookRegistration rBRegistration) {
		RequestBook requestBook = new RequestBook();
		requestBook.setId(rBRegistration.getId());
		requestBook.setTitle(rBRegistration.getTitle());
		requestBook.setAuthor(rBRegistration.getAuthor());
		requestBook.setPublisher(rBRegistration.getPublisher());
		requestBook.setIsbn(rBRegistration.getIsbn());
		requestBook.setUser(rBRegistration.getUser());
		requestBook.setState(rBRegistration.getState());
		requestBook.setDate(LocalDateTime.now());
		requestBookRepository.save(requestBook);
	}
}
