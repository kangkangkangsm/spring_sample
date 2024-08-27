package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Emp;
import com.example.test1.model.User;


@Mapper
public interface UserMapper {
	
	//게시판 목록
	
	void join(HashMap<String, Object> map);
	User login(HashMap<String, Object> map);
	User viewUser(HashMap<String, Object> map);
	
	
	//게시판 삭제 
	
	/*
	 * void insertBoard(HashMap<String, Object> map);
	 * 
	 * List<Board> searchBoardList(HashMap<String, Object> map);
	 */
	
}