package com.kh.ti.travelBoard.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.ti.common.PageInfo;
import com.kh.ti.travel.model.vo.Tag;
import com.kh.ti.travelBoard.model.vo.Likey;
import com.kh.ti.travelBoard.model.vo.TravelBoard;
import com.kh.ti.travelBoard.model.vo.TrvDaySchedule;

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
		TravelBoard detailTb = new TravelBoard();
		detailTb = sqlSession.selectOne("TravelBoard.selectTravelDetailForm", tb);
		
		System.out.println("detailTb : " + detailTb);
		
		//해당 일정 구매여부 확인
		detailTb.setBuyStatus(sqlSession.selectOne("TravelBoard.checkBuyStatus", tb));
		
		//해당 일정 좋아요여부 확인
		detailTb.setLikeyStatus(sqlSession.selectOne("TravelBoard.checkLikeyStatus", tb));
		
		tbMap.put("detailTb", detailTb);
		
		return tbMap;
	}
	
	//여행일정 삭제 - 예랑
	@Override
	public int travelDelete(SqlSessionTemplate sqlSession, int trvId) {
		
		return sqlSession.update("TravelBoard.travelDelete", trvId);
	}
	
	//여행일정 좋아요 - 예랑
	@Override
	public int travelLikeyInsert(SqlSessionTemplate sqlSession, Likey likey) {
		
		return sqlSession.insert("TravelBoard.travelLikeyInsert", likey);
	}
	
	//여행일정 좋아요 취소 - 예랑
	@Override
	public int travelLikeyDelete(SqlSessionTemplate sqlSession, Likey likey) {
		
		return sqlSession.delete("TravelBoard.travelLikeyDelete", likey);
	}

	//여행일정 일자별 스케쥴 조회용
	@Override
	public TrvDaySchedule selectTravelDetailDays(SqlSessionTemplate sqlSession, TrvDaySchedule tds) {
		
		return sqlSession.selectOne("TravelBoard.selectDaySchOne", tds);
	}
	

}
