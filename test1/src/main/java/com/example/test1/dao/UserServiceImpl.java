package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.example.test1.mapper.UserMapper;
import com.example.test1.model.Student;
import com.example.test1.model.User;


@Service
public class UserServiceImpl implements UserService {
	@Autowired  
	UserMapper UserMapper;
	
	@Autowired
	HttpSession session;
	
	// 회원가입
	@Override
	public HashMap<String, Object> userJoin(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		System.out.println("service>>>>>>>>>>>>" + map);
		try {
			UserMapper.join(map);
			resultMap.put("message", "회원가입 완료!");
			resultMap.put("result", "success");
		} catch (Exception e) {
			resultMap.put("message", "예기치 못한 문제가 발생했습니다.");
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
		
			//로그인
	// 세션 JWT 버전 또 있음 
	@Override
	public HashMap<String, Object> userLogin(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			User User = UserMapper.login(map);	
			resultMap.put("login", User);
			resultMap.put("message", "로그인 완료");
			resultMap.put("result", "success");
			
			session.setAttribute("sessionId", User.getUserId());
			session.setAttribute("sessionName", User.getUserName());
			session.setAttribute("sessionStatus", User.getStatus());
			session.setAttribute("sessionEmail", User.getEmail());
		} catch (Exception e) {
			resultMap.put("message", "예기치 못한 문제 발생 \n 나중에 다시 확인");
		}
		return resultMap;
	}

		// 유저 상세정보
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

		// 중복체크
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


	//유저 리스트
	@Override
	public HashMap<String, Object> userList(HashMap<String, Object> map) {
		System.out.println(map);
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			List<User> list = UserMapper.selectUserList(map);
			resultMap.put("list", list);
			resultMap.put("result", "데이터 잘 불러왔음");
		} catch (Exception e) {
			resultMap.put("result", "데이터 못불러옴");
		}
		return resultMap;
	}


	@Override
	public HashMap<String, Object> userDelete(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			UserMapper.deleteUser(map);
			resultMap.put("message", "삭제되었습니다.");
		} catch (Exception e) {
			resultMap.put("message", "예기치 못한 문제가 발생했습니다.");
		}
		return resultMap;
	}



}
