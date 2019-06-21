package com.kh.ti.travelBoard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TravelBoardController {
	//여행일정 리스트 조회 - 예랑
	@RequestMapping("travelList.tb")
	public String travelList() {
		
		return "travelBoard/travelList";
	}
	
	//여행일정 리스트 검색 - 예랑
	@RequestMapping("searchTravelList.tb")
	public String searchTravelList() {
		
		return "travelBoard/travelList";
	}
	
	//여행일정 상세 조회 - 예랑
	@RequestMapping("travelDetailForm.tb")
	public String travelDetailForm(String num) {
		System.out.println(num);
		
		return "travelBoard/travelDetail";
	}
	
	//여행일정 좋아요 - 예랑
	@RequestMapping("travelLikey.tb")
	public String travelLikey() {
		
		return "travelBoard/travelDetail";
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
	public String insertReview() {
			
		return "travelBoard/travelDetail";
	}
	
	//여행일정 상세 / 리뷰 삭제 - 예랑
	@RequestMapping("deliteReview.tb")
	public String deliteReview() {
		
		return "travelBoard/travelDetail";
	}
	
	//여행일정 상세 / 날짜별 갤러리 보기 - 예랑
	@RequestMapping("selectGallery.tb")
	public String selectGallery() {
		
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
