package com.lms.model;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.lms.entity.Department;
import com.lms.entity.RequestBook;
import com.lms.entity.State;
import com.lms.entity.User;

import lombok.Data;

@Data
public class EditUser {
	public EditUser() {
	};

	public EditUser(User user) {
		this.id = user.getId();
		this.userId = user.getUserId();
		this.password1 = user.getPassword();
		this.name = user.getName();
		this.email = user.getEmail();
		this.phone = user.getPhone();
		this.sex = user.getSex();
		this.borrowId = user.getBorrowId();
		this.department = user.getDepartment();
	}

	int id;
	String userId;
	String password1;
	String name;
	String borrowId;

	@NotEmpty(message = "비밀번호를 입력하세요")
	String password2;

	@NotEmpty(message = "이메일 주소를 입력하세요")
	@Email(message = "이메일 주소가 올바르지 않습니다")
	String email;

	@NotEmpty(message = "성별을 선택하세요")
	String sex;

	@NotEmpty(message = "핸드폰 번호를 입력하세요")
	@Size(min = 10, max = 11)
	String phone;

	@NotNull
	Department department;
}
