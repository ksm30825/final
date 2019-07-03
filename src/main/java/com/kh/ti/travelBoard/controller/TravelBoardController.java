package com.kh.ti.travelBoard.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.JsonParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ti.common.PageInfo;
import com.kh.ti.common.Pagination;
import com.kh.ti.member.model.vo.Member;
import com.kh.ti.point.model.vo.ReservePoint;
import com.kh.ti.travelBoard.model.service.TravelBoardService;
import com.kh.ti.travelBoard.model.vo.Likey;
import com.kh.ti.travelBoard.model.vo.TourReview;
import com.kh.ti.travelBoard.model.vo.TravelBoard;
import com.kh.ti.travelBoard.model.vo.TrvDaySchedule;

import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class TravelBoardController {
	
	@Autowired
	private TravelBoardService tbs;
	
	//여행일정 리스트 조회 - 예랑
	@RequestMapping("travelList.tb")
	public String travelList(Model model) {
		
		int currentPage = 1;
		
		TravelBoard tb = new TravelBoard();
		
		//전체 목록 조회(페이징용)
		HashMap pageMap = new HashMap();
		pageMap.put("tb", tb);
		
		int listCount = tbs.getListCount(pageMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		//일정 리스트 조회
		HashMap tbMap = tbs.travelList(pi, tb);
		
		model.addAttribute("tbList", tbMap.get("tbList"));
		model.addAttribute("tagList", tbMap.get("tagList"));
		model.addAttribute("cityList", tbMap.get("cityList"));
		
		return "travelBoard/travelList";
	}
	
	//여행일정 리스트 검색 - 예랑
	@RequestMapping("searchTravelList.tb")
	public String searchTravelList(String orderBy, String searchCondition, String searchContent, Model model) {
		
		int currentPage = 1;
		
		TravelBoard tb = new TravelBoard();
		
		//검색어 선택
		if(searchContent != null) {
			switch (searchCondition) {
			case "trvTitle": tb.setTrvTitle(searchContent); break;
			case "userName": tb.setUserName(searchContent); break;
			}
		}
		
		//order by 선택
		switch (orderBy) {
			case "completeDate" : tb.setCompleteDate(new Date(1)); break;
			case "likeyCount" : tb.setLikeyCount(-1); break;
			case "buyCount" : tb.setBuyCount(-1); break;
		}
		
		//전체 목록 조회(페이징용)
		HashMap pageMap = new HashMap();
		pageMap.put("tb", tb);
		
		int listCount = tbs.getListCount(pageMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		//일정 리스트 조회
		HashMap tbMap = tbs.travelList(pi, tb);
		
		model.addAttribute("tbList", tbMap.get("tbList"));
		model.addAttribute("tagList", tbMap.get("tagList"));
		model.addAttribute("cityList", tbMap.get("cityList"));
		
		return "travelBoard/travelList";
	}
	
	//여행일정 상세 조회 - 예랑
	@RequestMapping("travelDetailForm.tb")
	public String travelDetailForm(int trvId, Model model, HttpServletRequest request) {
		
		//여행일정 전체 정보 조회용
		TravelBoard tb = new TravelBoard();
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		
		if(loginUser != null) {
			tb.setMemberId(loginUser.getMemberId());
		}
		tb.setTrvId(trvId);
		
		HashMap tbMap = tbs.travelDetailForm(tb);
		
		//상세 스케쥴 1일차 조회
		TrvDaySchedule tds = new TrvDaySchedule(); tds.setTrvId(trvId);
		tds.setDayNumber(1); 
		TrvDaySchedule detailDay = tbs.selectTravelDetailDays(tds);
		
		model.addAttribute("detailTb", tbMap.get("detailTb"));
		model.addAttribute("detailDay", detailDay);
		
		return "travelBoard/travelDetail";
	}
	
	//여행일정 일자별 스케쥴 조회용
	@RequestMapping("travelDetailDays.tb")
	public ResponseEntity<TrvDaySchedule> selectTravelDetailDays(int trvId, int dayNumber) {
		
		System.out.println("trvId : " + trvId);
		System.out.println("dayNumber : " + dayNumber);
		
		TrvDaySchedule tds = new TrvDaySchedule();
		tds.setTrvId(trvId);
		tds.setDayNumber(dayNumber);
		
		TrvDaySchedule detailDay = tbs.selectTravelDetailDays(tds);
		
		System.out.println("detailDay : " + detailDay.getTrvSchedule());
		
		return new ResponseEntity<TrvDaySchedule>(detailDay, HttpStatus.OK);
	}
	
	//여행일정 구매리뷰 조회용
	@RequestMapping("selectTourReview.tb")
	public ResponseEntity selectTourReview(int trvId, int currentPage, HttpServletRequest request) {
		
		if(currentPage == 0) {
			currentPage = 1;
		}
		
		TourReview tr = new TourReview();
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		
		if(loginUser != null) {
			tr.setMemberId(loginUser.getMemberId());
		}
		tr.setTrvId(trvId);
		
		//전체 목록 조회(페이징용)
		HashMap pageMap = new HashMap();
		pageMap.put("tr", tr);
		
		int listCount = tbs.getListCount(pageMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		//일정 리스트 조회
		ArrayList<TourReview> trList = tbs.tourReviewList(pi, tr);
		
		return new ResponseEntity(trList, HttpStatus.OK);
	}
	
	//자신이 작성한 여행일정 리뷰 검색
	@RequestMapping("myTourReviewSearch.tb")
	public ResponseEntity myTourReviewSearch(int trvId, int memberId) {
		
		TourReview tr = new TourReview();
		tr.setTrvId(trvId);
		tr.setMemberId(memberId);
		
		TourReview myReview = tbs.myTourReviewSearch(tr);
		
		return new ResponseEntity(myReview, HttpStatus.OK);
	}
	
	//여행일정 삭제 - 예랑
	@RequestMapping("travelDelete.tb")
	public String travelDelete(Model model, int trvId) {
		
		int result = tbs.travelDelete(trvId);
		
		if(result > 0) {
			return "redirect:/travelList.tb";
		}else {
			model.addAttribute("msg", "일정 삭제 실패");
			return "common/errorPage";
		}
	}
	
	//여행일정 좋아요 - 예랑
	@RequestMapping("travelLikeyInsert.tb")
	public ModelAndView travelLikeyInsert(ModelAndView mv, int trvId, int memberId) {
		
		Likey likey = new Likey();
		likey.setTrvId(trvId);
		likey.setMemberId(memberId);
		
		tbs.travelLikeyInsert(likey);
		
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	//여행일정 좋아요 취소 - 예랑
	@RequestMapping("travelLikeyDelete.tb")
	public ModelAndView travelLikeyDelete(ModelAndView mv, int trvId, int memberId) {
		
		System.out.println("trvId : " + trvId);
		System.out.println("memberId : " + memberId);
		
		Likey likey = new Likey();
		likey.setTrvId(trvId);
		likey.setMemberId(memberId);
		
		tbs.travelLikeyDelete(likey);
		
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	//여행일정 상세 / 일정표 / 날짜별 지도 보기 - 예랑
	@RequestMapping("dayMapSelect.tb")
	public String dayMapSelect() {
		
		return "travelBoard/travelDetail";
	}
	
	//여행일정 상세 / 가계부 / 전체 보기 - 예랑
	@RequestMapping("allCost.tb")
	public String allCost() {
		
		return "travelBoard/travelDetail";
	}
	
	//여행일정 상세 / 가계부 / 일별 보기 - 예랑
	@RequestMapping("dayCost.tb")
	public String dayCost() {
		
		return "travelBoard/travelDetail";
	}
	
	//여행일정 상세 / 가계부 / 가계부 다운로드 - 예랑
	@RequestMapping("costDownload.tb")
	public String costDownload() {
		
		return "travelBoard/travelDetail";
	}
	
	//여행일정 상세 / 리뷰 작성 - 예랑
	@RequestMapping("insertReview.tb")
	public ResponseEntity insertReview(int trvId, int memberId, int grade, String reviewContent) {
		
		TourReview tr = new TourReview();
		tr.setTrvId(trvId);
		tr.setMemberId(memberId);
		tr.setGrade(grade);
		tr.setReviewContent(reviewContent);
		
		int reviewId = tbs.insertReview(tr);
		
		ReservePoint rp = null;
		
		if(reviewId > 0) {
			rp = new ReservePoint();
			rp.setMemberId(memberId);
			rp.setReviewId(reviewId);
			rp.setReserveType(20);
			rp.setReservePoint(50);
		}
		
		return new ResponseEntity(rp, HttpStatus.OK);
	}
	
	//여행일정 상세 / 리뷰 삭제 - 예랑
	@RequestMapping("deliteReview.tb")
	public String deliteReview() {
		
		return "travelBoard/travelDetail";
	}
	
	//여행일정 상세 / 날짜별 갤러리 보기 - 예랑
	@RequestMapping("travelDetailGallery.tb")
	public String travelDetailGallery() {
		
		return "travelBoard/travelDetailGallery";
	}
	
	//여행일정 상세 / 일정 구매 - 예랑
	@RequestMapping("insertTravelBuy.tb")
	public String travelBuy() {
		
		//구매한 해당 글 수익금 업데이트(수민언니랑 연동)
		
		return "travelBoard/travelDetail";
	}
	
	
	//마이페이지 / 구매한 일정 보기 - 예랑
	@RequestMapping("myBuyTravelListView.tb")
	public String myBuyTravelListView() {
		
		return "travelBoard/myBuyTravelList";
	}
	
	//마이페이지 / 구매한 일정으로 내 일정 만들기 - 예랑
	@RequestMapping("travelMake.tb")
	public String travelMake() {
		
		return "travel/travelEditor";
	}
	
	//마이페이지 / 좋아요 / 여행일정 좋아요 보기 - 예랑
	@RequestMapping("myLikeyTravelListView.tb")
	public String myLikeyTravelListView() {
		
		return "travelBoard/myLikeyTravelList";
	}
	
	//마이페이지 / 좋아요 여행일정 좋아요 취소 - 예랑
	@RequestMapping("myLikeyTravelCancel.tb")
	public String myLikeyTravelCancel() {
		
		return "travelBoard/myLikeyTravelList";
	}
}
