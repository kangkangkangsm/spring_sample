package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.example.test1.mapper.SchoolMapper;
import com.example.test1.model.Book;
import com.example.test1.model.School;


@Service
public class SchoolServiceImpl implements SchoolService {
	@Autowired  
	SchoolMapper SchoolMapper;
	
	@Autowired
	HttpSession session;
	
	
	//유저 리스트
	@Override
	public HashMap<String, Object> SchoolUserSearch(HashMap<String, Object> map) {
		System.out.println(map);
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			List<School> list = SchoolMapper.selectStudentList(map);
			resultMap.put("list", list);
			resultMap.put("result", "데이터 잘 불러왔음");
		} catch (Exception e) {
			resultMap.put("result", "데이터 못불러옴");
		}
		return resultMap;
	}

	// 유저 삭제
	@Override
	public HashMap<String, Object> userDelete(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			SchoolMapper.deleteStudent(map);
			resultMap.put("result", "데이터 삭제 완료");
		} catch (Exception e) {
			resultMap.put("result", "처리못함");
		}
		return resultMap;
	}
	
	//	유저 상세 정보
	@Override
	public HashMap<String, Object> userList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		System.out.println(map);
		try {	
			School School = SchoolMapper.selectStudentView(map);
			resultMap.put("list", School);
			
		} catch (Exception e) {
			resultMap.put("result", "처리못함");
		}
		return resultMap;
	}

	// 유저 생성 
	@Override
	public HashMap<String, Object> userInsert(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		System.out.println(map);
		try {	
			SchoolMapper.insertStudent(map);
			resultMap.put("result", "생성완료");
		} catch (Exception e) {
			resultMap.put("result", "처리못함");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> upuser(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		System.out.println(map);
		try {	
			School School = SchoolMapper.stuInsert(map);
			resultMap.put("list", School);
			
		} catch (Exception e) {
			resultMap.put("result", "처리못함");
		}
		return resultMap;

	}




}
