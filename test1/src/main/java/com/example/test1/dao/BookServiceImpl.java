package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.example.test1.mapper.BookMapper;
import com.example.test1.model.Board;
import com.example.test1.model.Book;


@Service
public class BookServiceImpl implements BookService {
	@Autowired  
	BookMapper BookMapper;

	@Override
	public List<Book> bookList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return BookMapper.selectBookList(map);
	}

	@Override
	public HashMap<String, Object> removeBook(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			BookMapper.deleteBook(map);
			resultMap.put("message", "삭제되었습니다.");
		} catch (Exception e) {
			resultMap.put("message", "예기치 못한 문제가 발생했습니다.");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> addBook(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		System.out.println(map);
		try {
			BookMapper.insertBook(map);
			resultMap.put("message", "저장되었습니다..");
		} catch (Exception e) {
			resultMap.put("message", "예기치 못한 문제가 발생했습니다.");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> updateBook(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		System.out.println(map);
		try {
			BookMapper.updateBook(map);
			resultMap.put("message", "저장되었습니다..");
		} catch (Exception e) {
			resultMap.put("message", "예기치 못한 문제가 발생했습니다.");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> viewBook(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
	
		try {
			Book Book = BookMapper.bookView(map);
			resultMap.put("BookInfo", Book);
			resultMap.put("message", "책 정보조회 완료");
		} catch (Exception e) {
			resultMap.put("message", "예기치 못한 문제가 발생했습니다.");
		}
		return resultMap;
	}

	





}
