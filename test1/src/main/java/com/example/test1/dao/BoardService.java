package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import com.example.test1.model.Board;
import com.example.test1.model.Emp;
import com.example.test1.model.User;
public interface BoardService {

	List<Board> BoardList1(HashMap<String, Object> map);
	
	HashMap<String, Object> removeBoard(HashMap<String, Object> map);
	
	HashMap<String, Object> addBoard(HashMap<String, Object> map);
	
	List<Board> boardSearch(HashMap<String, Object> map);
	
	HashMap<String, Object> viewSearch(HashMap<String, Object> map);

	
}
