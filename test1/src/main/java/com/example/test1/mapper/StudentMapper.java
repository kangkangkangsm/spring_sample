package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Emp;
import com.example.test1.model.Student;

@Mapper
public interface StudentMapper {
	List<Emp> emp(HashMap<String, Object> map);
	
	List<Student> selectStudentList(HashMap<String, Object> map);
	
	Student qwer();

	
	List<Student> abcd(HashMap<String, Object> map);
	List<Student> same(HashMap<String, Object> map);
	
	
	
	// 삭제나 수정은 void로 해도됌 
	// void qwer();
	


}
