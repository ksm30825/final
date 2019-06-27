package com.kh.ti.travelBoard.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.ti.common.PageInfo;
import com.kh.ti.travel.model.vo.Tag;
import com.kh.ti.travelBoard.model.vo.TravelBoard;

@Service
public class TravelBoardDaoImpl implements TravelBoardDao {

	//페이징 처리용
	@Override
	public int getListCount(SqlSessionTemplate sqlSession, TravelBoard tb) {
		
		return sqlSession.selectOne("TravelBoard.getListCount", tb);
	}
	
	//여행일정 리스트 조회 - 예랑
	@Override
	public HashMap travelList(SqlSessionTemplate sqlSession, PageInfo pi, TravelBoard tb) {
		
		//여행일정 리스트, 여행테마 태그 리스트, 도시태그 리스트를 담을 HashMap
		HashMap tbMap = new HashMap();
		
		//페이징 관련
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		//여행일정 리스트
		ArrayList<TravelBoard> tbList = (ArrayList) sqlSession.selectList("TravelBoard.selectTravelBoardList", tb, rowBounds);
		tbMap.put("tbList", tbList);
		//여행테마 태그 리스트
		ArrayList tagList = (ArrayList) sqlSession.selectList("TravelBoard.selectTagList");
		tbMap.put("tagList", tagList);
		//도시태그 리스트
		ArrayList cityList = (ArrayList) sqlSession.selectList("TravelBoard.selectCityList");
		tbMap.put("cityList", cityList);
		
		
		return tbMap;
	}

	//여행일정 상세 조회 - 예랑
	@Override
	public HashMap travelDetailForm(SqlSessionTemplate sqlSession, TravelBoard tb) {
		//여행일정 상세 정보를 담을 HashMap
		HashMap tbMap = new HashMap();
		
		//일정 상세정보 조회
		tb = sqlSession.selectOne("TravelBoard.selectTravelDetailForm", tb);
		System.out.println(tb);
		tbMap.put("tb", tb);
		
		//해당 일정 구매여부 확인
		tb.setBuyStatus(sqlSession.selectOne("TravelBoard.checkBuyStatus", tb));
		System.out.println(tb.getBuyStatus());
		
		return tbMap;
	}
	

}
