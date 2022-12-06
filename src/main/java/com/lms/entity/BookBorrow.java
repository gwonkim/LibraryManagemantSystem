package com.lms.entity;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Data;

@Data
@Entity(name="bookborrow")
public class BookBorrow {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    LocalDate borrowDate;
    LocalDate returnDate;

    @ManyToOne
    @JoinColumn(name = "bookId")
    Book book;

    @ManyToOne
    @JoinColumn(name = "userId")
    User user;

    @ManyToOne
    @JoinColumn(name = "stateId")
    State state;
}
