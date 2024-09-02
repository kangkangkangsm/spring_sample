package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;


import com.example.test1.model.Test;


public interface TestService {

	//유저 리스트
	HashMap<String, Object> usersSelect(HashMap<String, Object> map);
	//유저 추가 
	HashMap<String, Object> usersInsert(HashMap<String, Object> map);
	
}
