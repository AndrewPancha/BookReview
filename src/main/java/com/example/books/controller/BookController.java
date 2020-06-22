package com.example.books.controller;

import com.example.books.model.Book;
import com.example.books.model.User;
import com.example.books.repository.BookRepository;
import com.example.books.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

public class BookController {

    private BookRepository bookRepository;

    private BookService bookService;

    @Autowired
    public BookController(BookRepository bookRepository, BookService bookService) {
        this.bookRepository = bookRepository;
        this.bookService = bookService;
    }

    @PostMapping("/delete")
    public String delete(@RequestParam String bookName, @AuthenticationPrincipal User user) {
        bookRepository.deleteByUserIdAndBookName(user.getId(), bookName);

        return "main";
    }

    @PostMapping("/edit")
    public String edit(
            @AuthenticationPrincipal User user,
            @RequestParam String bookName,
            @RequestParam String author,
            @RequestParam String review
    ) {
        bookService.edit(bookName, author, review, user.getId());

        return "/main";
    }
}
