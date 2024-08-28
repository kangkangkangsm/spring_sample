package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.example.test1.mapper.LoanMapper;
import com.example.test1.model.Loan;
import com.example.test1.model.User;


@Service
public class LoanServiceImpl implements LoanService {
	@Autowired  
	LoanMapper LoanMapper;

	//리스트 뽑기 
	@Override
	public HashMap<String, Object> bookList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			List<Loan> Loan = LoanMapper.book(map);
			resultMap.put("list", Loan);
			resultMap.put("message", "조회성공");
		} catch (Exception e) {
			resultMap.put("message", "실패...ㅜㅜ");
		}
		return resultMap;
	}
	
	@Override
	public HashMap<String, Object> memberList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			List<Loan> Loan = LoanMapper.member(map);
			resultMap.put("list", Loan);
			resultMap.put("message", "조회성공");
		} catch (Exception e) {
			resultMap.put("message", "실패...ㅜㅜ");
		}
		return resultMap;
	}
	
	// 삭제 
	@Override
	public HashMap<String, Object> removeBook(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			LoanMapper.deleteBook(map);
			resultMap.put("message", "삭제성공");
		} catch (Exception e) {
			resultMap.put("message", "삭제실패");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> removeMember(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			LoanMapper.deleteMember(map);
			resultMap.put("result", "삭제되었습니다.");
		} catch (Exception e) {
			resultMap.put("message", "삭제실패.");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> addBook(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			LoanMapper.inserBook(map);
			resultMap.put("message", "추가되었습니다..");
		} catch (Exception e) {
			resultMap.put("message", "추가 실패!");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> checkBook(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			Loan Loan = LoanMapper.bookcheck(map);
			resultMap.put("list", Loan);
		} catch (Exception e) {
		
		}
		return resultMap;
	}

	
	





}
