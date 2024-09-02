package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.example.test1.mapper.TestMapper;
import com.example.test1.model.School;
import com.example.test1.model.Test;



@Service
public class TestServiceImpl implements TestService {
	@Autowired  
	TestMapper TestMapper;


	@Override
	public HashMap<String, Object> usersSelect(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			List<Test> list = TestMapper.selectUsers(map);
			resultMap.put("list", list);
		} catch (Exception e) {
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> usersInsert(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		System.out.println(map);
		try {
			TestMapper.insertUsers(map);
			resultMap.put("message", "추가되었습니다..");
		} catch (Exception e) {
			resultMap.put("message", "추가 실패!");
		}
		return resultMap;
	}
}
