package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import com.example.test1.model.Loan;


@Mapper
public interface LoanMapper {
	
	//게시판 목록
	// books 리스트
	List<Loan> book(HashMap<String, Object> map);
	// members 리스트
	List<Loan> member(HashMap<String, Object> map);
	
	void deleteBook(HashMap<String, Object> map);
	
	void deleteMember(HashMap<String, Object> map);
	
	void inserBook(HashMap<String, Object> map);
	
	Loan bookcheck(HashMap<String, Object> map);
	//게시판 삭제 
	
	/*
	 * void insertBoard(HashMap<String, Object> map);
	 * 
	 * List<Board> searchBoardList(HashMap<String, Object> map);
	 */
	
}