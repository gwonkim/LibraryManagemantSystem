package com.lms.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.ToString;

@Data
@Entity(name="department")
public class Department {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;

	String name;
	int period;
	int volume;

	@JsonIgnore
	@ToString.Exclude
	@OneToMany(mappedBy = "department")
	List<User> users;
}
