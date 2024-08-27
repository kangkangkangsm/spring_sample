package com.example.test1.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.test1.dao.BoardService;
import com.example.test1.model.Board;
import com.example.test1.model.User;
import com.google.gson.Gson;

@Controller
public class BoardController {
			
	@Autowired
	BoardService BoardService;
	
	// 게시글 리스트
	@RequestMapping("/board/list.do") 
    public String main(Model model) throws Exception{

        return "/board/board-list";
    }
	// 게시글 생성
	@RequestMapping("/board/insert.do") 
    public String main2(Model model) throws Exception{

        return "/board/board-insert";
    }
	// 게시글 상세보기
	@RequestMapping("/board/view.do") 
    public String main3(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("boardNo", map.get("boardNo"));
        return "/board/board-view";
    }
	// 유저정보 상세보기 
	@RequestMapping("/board/userView.do") 
    public String main4(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("userId", map.get("userId"));
        return "/board/user-view";
    }
	
	
	//게시글 목록 페이지
	@RequestMapping(value = "/board/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectBoardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Board> list = BoardService.BoardList1(map);
		resultMap.put("list", list);
	resultMap.put("result", "success");
	return new Gson().toJson(resultMap);
}
	//게시글 삭제 
	@RequestMapping(value = "/board/remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String board_remove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = BoardService.removeBoard(map);
	resultMap.put("result", "success");
	return new Gson().toJson(resultMap);
}
	
	//게시글 삽입 
		@RequestMapping(value = "/board/add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String insertBoard(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			resultMap = BoardService.addBoard(map);
		return new Gson().toJson(resultMap);
	}
		//게시글 목록 페이지2
		@RequestMapping(value = "/board/search.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String searchBoardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			List<Board> list = BoardService.boardSearch(map);
			resultMap.put("list", list);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
		
		@RequestMapping(value = "/board/view.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String boardView(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			resultMap = BoardService.viewSearch(map);
		return new Gson().toJson(resultMap);
	}
		@RequestMapping(value = "/board/userView.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String boardUserView(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			resultMap = BoardService.userSearch(map);
			System.out.println(resultMap);	
		return new Gson().toJson(resultMap);
	}
}
