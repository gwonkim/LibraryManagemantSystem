package com.lms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.lms.entity.User;
import com.lms.model.PwRegistration;
import com.lms.model.UserRegistration;
import com.lms.repository.UserRepository;
import com.lms.repository.DepartmentRepository;

@Service
public class UserService {
	@Autowired
	UserRepository userRepository;
	@Autowired
	DepartmentRepository departmentRepository;
	@Autowired
	PasswordEncoder passwordEncoder;

	public List<User> findAll() {
		return userRepository.findAll();
	}

	// 회원가입
	public boolean hasErrors(UserRegistration userRegistration, BindingResult bindingResult) {
		if (bindingResult.hasErrors())
			return true;
		if (userRegistration.getPassword1().equals(userRegistration.getPassword2()) == false) {
			bindingResult.rejectValue("password2", null, "비밀번호가 일치하지 않습니다.");
			return true;
		}
		User user = userRepository.findByUserId(userRegistration.getUserId());
		if (user != null) {
			bindingResult.rejectValue("userId", null, "사용자 아이디가 중복됩니다.");
			return true;
		}
		return false;
	}

	// 사용자의 개인정보 수정
	public boolean hasEditErrors(UserRegistration userRegistration, BindingResult bindingResult) {
		if (bindingResult.hasErrors())
			return true;
		if (passwordEncoder.matches(userRegistration.getPassword1(), userRegistration.getPassword2())) {
			bindingResult.rejectValue("password2", null, "비밀번호가 일치하지 않습니다.");
			return true;
		}
		return false;
	}

	// 사용자의 비밀번호 수정
	public boolean hasEditPwErrors(PwRegistration pwRegistration, BindingResult bindingResult) {
		if (bindingResult.hasErrors())
			return true;

		String pw = userRepository.findByUserId(pwRegistration.getId()).getPassword();
		if (passwordEncoder.matches(pw, pwRegistration.getPassword())) {
			bindingResult.rejectValue("password", null, "기존 비밀번호가 일치하지 않습니다.");
			return true;
		}
		if (pwRegistration.getEditPassword1().equals(pwRegistration.getEditPassword2()) == false) {
			bindingResult.rejectValue("editPassword2", null, "신규 비밀번호가 일치하지 않습니다.");
			return true;
		}
		return false;
	}

	public User createEntity(UserRegistration userRegistration) {
		User user = new User();
		user.setUserId(userRegistration.getUserId());
		user.setPassword(passwordEncoder.encode(userRegistration.getPassword1()));
		user.setName(userRegistration.getName());
		user.setEmail(userRegistration.getEmail());
		user.setEnabled(true);
		user.setSex(userRegistration.getSex());
		user.setPhone(userRegistration.getPhone());
		String borrowId;
		if (userRegistration.getDepartment().getId() > 0) {
			borrowId = user.borrowCode(userRegistration.getDepartment().getId(), userRepository.findAll().size());
			user.setDepartment(userRegistration.getDepartment());
		} else {
			borrowId = user.borrowCode(2, userRepository.findAll().size());
			user.setDepartment(departmentRepository.findById(2));
		}
		user.setBorrowId(borrowId);
		return user;
	}

	public void save(UserRegistration userRegistration) {
		User user = createEntity(userRegistration);
		userRepository.save(user);
	}

	public void edit(UserRegistration userRegistration) {
		User user = new User();
		user.setUserId(userRegistration.getUserId());
		user.setPassword(passwordEncoder.encode(userRegistration.getPassword1()));
		user.setName(userRegistration.getName());
		user.setEmail(userRegistration.getEmail());
		user.setEnabled(true);
		user.setSex(userRegistration.getSex());
		user.setPhone(userRegistration.getPhone());
		user.setDepartment(userRegistration.getDepartment());
		user.setBorrowId(userRegistration.getBorrowId());
		userRepository.save(user);
	}

	public void editUser(UserRegistration userRegistration) {
		User user = userRepository.findById(userRegistration.getId());
		user.setEmail(userRegistration.getEmail());
		user.setSex(userRegistration.getSex());
		user.setPhone(userRegistration.getPhone());
		userRepository.save(user);
	}

	public void editPw(PwRegistration pwRegistration) {
		User user = userRepository.findByUserId(pwRegistration.getId());
		user.setPassword(passwordEncoder.encode(pwRegistration.getEditPassword1()));
		userRepository.save(user);
	}
}
