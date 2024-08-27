package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



import com.example.test1.mapper.BoardMapper;
import com.example.test1.model.Board;
import com.example.test1.model.User;


@Service
public class BoardServiceImpl implements BoardService {
	@Autowired  
	BoardMapper boardMapper;
	@Override
	public List<Board> BoardList1(HashMap<String, Object> map) {
		return boardMapper.selectBoardList(map);
	}

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
			resultMap.put("result", "success.");
			resultMap.put("message", "등록되었습니다.");
		} catch (Exception e) {
			resultMap.put("result", "fail");
			resultMap.put("message", "예기치 못한 문제가 발생했습니다.");
		}
		return resultMap;
	}

	@Override
	public List<Board> boardSearch(HashMap<String, Object> map) {
		System.out.println(map);
		return boardMapper.searchBoardList(map);
		
	}

	@Override
	public HashMap<String, Object> viewSearch(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			Board Board = boardMapper.viewBoard(map);
			resultMap.put("info", Board);
			resultMap.put("result", "success");
			resultMap.put("message", "검색되었습니다.");
		} catch (Exception e) {
			resultMap.put("result", "fail");
			resultMap.put("message", "예기치 못한 문제가 발생했습니다.");
		}
		return resultMap;
	}

	


}
