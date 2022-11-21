package com.lms.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Data;

@Data
@Entity
public class BookBorrow {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    Date borrowDate;
    Date returnDate;

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
