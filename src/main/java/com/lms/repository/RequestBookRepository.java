package com.lms.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.lms.entity.RequestBook;

public interface RequestBookRepository extends JpaRepository<RequestBook, Integer>  {
    RequestBook findById(int id); 
    List<RequestBook> findByUserId(int id);
    List<RequestBook> findByStateId(int stateId);
}
