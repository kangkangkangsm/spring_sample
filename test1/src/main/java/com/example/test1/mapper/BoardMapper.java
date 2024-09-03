package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Board;
import com.example.test1.model.User;
@Mapper
public interface BoardMapper {
	
	//카운팅
	int selectPaging(HashMap<String, Object> map);
	//게시판 삭제 
	void deleteBoard(HashMap<String, Object> map);
	
	void insertBoard(HashMap<String, Object> map);
	
	List<Board> searchBoardList(HashMap<String, Object> map);
	
	Board viewBoard(HashMap<String, Object> map);
	
	List<Board> innerBoard(HashMap<String, Object> map);
	
	List<Board> chartBoard(HashMap<String, Object> map);
	
	void insertPayment(HashMap<String, Object> map);
	
	List<Board> selectArea(HashMap<String, Object> map);
	
	List<Board> selectAreaGu(HashMap<String, Object> map);
	
	List<Board> selectAreaDong(HashMap<String, Object> map);
}