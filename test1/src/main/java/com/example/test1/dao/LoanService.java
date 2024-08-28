package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;


import com.example.test1.model.Loan;


public interface LoanService {

	//books리스트
	HashMap<String, Object> bookList(HashMap<String, Object> map);
	//members리스트
	HashMap<String, Object> memberList(HashMap<String, Object> map);
	
	HashMap<String, Object> removeBook(HashMap<String, Object> map);
	
	HashMap<String, Object> removeMember(HashMap<String, Object> map);
	
	HashMap<String, Object> addBook(HashMap<String, Object> map);
	
	HashMap<String, Object> checkBook(HashMap<String, Object> map);
}
