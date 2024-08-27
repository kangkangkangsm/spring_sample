package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.example.test1.mapper.UserMapper;
import com.example.test1.model.Student;
import com.example.test1.model.User;


@Service
public class UserServiceImpl implements UserService {
	@Autowired  
	UserMapper UserMapper;

	@Override
	public HashMap<String, Object> userJoin(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		System.out.println(map);
		try {
			UserMapper.join(map);
			resultMap.put("message", "회원가입 완료, 로그인페이지로 이동합니다.");
			resultMap.put("result", "success");
		} catch (Exception e) {
			resultMap.put("message", "예기치 못한 문제가 발생했습니다.");
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> userLogin(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		System.out.println(map);		
		try {
			UserMapper.login(map);
			resultMap.put("message", "로그인 완료");
		} catch (Exception e) {
			resultMap.put("message", "아이디,비밀번호 확인");
		}
		return resultMap;
	}




}
