package com.kh.ti.travelBoard.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.ti.common.PageInfo;
import com.kh.ti.travel.model.vo.Tag;
import com.kh.ti.travelBoard.model.vo.Likey;
import com.kh.ti.travelBoard.model.vo.TourReview;
import com.kh.ti.travelBoard.model.vo.TravelBoard;
import com.kh.ti.travelBoard.model.vo.TrvDaySchedule;

@Service
public class TravelBoardDaoImpl implements TravelBoardDao {

	//페이징 처리용
	@Override
	public int getListCount(SqlSessionTemplate sqlSession, HashMap pageMap) {
		
		int listCount = 0;
		
		if(pageMap.get("tb") != null) {
			TravelBoard tb = (TravelBoard) pageMap.get("tb");
			listCount = sqlSession.selectOne("TravelBoard.getListCount", tb);
		}
		
		if(pageMap.get("tr") != null) {
			TourReview tr = (TourReview) pageMap.get("tr");
			listCount = sqlSession.selectOne("TravelBoard.getListCountReview", tr);
		}
		
		return listCount;
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
		
		System.out.println("tbList : " + tbList);
		
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
		
		//해당 일정 구매여부 확인
		detailTb.setBuyStatus(sqlSession.selectOne("TravelBoard.checkBuyStatus", tb));
		
		//해당 일정 좋아요여부 확인
		detailTb.setLikeyStatus(sqlSession.selectOne("TravelBoard.checkLikeyStatus", tb));
		//해당 일정 리뷰작성여부 확인
		detailTb.setWriteStatus(sqlSession.selectOne("TravelBoard.CheckWriteStatus", tb));
		
		System.out.println("detailTb : " + detailTb);
		
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
	
	//여행일정 구매리뷰 조회용
	@Override
	public ArrayList<TourReview> tourReviewList(SqlSessionTemplate sqlSession, PageInfo pi, TourReview tr) {
		
		//구매리뷰 조회
		ArrayList<TourReview> trList =  (ArrayList) sqlSession.selectList("TravelBoard.tourReviewList", tr);
		//구매리뷰 작성여부 조회
		for(int i = 0; i < trList.size(); i++) {
			trList.get(i).setWriteStatus(sqlSession.selectOne("TravelBoard.CheckWriteStatus", tr));
		}
		
		System.out.println("trList : " + trList);
		
		return trList;
	}
	
	//여행일정 상세 / 리뷰 작성 - 예랑
	@Override
	public int insertReview(SqlSessionTemplate sqlSession, TourReview tr) {
		
		int reviewId = 0;
		
		//리뷰 추가
		int result = sqlSession.insert("TravelBoard.insertReview", tr);
		
		//추가 성공하면 작성한 리뷰의 reviewId 조회
		if(result > 0) {
			reviewId = sqlSession.selectOne("TravelBoard.searchReviewId", tr);
		}
		
		return reviewId;
	}
	
	//자신이 작성한 여행일정 리뷰 검색
	@Override
	public TourReview myTourReviewSearch(SqlSessionTemplate sqlSession, TourReview tr) {
		
		return sqlSession.selectOne("TravelBoard.myTourReviewSearch", tr);
	}
	
	//자신이 작성한 여행일정 리뷰 수정
	@Override
	public int myTourReviewUpdate(SqlSessionTemplate sqlSession, TourReview tr) {
		
		return sqlSession.update("TravelBoard.myTourReviewUpdate", tr);
	}
	
	//여행일정 상세 / 리뷰 삭제 - 예랑
	@Override
	public int deliteReview(SqlSessionTemplate sqlSession, TourReview tr) {
		
		return sqlSession.update("TravelBoard.deliteReview", tr);
	}
	

}
