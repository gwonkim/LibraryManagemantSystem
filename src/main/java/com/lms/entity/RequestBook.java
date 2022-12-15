package com.lms.entity;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Data;

@Data
@Entity(name="requestbook")
public class RequestBook {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;

    String title;
    String author;
    String publisher;
    long isbn;
    LocalDateTime  date;
    String etc;

    @ManyToOne
    @JoinColumn(name = "userId")
    User user;
    
    @ManyToOne
    @JoinColumn(name = "stateId")
    State state;
}
