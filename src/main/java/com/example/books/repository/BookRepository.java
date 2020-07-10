package com.example.books.repository;

import com.example.books.model.Book;
import com.example.books.model.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookRepository extends CrudRepository<Book, Long> {
    @Query("SELECT b FROM Book b WHERE b.bookName = :bookName")
    Iterable<Book> findBooksByBookName(@Param("bookName") String bookName);

    List<Book> findByUserId(Long id);
}
