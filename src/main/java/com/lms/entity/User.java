package com.lms.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonBackReference;
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
    @JsonBackReference
    Department department;
}
