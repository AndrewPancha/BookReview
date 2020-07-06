package com.example.books.controller;

import com.example.books.model.Book;
import com.example.books.model.User;
import com.example.books.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;


@Controller
public class MainController {

    private BookRepository bookRepository;

    @Autowired
    public MainController(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    @GetMapping("/")
    public String mainLogin(Model model) {
        return "greeting";
    }

    @GetMapping("/reviews")
    public String getReviews(Model model) {
        Iterable<Book> books = bookRepository.findAll();
        model.addAttribute("books", books);

        return "reviews";
    }

    @GetMapping("/greeting")
    public String greeting() {
        return "greeting";
    }

    @GetMapping("/main")
    public String main(Model model) {
        Iterable<Book> books = bookRepository.findAll();
        model.addAttribute("books", books);
        return "main";
    }

    @PostMapping("/add")
    public String add(
            @AuthenticationPrincipal User user,
            @Valid Book book,
            BindingResult bindingResult,
            Model model
    ) {
        book.setUser(user);
        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("book", book);
        } else {

            model.addAttribute("message", null);
            bookRepository.save(book);

        }
        return "main";
    }

    @GetMapping("/find")
    public String find(@RequestParam String findBookName, Model model) {
        Iterable<Book> books = bookRepository.findByBookNameIgnoreCase(findBookName);
        if (books == null) {
            model.addAttribute("message", "Can't find!");
            return "main";
        }
        model.addAttribute("books", books);
        return "main";
    }

    @GetMapping("/home")
    public String home(Model model) {
        Iterable<Book> books = bookRepository.findAll();
        model.addAttribute("books", books);

        return "home";
    }

    @GetMapping("/globalFind")
    public String globalFind(@RequestParam String findBookName, Model model) {
        Iterable<Book> books = bookRepository.findByBookNameIgnoreCase(findBookName);
        if (books != null) {
            model.addAttribute("books, books");
            return "home";
        }
        model.addAttribute("message", "Can't find!");
        return "home";
    }


}
