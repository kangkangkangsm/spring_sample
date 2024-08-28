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
    UserService userService;
    
    //회원가입
    @RequestMapping("/join.do") 
    public String join(Model model) throws Exception {
        return "/join";
    }
    
    // 로그인
    @RequestMapping("/login.do") 
    public String login(Model model) throws Exception {
        return "/login";
    }
    
    // 유저정보 상세보기
    @RequestMapping("/user-view.do")  // 변경된 URL 경로
    public String main4(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        request.setAttribute("userId", map.get("userId"));
        return "/board/user-view";
    }
    
    // 유저정보 리스트
    @RequestMapping("/user-list.do") 
    public String main5(Model model) throws Exception {
        return "/user-list";
    }
    
    //회원가입 
    @RequestMapping(value = "/join.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String insertUser(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap = userService.userJoin(map);
        return new Gson().toJson(resultMap);
    }
    
    // 로그인 
    @RequestMapping(value = "/login.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String loginUser(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap = userService.userLogin(map);
        return new Gson().toJson(resultMap);
    }
    
    // 유저 정보 
    @RequestMapping(value = "/user-view.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8") // 변경된 URL 경로
    @ResponseBody
    public String boardUserView(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap = userService.userSearch(map);
        System.out.println(resultMap);    
        return new Gson().toJson(resultMap);
    }
    
    // 아이디 중복 체크 
    @RequestMapping(value = "/user.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String idCheck(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap = userService.idCheck(map);
        System.out.println(resultMap);    
        return new Gson().toJson(resultMap);
    }
    
    // 유저 리스트 
    @RequestMapping(value = "/user-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String userList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap = userService.userList(map);
        return new Gson().toJson(resultMap);
    }
 // 유저 삭제
    @RequestMapping(value = "/user-delete.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String userDelete(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap = userService.userDelete(map);
        return new Gson().toJson(resultMap);
    }
}
