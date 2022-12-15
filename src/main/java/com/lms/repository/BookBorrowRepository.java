package com.lms.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.lms.entity.BookBorrow;

public interface BookBorrowRepository extends JpaRepository<BookBorrow, Integer>  {

    List<BookBorrow> findByUserId(int userId);

}
