package com.example.books.controller;

import com.example.books.model.Book;
import com.example.books.model.User;
import com.example.books.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.Map;


@Controller
public class MainController {

    @Autowired
    private BookRepository bookRepository;

    @GetMapping("/")
    public String mainLogin(Model model) {
        return "greeting";
    }

//    @GetMapping("/login")
//    public String greeting(Model model) {
//        return "login";
//    }

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
            model.addAttribute("book", null);
            bookRepository.save(book);
        }
        Iterable<Book> books = bookRepository.findAll();
        model.addAttribute("books", books);
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
        Iterable<Book> books = bookRepository.findAll();
        if (books == null) {
            model.addAttribute("message", "Can't find!");
            return "home";
        }
        model.addAttribute("books, books");
        return "home";
    }


}
