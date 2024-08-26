package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.StudentMapper;
import com.example.test1.model.Emp;
import com.example.test1.model.Student;
import com.example.test1.model.Subject;

@Service
public class StudentServiceImpl implements StudentService{
	//dao 
		// dao는 중계 
		//		= 가공까지 해야하면 여기서 처리 
		//		= 매퍼 - db 왔다가따
		//		= 예외처리까지함  
		// 게시글 조회
		// mapper에 있는 거 호출 
	@Autowired  
	// 메소드 하나당 객체 하나만 만들어도됌 
	StudentMapper studentMapper;
	
	

	@Override
	public Student searchQwer() {
		// TODO Auto-generated method stub
		Student s = studentMapper.qwer();
		return s;
		
	}

	@Override
	public List<Student> sameStudentList(HashMap<String, Object> map) {
		return studentMapper.same(map);
	}

	@Override
	public List<Student> searchabcd(HashMap<String, Object> map) {
		
		return studentMapper.abcd(map);
	}

	@Override
	public List<Emp> empList(HashMap<String, Object> map) {
		return studentMapper.emp(map);

	}


	@Override
	public HashMap<String, Object> searchSubject() {
		HashMap<String, Object> resultMap = new HashMap<>();
		List<Student> subject = studentMapper.subject();
		List<Student> student = studentMapper.selectStudentList();
		
		resultMap.put("subList", subject);
		resultMap.put("stuList", student);
		
		return resultMap;
	}

	
	//db 호출 데이터, 결과(성공,실패), 메시지(성공메시지, 오류메시지) 



}
