package com.example.books.model;

import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

@Entity
public class Book {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @NotBlank(message = "Please fill the Name")
    @Length(max = 60, message = "Book name is too long")
    private String bookName;
    @NotBlank(message = "Please fill the Name")
    @Length(max = 60, message = "Author name is too long")
    private String author;
    @NotBlank(message = "Please fill the review")
    @Length(max = 4056, message = "Review is too long")
    private String review;


    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User user;

    public Book() {
    }

    public Book(String bookName, String review, User user) {
        this.bookName = bookName;
        this.review = review;
        this.user = user;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }


}
