package com.lms.repository;

import javax.validation.constraints.NotNull;

import org.springframework.data.jpa.repository.JpaRepository;

import com.lms.entity.Department;

public interface DepartmentRepository extends JpaRepository<Department, Integer>  {
	Department findById(int id);
    Department findByName(String name);
}
