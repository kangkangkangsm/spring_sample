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

import com.example.test1.dao.BookService;
import com.example.test1.model.Board;
import com.example.test1.model.Book;
import com.google.gson.Gson;

@Controller
public class BookController {
			
	@Autowired
	BookService BookService;
	
	@RequestMapping("/book.do") 
    public String main(Model model) throws Exception{

        return "/book/book-list";
    }
	
	
	@RequestMapping("/list.do") 
    public String main2(Model model) throws Exception{

        return "/book/book-insert";
    }
	
	@RequestMapping("/bookView.do") 
    public String main3(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("bookId", map.get("bookId"));
        return "/book/book-view";
    }
	
	
	
	
	
	//게시글 목록 페이지
	@RequestMapping(value = "/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectbooklist(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Book> list = BookService.bookList(map);
		resultMap.put("list", list);
	resultMap.put("result", "success");
	return new Gson().toJson(resultMap);
}
	//게시글 삭제 
	
	@RequestMapping(value = "/remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String deleteBook(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = BookService.removeBook(map);
	
	return new Gson().toJson(resultMap);
	}
	
	//게시글 저장 
	
		@RequestMapping(value = "/insert.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String insertBook(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			resultMap = BookService.addBook(map);
		
		return new Gson().toJson(resultMap);
		}
		//게시글 저장 
		
		@RequestMapping(value = "/update.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String updateBook(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			resultMap = BookService.updateBook(map);
			
		return new Gson().toJson(resultMap);
		}		
		@RequestMapping(value = "/bookView.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String bookView(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			resultMap = BookService.viewBook(map);
		return new Gson().toJson(resultMap);
	}

	
}
