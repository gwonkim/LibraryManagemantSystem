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
@Entity(name="notice")
public class Notice {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;

    String title;
    String content;
    boolean pin;
    int hit;

    LocalDate date;

    @ManyToOne
    @JoinColumn(name = "userId")
    User user;
}