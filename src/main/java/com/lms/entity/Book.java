package com.lms.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

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
    String call_num;
    
    @ManyToOne
    @JoinColumn(name = "state_id")
    State states;
    
    @ManyToOne
    @JoinColumn(name = "category_id")
    Category category;
}
