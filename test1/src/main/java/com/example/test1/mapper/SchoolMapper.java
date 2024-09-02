package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.School;



@Mapper
public interface SchoolMapper {
		
	//회원가입
//	void join(HashMap<String, Object> map);
	//로그인
//	User login(HashMap<String, Object> map);
	//유저 상세보기
	School selectStudentView(HashMap<String, Object> map);
	//유저 리스트
	List<School> selectStudentList(HashMap<String, Object> map);
	//유저 삭제 
	void deleteStudent(HashMap<String, Object> map);
	//유저 생성
	void insertStudent(HashMap<String, Object> map);
	//유저 out수정
	void updateStudent(HashMap<String, Object> map);
	//유저 in수정
	void update2Student(HashMap<String, Object> map);
	// 유저 수 카운트 
	int countStudent(HashMap<String, Object> map);
}