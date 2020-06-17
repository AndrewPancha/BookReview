package com.example.books.repository;

import com.example.books.model.Book;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface BookRepository extends CrudRepository<Book, Long> {
    List<Book> findByBookNameIgnoreCase(String bookName);
}
