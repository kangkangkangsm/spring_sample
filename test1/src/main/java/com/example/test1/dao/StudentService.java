package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import com.example.test1.model.Emp;
import com.example.test1.model.Student;
import com.example.test1.model.Subject;

public interface StudentService {
	
	Student searchQwer();
	
	//dao 
	// dao는 중계 
	//		= 가공까지 해야하면 여기서 처리 
	//		= 매퍼 - db 왔다가따
	//		= 예외처리까지함  
	// 게시글 조회

	
	List<Student> sameStudentList(HashMap<String, Object> map);
	
	List<Student> searchabcd(HashMap<String, Object> map);
	
	List<Emp> empList(HashMap<String, Object> map);
	
	
	
	HashMap<String, Object> searchSubject();
}
