package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;


import com.example.test1.model.User;


public interface UserService {

	HashMap<String, Object> userJoin(HashMap<String, Object> map);
	
	HashMap<String, Object> userLogin(HashMap<String, Object> map);
	HashMap<String, Object> userSearch(HashMap<String, Object> map);
	HashMap<String, Object> idCheck(HashMap<String, Object> map);
	}
