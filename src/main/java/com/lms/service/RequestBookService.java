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
import com.lms.repository.StateRepository;

@Service
public class RequestBookService {
	@Autowired
	UserRepository userRepository;
	@Autowired
	DepartmentRepository departmentRepository;
	@Autowired
	StateRepository stateRepository;
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

	public void adminEdit(RequestBook requestBook) {
		RequestBook newRBook = new RequestBook();
		newRBook.setId(requestBook.getId());
		newRBook.setTitle(requestBook.getTitle());
		newRBook.setAuthor(requestBook.getAuthor());
		newRBook.setPublisher(requestBook.getPublisher());
		newRBook.setIsbn(requestBook.getIsbn());
		newRBook.setEtc(requestBook.getEtc());
		newRBook.setUser(userRepository.findByUserId(requestBook.getUser().getUserId()));
		newRBook.setState(stateRepository.findById(requestBook.getState().getId()));
		newRBook.setDate(requestBook.getDate());
		requestBookRepository.save(newRBook);
	}
}
