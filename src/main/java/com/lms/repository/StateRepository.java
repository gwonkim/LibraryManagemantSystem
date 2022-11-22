package com.lms.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.lms.entity.State;

public interface StateRepository extends JpaRepository<State, Integer>  {
    
    State findById(int id);

}
