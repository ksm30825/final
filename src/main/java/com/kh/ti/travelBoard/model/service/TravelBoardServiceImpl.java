package com.kh.ti.travelBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

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
	
	//페이징 처리용 - 예랑
	@Override
	public int getListCount(TravelBoard tb) {
		
		return tbd.getListCount(sqlSession, tb);
	}
	
	//여행일정 리스트 조회 - 예랑
	@Override
	public HashMap travelList(PageInfo pi, TravelBoard tb) {
		
		return tbd.travelList(sqlSession, pi, tb);
	}
	
	//여행일정 상세 조회 - 예랑
	@Override
	public HashMap travelDetailForm(TravelBoard tb) {
		
		return tbd.travelDetailForm(sqlSession, tb);
	}


}
