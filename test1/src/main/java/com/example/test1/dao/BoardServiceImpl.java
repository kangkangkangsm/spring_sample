package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.example.test1.mapper.BoardMapper;
import com.example.test1.model.Board;


@Service
public class BoardServiceImpl implements BoardService {
	@Autowired  
	BoardMapper BoardMapper;
	@Override
	public List<Board> BoardList1(HashMap<String, Object> map) {
		return BoardMapper.selectBoardList(map);
	}

	@Override
	public HashMap<String, Object> removeBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			BoardMapper.deleteBoard(map);
			resultMap.put("message", "삭제되었습니다.");
		} catch (Exception e) {
			resultMap.put("message", "예기치 못한 문제가 발생했습니다.");
		}
		return resultMap;
	}


}
