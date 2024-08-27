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

import com.example.test1.dao.UserService;
import com.example.test1.model.User;
import com.google.gson.Gson;

@Controller
public class UserController {
			
	@Autowired
	UserService UserService;
	
	@RequestMapping("/login.do") 
    public String login(Model model) throws Exception{

        return "/login";
    }
	
	@RequestMapping("/join.do") 
    public String join(Model model) throws Exception{

        return "/join";
    }

	
	//회원가입 
		@RequestMapping(value = "/join.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String insertUser(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			resultMap = UserService.userJoin(map);
		
		return new Gson().toJson(resultMap);
		}
	//로그인
		@RequestMapping(value = "/login.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String loginUser(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			resultMap = UserService.userLogin(map);
		
		return new Gson().toJson(resultMap);
		}
	
	
}
