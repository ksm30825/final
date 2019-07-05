package com.kh.ti.travelBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ti.common.PageInfo;
import com.kh.ti.travelBoard.model.dao.TravelBoardDao;
import com.kh.ti.travelBoard.model.vo.Likey;
import com.kh.ti.travelBoard.model.vo.TourReview;
import com.kh.ti.travelBoard.model.vo.TravelBoard;
import com.kh.ti.travelBoard.model.vo.TrvDaySchedule;

@Service
public class TravelBoardServiceImpl implements TravelBoardService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private TravelBoardDao tbd;
	
	//페이징 처리용 - 예랑
	@Override
	public int getListCount(HashMap pageMap) {
		
		return tbd.getListCount(sqlSession, pageMap);
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
	
	//여행일정 삭제 - 예랑
	@Override
	public int travelDelete(int trvId) {
		
		return tbd.travelDelete(sqlSession, trvId);
	}
	
	//여행일정 좋아요 - 예랑
	@Override
	public int travelLikeyInsert(Likey likey) {
		
		return tbd.travelLikeyInsert(sqlSession, likey);
	}
	
	//여행일정 좋아요 취소 - 예랑
	@Override
	public int travelLikeyDelete(Likey likey) {
		
		return tbd.travelLikeyDelete(sqlSession, likey);
	}
	
	//여행일정 일자별 스케쥴 조회용
	@Override
	public ArrayList selectTravelDetailDays(TravelBoard tb) {
		
		return tbd.selectTravelDetailDays(sqlSession, tb);
	}
	
	//여행일정 구매리뷰 조회용
	@Override
	public ArrayList<TourReview> tourReviewList(PageInfo pi, TourReview tr) {
		
		return tbd.tourReviewList(sqlSession, pi, tr);
	}
	
	//여행일정 상세 / 리뷰 작성 - 예랑
	@Override
	public int insertReview(TourReview tr) {
		
		return tbd.insertReview(sqlSession, tr);
	}

	//자신이 작성한 여행일정 리뷰 검색
	@Override
	public TourReview myTourReviewSearch(TourReview tr) {
		
		return tbd.myTourReviewSearch(sqlSession, tr);
	}
	
	//자신이 작성한 여행일정 리뷰 수정
	@Override
	public int myTourReviewUpdate(TourReview tr) {
		
		return tbd.myTourReviewUpdate(sqlSession, tr);
	}
	
	//여행일정 상세 / 리뷰 삭제 - 예랑
	@Override
	public int deliteReview(TourReview tr) {
		
		return tbd.deliteReview(sqlSession, tr);
	}
	
	//여행일정 상세 / 가계부 조회 - 예랑
	@Override
	public ArrayList selectTravelCost(int trvId) {
		
		return tbd.selectTravelCost(sqlSession, trvId);
	}


}
