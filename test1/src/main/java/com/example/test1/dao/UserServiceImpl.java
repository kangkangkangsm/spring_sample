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
			User User = UserMapper.login(map);	
			resultMap.put("login", User);
		} catch (Exception e) {
			resultMap.put("message", "fail");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> userSearch(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			User User = UserMapper.viewUser(map);
			resultMap.put("info", User);
			resultMap.put("result", "success");
			resultMap.put("message", "검색되었습니다.");
			System.out.println(resultMap);
		} catch (Exception e) {
			resultMap.put("result", "fail");
			resultMap.put("message", "예기치 못한 문제가 발생했습니다.");
		}
		return resultMap;
	}
	
	@Override
	public HashMap<String, Object> idCheck(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			User User = UserMapper.viewUser(map);
			resultMap.put("idCheck", User);
			resultMap.put("message", "이미 있는아이디.");
			System.out.println(resultMap);
		} catch (Exception e) {
	
		}
		return resultMap;
	}

}
