package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;


import com.example.test1.model.User;


public interface UserService {
	// 회원가입
	HashMap<String, Object> userJoin(HashMap<String, Object> map);
	// 로그인
	HashMap<String, Object> userLogin(HashMap<String, Object> map);
	//유저 정보 보기
	HashMap<String, Object> userSearch(HashMap<String, Object> map);
	//아이디중복체크
	HashMap<String, Object> idCheck(HashMap<String, Object> map);
	//사용자 목록 
	HashMap<String, Object> userList(HashMap<String, Object> map);
	//유저 삭제 
	HashMap<String, Object> userDelete(HashMap<String, Object> map);
	}
