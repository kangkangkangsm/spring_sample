package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;


import com.example.test1.model.Book;


public interface BookService {

	List<Book> bookList(HashMap<String, Object> map);
	
	HashMap<String, Object> removeBook(HashMap<String, Object> map);
	
	HashMap<String, Object> addBook(HashMap<String, Object> map);
	HashMap<String, Object> updateBook(HashMap<String, Object> map);
	
	HashMap<String, Object> viewBook(HashMap<String, Object> map);
}
