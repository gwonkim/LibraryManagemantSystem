package com.lms.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.lms.entity.BookReturn;

public interface BookReturnRepository extends JpaRepository<BookReturn, Integer>  {

    List<BookReturn> findByUserId(int userId);

}
