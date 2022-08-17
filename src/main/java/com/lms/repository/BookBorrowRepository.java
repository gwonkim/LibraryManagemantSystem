package com.lms.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.lms.entity.BookBorrow;

public interface BookBorrowRepository extends JpaRepository<BookBorrow, Integer>  {

}
