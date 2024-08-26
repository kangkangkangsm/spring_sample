package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Board;
import com.example.test1.model.Emp;


@Mapper
public interface BoardMapper {
	
	List<Board> selectBoardList(HashMap<String, Object> map);
}
