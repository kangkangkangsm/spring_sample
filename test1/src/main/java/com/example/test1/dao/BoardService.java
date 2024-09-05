package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import com.example.test1.model.Board;
import com.example.test1.model.Emp;
import com.example.test1.model.User;
public interface BoardService {

	
	
	HashMap<String, Object> removeBoard(HashMap<String, Object> map);
	
	HashMap<String, Object> addBoard(HashMap<String, Object> map);
	
	HashMap<String, Object> boardSearch(HashMap<String, Object> map);
	
	HashMap<String, Object> viewSearch(HashMap<String, Object> map);
	
	HashMap<String, Object> chartBoard1(HashMap<String, Object> map);
	
	HashMap<String, Object> payMents(HashMap<String, Object> map);
	
	HashMap<String, Object> Area(HashMap<String, Object> map);
	//파일업로드
	HashMap<String, Object> addBoardFile(HashMap<String, Object> map);
	
}