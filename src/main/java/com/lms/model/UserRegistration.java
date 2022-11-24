package com.lms.model;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.lms.entity.Department;
import com.lms.entity.User;

import lombok.Data;

@Data
public class UserRegistration {
	public UserRegistration() {}
	public UserRegistration(User user) {
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

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	
    @NotEmpty(message="아이디를 입력하세요")
    @Size(min=3, max=15)
    String userId;

    @NotEmpty(message="비밀번호를 입력하세요")
    String password1;
    
    @NotEmpty(message="비밀번호를 한번 더 입력하세요")
    @Size(min=6, max=12, message="6 자리 이상 12 자리 이하이어야 합니다.")
    String password2;

    @NotEmpty(message="이름을 입력하세요")
    @Size(min=2, max=30)
    String name;

    @NotEmpty(message="이메일 주소를 입력하세요")
    @Email(message="이메일 주소가 올바르지 않습니다")
    String email;
    
    @NotEmpty(message="성별을 선택하세요")
    String sex;
    
    @NotEmpty(message="핸드폰 번호를 입력하세요")
    @Size(min=10, max=11)
    String phone;
    
    @NotNull
    Department department;
    
    String borrowId;
}
