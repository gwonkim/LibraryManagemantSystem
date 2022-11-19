package com.lms.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import java.util.List;
import com.lms.model.Pagination;
import com.lms.entity.Book;

public interface BookRepository extends JpaRepository<Book, Integer> {
    Page<Book> findByTitleContainingIgnoreCaseOrAuthorContainingIgnoreCaseOrPublisherContainingIgnoreCase(String title, String author, String publisher, Pageable pageable);
    Page<Book> findByTitleContainingIgnoreCase(String title, Pageable pageable);
    Page<Book> findByAuthorContainingIgnoreCase(String author, Pageable pageable);
    Page<Book> findByPublisherContainingIgnoreCase(String publisher, Pageable pageable);

    // 제목 검색
    public default List<Book> findByTitleContainingIgnoreCase(Pagination pagination) {
        Page<Book> page = this.findByTitleContainingIgnoreCase(pagination.getKeyword(), PageRequest
                .of(pagination.getPg() - 1, pagination.getSz(), Sort.Direction.ASC, "id"));
        pagination.setRecordCount((int) page.getTotalElements());
        return page.getContent();
    }

    // 저자 검색
    public default List<Book> findByAuthorContainingIgnoreCase(Pagination pagination) {
        Page<Book> page = this.findByAuthorContainingIgnoreCase(pagination.getKeyword(), PageRequest
                .of(pagination.getPg() - 1, pagination.getSz(), Sort.Direction.ASC, "id"));
        pagination.setRecordCount((int) page.getTotalElements());
        return page.getContent();
    }

    // 발행자 검색
    public default List<Book> findByPublisherContainingIgnoreCase(Pagination pagination) {
        Page<Book> page = this.findByPublisherContainingIgnoreCase(pagination.getKeyword(), PageRequest
                .of(pagination.getPg() - 1, pagination.getSz(), Sort.Direction.ASC, "id"));
        pagination.setRecordCount((int) page.getTotalElements());
        return page.getContent();
    }

    // 통합 검색
    public default List<Book> findByTitleContainingIgnoreCaseOrAuthorContainingIgnoreCaseOrPublisherContainingIgnoreCase(Pagination pagination) {
        if ("title".equals(pagination.getSrchTarget())) {
            return findByTitleContainingIgnoreCase(pagination);
        }
        if ("author".equals(pagination.getSrchTarget())) {
            return findByAuthorContainingIgnoreCase(pagination);
        }
        if ("publisher".equals(pagination.getSrchTarget())) {
            return findByPublisherContainingIgnoreCase(pagination);
        }
        
        Page<Book> page = this.findByTitleContainingIgnoreCaseOrAuthorContainingIgnoreCaseOrPublisherContainingIgnoreCase(
                        pagination.getKeyword(), pagination.getKeyword(), pagination.getKeyword(),
                        PageRequest.of(pagination.getPg() - 1, pagination.getSz(),
                                Sort.Direction.ASC, "id"));
        pagination.setRecordCount((int) page.getTotalElements());
        return page.getContent();
    }
}
