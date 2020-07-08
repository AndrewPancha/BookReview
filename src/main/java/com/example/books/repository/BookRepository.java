package com.example.books.repository;

import com.example.books.model.Book;
import com.example.books.model.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookRepository extends CrudRepository<Book, Long> {
    List<Book> findByBookNameIgnoreCase(String bookName);
    List<Book> findByUserId(Long id);
}
