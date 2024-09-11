package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;



import com.example.test1.mapper.BoardMapper;
import com.example.test1.model.Board;
import com.example.test1.model.School;
import com.example.test1.model.User;

import constants.ResMessage;


@Service
public class BoardServiceImpl implements BoardService {
	@Autowired  
	BoardMapper boardMapper;

	@Override
	public HashMap<String, Object> removeBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			boardMapper.deleteBoard(map);
			resultMap.put("message", "삭제되었습니다.");
		} catch (Exception e) {
			resultMap.put("message", "예기치 못한 문제가 발생했습니다.");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> addBoard(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			boardMapper.insertBoard(map);
			System.out.println(map);
			resultMap.put("idx",map.get("boardNo"));
			resultMap.put("result", "success.");
			resultMap.put("message", "등록되었습니다.");
			
		} catch (Exception e) {
			resultMap.put("result", "fail");
			resultMap.put("message", "예기치 못한 문제가 발생했습니다.");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> boardSearch(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		System.out.println(map);
		List<Board> list = boardMapper.searchBoardList(map);
		int cnt = boardMapper.selectPaging(map);
	
		resultMap.put("list", list);
		resultMap.put("cnt", cnt);
		
		return resultMap;
		
	}

	@Override
	public HashMap<String, Object> viewSearch(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			Board Board = boardMapper.viewBoard(map);
			List<Board> list = boardMapper.innerBoard(map);
			Board image = boardMapper.selectImg(map);
			
			resultMap.put("info", Board);
			resultMap.put("vList", list);
			resultMap.put("image", image);
	
			resultMap.put("result", "success");
			resultMap.put("message", "검색되었습니다.");
		} catch (Exception e) {
			resultMap.put("result", "fail");
			resultMap.put("message", "예기치 못한 문제가 발생했습니다.");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> chartBoard1(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		
		try {
			List<Board> list = boardMapper.chartBoard(map);
			resultMap.put("chartList", list);
			resultMap.put("result", "success");
		
		} catch (Exception e) {
			resultMap.put("result", "fail");
			resultMap.put("message", "예기치 못한 문제가 발생했습니다.");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> payMents(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			boardMapper.insertPayment(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> Area(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		
		try {
			if(!map.get("si").equals("")) {
				
			}else {
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		List<Board> Arealist = boardMapper.selectArea(map);
		List<Board> Gulist = boardMapper.selectAreaGu(map);
		List<Board> Donglist = boardMapper.selectAreaDong(map);
		Board NxNy = boardMapper.selectNxNy(map);
		resultMap.put("list", Arealist);
		resultMap.put("gulist", Gulist);
		resultMap.put("donglist", Donglist);
		resultMap.put("NxNy", NxNy);
		return resultMap;
	}

	@Override
	public HashMap<String, Object> addBoardFile(HashMap<String, Object> map) {
		boardMapper.insertBoardFile(map);
		return null;
	}

	@Override
	public HashMap<String, Object> removeCheckBoard(HashMap<String, Object> map) {
		boardMapper.deleteCheckBoard(map);
		return null;
	}

	@Override
	public HashMap<String, Object> selectItem(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		List<Board> List = boardMapper.selectItem(map);
		try {
			resultMap.put("List", List);
			resultMap.put("massage", ResMessage.SUCCESS);
			resultMap.put("result", "success");
		} catch (DataAccessException e) {
			resultMap.put("massage", ResMessage.DB_ACCESS_ERROR);
			resultMap.put("result", "fail");
		} catch (PersistenceException e) {
			resultMap.put("massage", ResMessage.MYBATIS_ERROR);
			resultMap.put("result", "fail");
		} catch (Exception e) {
			resultMap.put("massage", ResMessage.UNKNOWN_ERROR);
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> ItemCheck(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		List<Board> List = boardMapper.ItemCheck(map);
		resultMap.put("list", List);
		return resultMap;
	}





	


}