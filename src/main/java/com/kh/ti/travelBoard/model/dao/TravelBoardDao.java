package com.kh.ti.travelBoard.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.ti.travelBoard.model.vo.PageInfo;
import com.kh.ti.travelBoard.model.vo.TravelBoard;

public interface TravelBoardDao {

	int getListCount(SqlSessionTemplate sqlSession);
	
	ArrayList<TravelBoard> travelList(SqlSessionTemplate sqlSession, PageInfo pi);


}
