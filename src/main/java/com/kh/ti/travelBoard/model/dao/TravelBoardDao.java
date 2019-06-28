package com.kh.ti.travelBoard.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.ti.common.PageInfo;
import com.kh.ti.travelBoard.model.vo.Likey;
import com.kh.ti.travelBoard.model.vo.TravelBoard;
import com.kh.ti.travelBoard.model.vo.TrvDaySchedule;

public interface TravelBoardDao {

	int getListCount(SqlSessionTemplate sqlSession, TravelBoard tb);
	
	HashMap travelList(SqlSessionTemplate sqlSession, PageInfo pi, TravelBoard tb);

	HashMap travelDetailForm(SqlSessionTemplate sqlSession, TravelBoard tb, TrvDaySchedule tds);

	int travelDelete(SqlSessionTemplate sqlSession, int trvId);

	int travelLikeyInsert(SqlSessionTemplate sqlSession, Likey likey);

	int travelLikeyDelete(SqlSessionTemplate sqlSession, Likey likey);


}
