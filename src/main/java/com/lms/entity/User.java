package com.lms.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;


import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Data
@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;

	String borrowId;

	@Size(min=2, max=30)
	String name;
	
	@NotEmpty @NotBlank
	@Size(min=4, max=12)
	String userId;
	
	String sex;
	String phone;
	
	@NotEmpty(message="이메일을 입력해주세요")
    @Email
	String email;
	

	@NotEmpty @NotBlank
	@JsonIgnore
	private String password;

	@ManyToOne
	@JoinColumn(name = "departmentId")
	Department department;

	public String borrowCode(Department depart, int size) {
		String borrowID = "";
		int userLength = size + 1;
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
