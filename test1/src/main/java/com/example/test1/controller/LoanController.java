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

import com.example.test1.dao.LoanService;
import com.example.test1.model.Loan;
import com.google.gson.Gson;

@Controller
public class LoanController {
			
	@Autowired
	LoanService LoanService;
	
	@RequestMapping("/Loan.do") 
    public String main(Model model) throws Exception{

        return "/Loan/Loan-list";
    }
	
	@RequestMapping("/insert.do") 
    public String main2(Model model) throws Exception{

        return "/Loan/book-insert";
    }
	@RequestMapping("/Loan/bookView.do") 
    public String main3(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("bookId", map.get("bookId"));
        return "/Loan/book-view";
    }
	
	@RequestMapping("/StudyList.do") 
    public String p1(Model model) throws Exception{

        return "/projectT/studyGroupList";
    }
	@RequestMapping("/StudyCreate.do") 
    public String p2(Model model) throws Exception{

        return "/projectT/studyGroupCreate";
    }
	@RequestMapping("/StudyView.do") 
    public String p3(Model model) throws Exception{

        return "/projectT/studyGroupView";
    }
	

	
	//책 목록 페이지
	@RequestMapping(value = "/members-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String membesList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = LoanService.memberList(map);
	return new Gson().toJson(resultMap);
}

	//멤버 목록 페이지
	@RequestMapping(value = "/books-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String booksList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = LoanService.bookList(map);
	return new Gson().toJson(resultMap);
}
	
	//멤버 삭제 
		@RequestMapping(value = "/members-delete.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String memberDelete(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			System.out.println(map);
			
			resultMap = LoanService.removeMember(map);
		return new Gson().toJson(resultMap);
	}
	
	//책 삭제 
		@RequestMapping(value = "/books-delete.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String bookDelete(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			
			resultMap = LoanService.removeBook(map);
			
		return new Gson().toJson(resultMap);
	}
		@RequestMapping(value = "/books-insert.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String bookInsert(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			
			resultMap = LoanService.addBook(map);
			
		return new Gson().toJson(resultMap);
	}
		
		@RequestMapping(value = "/book-check.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String bookCheck(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			
			resultMap = LoanService.checkBook(map);
			
		return new Gson().toJson(resultMap);
	}	

	
}
