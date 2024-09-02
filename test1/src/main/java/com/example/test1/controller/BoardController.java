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
    BoardService boardService;
    
    // 게시글 리스트
    @RequestMapping("/board/list.do") 
    public String main(Model model) throws Exception {
        return "/board/board-list";
    }
    
    // 게시글 생성
    @RequestMapping("/board/insert.do") 
    public String main2(Model model) throws Exception {
        return "/board/board-insert";
    }
    
    // 게시글 상세보기
    @RequestMapping("/board/view.do") 
    public String main3(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        request.setAttribute("boardNo", map.get("boardNo"));
        return "/board/board-view";
    }
    
    //게시글 목록 페이지 (JSON)
    @RequestMapping(value = "/board/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String selectBoardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        List<Board> list = boardService.BoardList1(map);
        resultMap.put("list", list);
        resultMap.put("result", "success");
        return new Gson().toJson(resultMap);
    }
    
    // 게시글 삭제 (JSON)
    @RequestMapping(value = "/board/remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String board_remove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap = boardService.removeBoard(map);
        resultMap.put("result", "success");
        return new Gson().toJson(resultMap);
    }
    
    // 게시글 삽입 (JSON)
    @RequestMapping(value = "/board/add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String insertBoard(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap = boardService.addBoard(map);
        return new Gson().toJson(resultMap);
    }
    
    // 게시글 목록 페이지2 (JSON)
    @RequestMapping(value = "/board/search.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String searchBoardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        List<Board> list = boardService.boardSearch(map);
        resultMap.put("list", list);
        resultMap.put("result", "success");
        return new Gson().toJson(resultMap);
    }
    
    // 게시글 상세 (JSON)
    @RequestMapping(value = "/board/view.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String boardView(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap = boardService.viewSearch(map);
        return new Gson().toJson(resultMap);
    }
}