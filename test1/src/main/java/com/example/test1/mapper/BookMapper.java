package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import com.example.test1.model.Book;


@Mapper
public interface BookMapper {
	
	//게시판 목록
	List<Book> selectBookList(HashMap<String, Object> map);
	
	void deleteBook(HashMap<String, Object> map);
	void insertBook(HashMap<String, Object> map);
	void updateBook(HashMap<String, Object> map);
	
	//게시판 삭제 
	
	/*
	 * void insertBoard(HashMap<String, Object> map);
	 * 
	 * List<Board> searchBoardList(HashMap<String, Object> map);
	 */
	
}