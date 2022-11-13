package com.lms.entity;

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

	String userId;
	String borrowId;
	String name;
	String sex;
	String phone;
	String email;
	boolean enabled;
	
	@JsonIgnore
	private String password;

	@ManyToOne
	@JoinColumn(name = "departmentId")
	Department department;

	public String borrowCode(int departId, int size) {
		String borrowID = "";
		int userLength = size + 1;
		switch (departId) {
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
