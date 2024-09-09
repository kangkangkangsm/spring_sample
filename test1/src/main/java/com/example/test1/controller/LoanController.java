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
   @RequestMapping("/StudyList2.do") 
    public String p4(Model model) throws Exception{

        return "/projectT/studyGroupList2";
    }
   @RequestMapping("/StudyList3.do") 
    public String p11(Model model) throws Exception{

        return "/projectT/studyGroupList3";
    }
   @RequestMapping("/StudyCreate.do") 
    public String p2(Model model) throws Exception{

        return "/projectT/studyGroupCreate";
    }
   @RequestMapping("/StudyView.do") 
    public String p3(Model model) throws Exception{

        return "/projectT/studyGroupView";
    }
   @RequestMapping("/StudyMain.do") 
    public String p112(Model model) throws Exception{

        return "/projectT/StudyMain";
    }
   @RequestMapping("/studyMypage.do") 
    public String p113(Model model) throws Exception{

        return "/projectT/studyMypage";
    }
   @RequestMapping("/studyCommunity.do") 
    public String studyCommunity(Model model) throws Exception{

        return "/projectT/studyCommunity";
    }
   @RequestMapping("/studyAdminPage.do") 
    public String studyAdminPage(Model model) throws Exception{

        return "/projectT/studyAdminPage";
    }
   
   @RequestMapping("/studyApplication.do") 
    public String studyApplication(Model model) throws Exception{

        return "/projectT/studyApplication";
    }
   
   @RequestMapping("/studyCommunityAdd.do") 
    public String studyCommunityAdd(Model model) throws Exception{

        return "/projectT/studyCommunityAdd";
    }
   
   @RequestMapping("/bookStoreMain.do") 
    public String bookStoreMain(Model model) throws Exception{

        return "/projectT/bookStoreMain";
    }
   @RequestMapping("/bookStoreAllBook.do") 
    public String bookStoreAllBook(Model model) throws Exception{

        return "/projectT/bookStoreAllBook";
    }
   @RequestMapping("/bookStorePhotoReview.do") 
    public String bookStorePhotoReview(Model model) throws Exception{

        return "/projectT/bookStorePhotoReview";
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
