package com.kh.ti.travelBoard.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.ti.common.PageInfo;
import com.kh.ti.travelBoard.model.vo.TravelBoard;

public interface TravelBoardDao {

	int getListCount(SqlSessionTemplate sqlSession, TravelBoard tb);
	
	HashMap travelList(SqlSessionTemplate sqlSession, PageInfo pi, TravelBoard tb);

	HashMap travelDetailForm(SqlSessionTemplate sqlSession, TravelBoard tb);


}
