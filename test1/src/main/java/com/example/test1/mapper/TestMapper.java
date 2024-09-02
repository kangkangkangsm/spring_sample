package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import com.example.test1.model.Test;


@Mapper
public interface TestMapper {
	
	
	// 유저 리스트
	List<Test> selectUsers(HashMap<String, Object> map);
	// 유저 추가 
	void insertUsers(HashMap<String, Object> map);
	
	
}