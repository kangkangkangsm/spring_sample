package com.example.test1.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.test1.dao.TestService;
import com.example.test1.model.Test;
import com.google.gson.Gson;

@Controller
public class TestController {
			
	@Autowired
	TestService TestService;
	
	@RequestMapping("/testUser.do") 
    public String main(Model model) throws Exception{

        return "/test/userList";
    }
	
	@RequestMapping("/testUserInsert.do") 
    public String main2(Model model) throws Exception{

        return "/test/userInsert";
    }
	
	
	//유저목록
	@RequestMapping(value = "/testUser-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String testMembesList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = TestService.usersSelect(map);
	return new Gson().toJson(resultMap);
	}

	//유저추가
	@RequestMapping(value = "/testUser-insert.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String testMembesInsert(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = TestService.usersInsert(map);
	return new Gson().toJson(resultMap);
	}
			
}
