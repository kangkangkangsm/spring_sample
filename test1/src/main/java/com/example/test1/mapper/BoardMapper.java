package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Board;
import com.example.test1.model.User;
@Mapper
public interface BoardMapper {
	
	//게시판 목록
	List<Board> selectBoardList(HashMap<String, Object> map);
	
	//게시판 삭제 
	void deleteBoard(HashMap<String, Object> map);
	
	void insertBoard(HashMap<String, Object> map);
	
	List<Board> searchBoardList(HashMap<String, Object> map);
	
	Board viewBoard(HashMap<String, Object> map);
	User viewUser(HashMap<String, Object> map);
	
}