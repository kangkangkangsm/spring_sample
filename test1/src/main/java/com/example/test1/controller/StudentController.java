package com.example.test1.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.StudentService;
import com.example.test1.model.Emp;
import com.example.test1.model.Student;
import com.google.gson.Gson;

@Controller
public class StudentController {
	
	@Autowired
	StudentService studentService;
	
	@RequestMapping("/student.do") 
    public String main(Model model) throws Exception{

        return "/student-list";
    }
	
	@RequestMapping("/test.do") 
    public String main1(Model model) throws Exception{
		
        return "/test";  
    }
	
	@RequestMapping("/abc.do") 
    public String main2(Model model) throws Exception{
		
        return "/abc";  
    }
	
	@RequestMapping("/emp.do") 
    public String main3(Model model) throws Exception{
		
        return "/emp-list";  
    }
	
	@RequestMapping(value = "/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchBbsList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Student> list = studentService.searchStudentList(map);
		resultMap.put("list", list);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/ok.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String qwer(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Student stu = studentService.searchQwer();
		resultMap.put("stu", stu);
		resultMap.put("result", "success");
		
		// {stu : {stuNo:12345637,stuName:옥한빛..}, result : success}....
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/abc.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String abcd(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
	
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Student> a = studentService.searchabcd(map);
		resultMap.put("info", a);
		resultMap.put("result", "success");
		
		// {stu : {stuNo:12345637,stuName:옥한빛..}, result : success}....
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/deptInfo.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String same(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Student> list = studentService.sameStudentList(map);
		resultMap.put("samelist", list);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
		@RequestMapping(value = "/emplist.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String emp(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			List<Emp> list = studentService.empList(map);
			resultMap.put("list", list);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
}


