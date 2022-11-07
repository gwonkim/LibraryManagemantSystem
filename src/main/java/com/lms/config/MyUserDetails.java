package com.lms.config;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;
import com.lms.entity.User;
import com.lms.entity.Department;

@Data
public class MyUserDetails implements UserDetails {
	private static final long serialVersionUID = 1L;

	final boolean accountNonExpired = true;
	final boolean accountNonLocked = true;
	final boolean credentialsNonExpired = true;
	final String password;
	final String username;
	final boolean isEnabled;
	Collection<SimpleGrantedAuthority> authorities = new ArrayList<>();

	final String name;
	final String email;
	final String sex;
	final String phone;
	final Department department;

	final String borrowId;

	public MyUserDetails(User user) { //
		switch (user.getDepartment().getId()) {
		case 1: // 관리자
			authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
			break;
		case 2: // 명예회원
			authorities.add(new SimpleGrantedAuthority("ROLE_HONOR"));
			break;
		case 3: // 일반회원
			authorities.add(new SimpleGrantedAuthority("ROLE_GENERAL"));
			break;
		}
		
		// 필드 해당하는 멤버 변수
		this.username = user.getUserId();
		this.password = user.getPassword();
		this.isEnabled = user.isEnabled();
		this.name = user.getName();
		this.email = user.getEmail();
		this.borrowId = user.getBorrowId();
		this.sex = user.getSex();
		this.phone = user.getPhone();
		this.department = user.getDepartment();

	}
}
