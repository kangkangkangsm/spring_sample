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


}
