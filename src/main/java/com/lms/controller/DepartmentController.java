package com.lms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.lms.entity.Department;
import com.lms.entity.User;
import com.lms.repository.DepartmentRepository;

@Controller
@RequestMapping("department")
public class DepartmentController {

	@Autowired
	DepartmentRepository departmentRepository;

	@RequestMapping("list")
	public String list(Model model) {
		List<Department> departments = departmentRepository.findAll();
		model.addAttribute("departments", departments);
		return "department/list";
	}

	@RequestMapping("group")
	public String group(Model model) {
		List<Department> departments = departmentRepository.findAll();
		model.addAttribute("departments", departments);
		return "department/group";
	}

	@GetMapping("create")
	public String create(Model model) {
		Department department = new Department();
		model.addAttribute("department", department);
		return "department/edit";
	}

	@PostMapping("create")
	public String create(Model model, Department department) {
		departmentRepository.save(department);
		return "redirect:group";
	}

	@GetMapping("edit")
	public String edit(Model model, @RequestParam("id") int id) {
		Department department = departmentRepository.findById(id);
		model.addAttribute("department", department);
		return "department/edit";
	}

	@PostMapping("edit")
	public String edit(Model model, Department department) {
		departmentRepository.save(department);
		return "redirect:group";
	}

	@RequestMapping("delete")
	public String delete(Model model, @RequestParam("id") int id) {
		departmentRepository.deleteById(id);
		return "redirect:group";
	}
}
