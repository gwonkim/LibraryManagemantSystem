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
public class Book {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;

    String title;
    String author;
    String publisher;
    long isbn;
    String callNum;
    Date regiDate;
    boolean newBook;
    boolean checkImg;

    @ManyToOne
    @JoinColumn(name = "stateId")
    State state;
    
    @ManyToOne
    @JoinColumn(name = "categoryId")
    Category category;
}
