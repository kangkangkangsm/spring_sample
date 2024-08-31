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

import com.example.test1.dao.SchoolService;
import com.example.test1.model.School;
import com.google.gson.Gson;

@Controller
public class SchoolController {
    
    @Autowired
    SchoolService SchoolService;
      
    // 유저정보 리스트
    @RequestMapping("/school-stu.do") 
    public String userList(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{ 
    request.setAttribute("updateStuNo", map.get("updateStuNo")); 
    return "/School.stu";
    }
    
    @RequestMapping("/school-stuView.do") 
    public String userView(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("stuNo", map.get("stuNo"));
        return "/school-stuView";
    }
    
	@RequestMapping("/school-insert.do") 
	public String schoolinsert(Model model) throws Exception {
	return "/school-insert"; 
	}
	
	@RequestMapping("/school-update.do") 
	public String schoolupdate(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{ 
	request.setAttribute("stuNo", map.get("stuNo")); return "/school-update"; }
   
    
    // 유저 리스트 
    @RequestMapping(value = "/school-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String userList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap = SchoolService.SchoolUserSearch(map);
        return new Gson().toJson(resultMap);
    }
    
    // 유저 삭제 
    @RequestMapping(value = "/delete-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String deleteList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap = SchoolService.userDelete(map);
        return new Gson().toJson(resultMap);
    }
    
    //유저 상세정보 
    @RequestMapping(value = "/studentUser-view.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String userView(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap = SchoolService.userList(map);
        return new Gson().toJson(resultMap);
    }
    
    // 유저 생성 
    @RequestMapping(value = "/insert-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String insertList1(Model model, @RequestParam HashMap<String, Object> map) throws Exception {

        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap = SchoolService.userInsert(map);
        return new Gson().toJson(resultMap);
    }
    
    // 유저 수정 
    @RequestMapping(value = "/update-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String updateList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap = SchoolService.userUpdate(map);
        return new Gson().toJson(resultMap);
    }
    // 유저 수정2 
    @RequestMapping(value = "/update2-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String update2List(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap = SchoolService.userUpdate2(map);
        return new Gson().toJson(resultMap);
    }
  
 
}
