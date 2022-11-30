package com.lms.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.lms.entity.Notice;

public interface NoticeRepository extends JpaRepository<Notice, Integer>  {
    Notice findById(int id);
}
