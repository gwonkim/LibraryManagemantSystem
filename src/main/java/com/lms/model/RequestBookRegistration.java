package com.lms.model;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import com.lms.entity.RequestBook;
import com.lms.entity.State;
import com.lms.entity.User;

import lombok.Data;

@Data
public class RequestBookRegistration {
	public RequestBookRegistration() {};

	public RequestBookRegistration(RequestBook RequestBook) {
		this.id = RequestBook.getId();
		this.title = RequestBook.getTitle();
		this.author = RequestBook.getAuthor();
		this.publisher = RequestBook.getPublisher();
		this.isbn = RequestBook.getIsbn();
		this.user = RequestBook.getUser();
		this.state = RequestBook.getState();
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;

	@NotEmpty(message = "자료명을 입력하세요")
	String title;

	@NotEmpty(message = "저자를 입력하세요")
	String author;

	@NotEmpty(message = "발행자를 입력하세요")
	String publisher;

	@NotNull(message = "ISBN를 입력하세요")
	long isbn;

	User user;
	State state;
}
