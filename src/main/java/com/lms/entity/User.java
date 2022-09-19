package com.lms.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Data
@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;

	String borrow_id;
	String name;
	String user_id;
	String sex;
	String email;
	String phone;

	@JsonIgnore
	private String password;

	@ManyToOne
	@JoinColumn(name = "department_id")
	Department department;

	public String borrowCode(Department depart, List<User> users) {
		String borrowID = "";
		int userLength = users.size() + 1;
		switch (depart.id) {
		case 1: 
			borrowID += 'A';
			break;
		case 2:
			borrowID += 'B';
			break;
		case 3:
			borrowID += 'C';
			break;
		}
		borrowID += String.format("%07d", userLength);
		return borrowID;
	}
}
