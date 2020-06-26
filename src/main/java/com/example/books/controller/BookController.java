package com.example.books.controller;

import com.example.books.model.Book;
import com.example.books.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class BookController {

    private BookRepository bookRepository;


    @Autowired
    public BookController(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    @GetMapping("/delete/{book}")
    public String delete(@PathVariable Book book) {
        bookRepository.delete(book);

        return "main";
    }

    @GetMapping("/bookProfile/{book}")
    public String viewBook(@PathVariable Book book, Model model) {
        model.addAttribute("book", book);
        return "bookProfile";
    }

    @GetMapping("/bookEdit/{book}")
    public String userEditForm(@PathVariable Book book, Model model) {
        model.addAttribute("book", book);
        return "bookEdit";
    }

    @PostMapping("/edit")
    public String userSave(
            @RequestBody Book book
    ) {
        bookRepository.save(book);
        return "main";
    }
}
