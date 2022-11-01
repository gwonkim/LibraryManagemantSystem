package com.lms.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import java.util.List;
import com.lms.model.Pagination;


import com.lms.entity.Book;

public interface BookRepository extends JpaRepository<Book, Integer>  {

	public default List<Book> findAll(Pagination pagination) {
        Page<Book> page = this.findAll(PageRequest.of(pagination.getPg() - 1, pagination.getSz(),
                                           Sort.Direction.ASC, "id"));
        pagination.setRecordCount((int)page.getTotalElements());
        return page.getContent();
    }

    Page<Book> findByCategoryId(int departmentId, Pageable pageable);

    public default List<Book> findByCategoryId(Pagination pagination) {
        if (pagination.getDi() == 0) return findAll(pagination);
        Page<Book> page = this.findByCategoryId(pagination.getDi(),
                PageRequest.of(pagination.getPg() - 1, pagination.getSz(), Sort.Direction.ASC, "id"));
        pagination.setRecordCount((int)page.getTotalElements());
        return page.getContent();
    }

}
