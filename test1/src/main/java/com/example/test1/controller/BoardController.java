package com.example.test1.controller;

import java.io.File;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.test1.dao.BoardService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
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
  
    @RequestMapping("/board/chart1.do") 
    public String main4(Model model) throws Exception{

        return "/chart/chart";
    }
    
    //Area
    @RequestMapping("/board/area.do") 
    public String Area(Model model) throws Exception{

        return "/board/area";
    }
    
    @RequestMapping("/addr.do") 
    public String addr(Model model, @RequestParam HashMap<String, Object> map, HttpServletRequest request) throws Exception{
  
    	return "jusoPopup";
    }
    
    @RequestMapping("/board/item.do") 
    public String item(Model model) throws Exception{

        return "/board/item-list";
    }
    
    @RequestMapping("/board/api1.do") 
    public String api1(Model model) throws Exception{

        return "/board/api1";
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
    
    // 게시글 삭제 (JSON)
    @RequestMapping(value = "/check-remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String re(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        
     // java
        String json = map.get("selectItem").toString(); 
        ObjectMapper mapper = new ObjectMapper();
        List<Object> list = mapper.readValue(json, new TypeReference<List<Object>>(){});
        map.put("list", list);
        resultMap = boardService.removeCheckBoard(map);
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
        resultMap = boardService.boardSearch(map);
        
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
    // 게시글 목록 페이지2 (JSON)
    @RequestMapping(value = "/board/chart.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String chartBoardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap = boardService.chartBoard1(map);
        return new Gson().toJson(resultMap);
    }
    
    // 결제
    @RequestMapping(value = "/board/payment.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String payMents(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap = boardService.payMents(map);
        return new Gson().toJson(resultMap);
    }
    
    
    @RequestMapping(value = "/board/Area.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String AreaList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap = boardService.Area(map);
        return new Gson().toJson(resultMap);
    }
    
 
    @RequestMapping(value = "/board/itemList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String itemList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap = boardService.selectItem(map);
        return new Gson().toJson(resultMap);
    }
  
    @RequestMapping(value = "/board/itemCheckList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String itemCheckList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
       String json = map.get("selectItem").toString(); 
            ObjectMapper mapper = new ObjectMapper();
            List<Object> list = mapper.readValue(json, new TypeReference<List<Object>>(){});
            map.put("list", list);
            HashMap<String, Object> resultMap = new HashMap<String, Object>();
            resultMap = boardService.ItemCheck(map);
          
            return new Gson().toJson(resultMap);
 }
    @RequestMapping("/fileUpload.dox")
    public String result(@RequestParam("file1") MultipartFile multi, @RequestParam("idx") int idx, HttpServletRequest request,HttpServletResponse response, Model model)
    {
        String url = null;
        String path=System.getProperty("user.dir");
        try {
 
            //String uploadpath = request.getServletContext().getRealPath(path);
            String uploadpath = path;
            String originFilename = multi.getOriginalFilename();
            String extName = originFilename.substring(originFilename.lastIndexOf("."),originFilename.length());
            long size = multi.getSize();
            String saveFileName = genSaveFileName(extName);
            
            System.out.println("uploadpath : " + uploadpath);
            System.out.println("originFilename : " + originFilename);
            System.out.println("extensionName : " + extName);
            System.out.println("size : " + size);
            System.out.println("saveFileName : " + saveFileName);
//            String path2 = System.getProperty("user.dir");
            System.out.println("Working Directory = " + path + "\\src\\webapp\\img");
            if(!multi.isEmpty()){
                File file = new File(path + "\\src\\main\\webapp\\img", saveFileName);
                multi.transferTo(file);
                
                HashMap<String, Object> map = new HashMap<String, Object>();
                map.put("fileName", saveFileName);
                map.put("filePath", "../../img/" + saveFileName);
                map.put("idx", idx);
                map.put("fileOrgName", originFilename);
                map.put("fileSize", size);
                map.put("fileExt", extName);
                // insert 쿼리 실행         
                boardService.addBoardFile(map);
                
                model.addAttribute("filename", multi.getOriginalFilename());
                model.addAttribute("uploadPath", file.getAbsolutePath());
                
                return "redirect:/board/list.do";
            }
        }catch(Exception e) {
            System.out.println(e);
        }
        return "redirect:/board/list.do";
    }
    
    // 현재 시간을 기준으로 파일 이름 생성
    private String genSaveFileName(String extName) {
        String fileName = "";
        
        Calendar calendar = Calendar.getInstance();
        fileName += calendar.get(Calendar.YEAR);
        fileName += calendar.get(Calendar.MONTH);
        fileName += calendar.get(Calendar.DATE);
        fileName += calendar.get(Calendar.HOUR);
        fileName += calendar.get(Calendar.MINUTE);
        fileName += calendar.get(Calendar.SECOND);
        fileName += calendar.get(Calendar.MILLISECOND);
        fileName += extName;
        
        return fileName;
    }
}