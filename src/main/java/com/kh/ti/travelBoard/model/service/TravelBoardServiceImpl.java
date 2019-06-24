package com.kh.ti.travelBoard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ti.common.PageInfo;
import com.kh.ti.travelBoard.model.dao.TravelBoardDao;
import com.kh.ti.travelBoard.model.vo.TravelBoard;

@Service
public class TravelBoardServiceImpl implements TravelBoardService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private TravelBoardDao tbd;
	
	//페이징 처리용
	@Override
	public int getListCount() {
		
		return tbd.getListCount(sqlSession);
	}
	
	//여행일정 리스트 조회 - 예랑
	@Override
	public ArrayList<TravelBoard> travelList(PageInfo pi) {
		//private ArrayList trvCities;
		//private ArrayList trvTags;
		return tbd.travelList(sqlSession, pi);
	}


}
