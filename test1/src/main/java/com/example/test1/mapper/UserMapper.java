package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Book;
import com.example.test1.model.Emp;
import com.example.test1.model.User;


@Mapper
public interface UserMapper {
		
	//회원가입
	void join(HashMap<String, Object> map);
	//로그인
	User login(HashMap<String, Object> map);
	//유저 상세보기
	User viewUser(HashMap<String, Object> map);
	//유저 리스트
	List<User> selectUserList(HashMap<String, Object> map);
	//유저 삭제 
	void deleteUser(HashMap<String, Object> map);
	
}