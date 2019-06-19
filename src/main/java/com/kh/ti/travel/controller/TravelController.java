package com.kh.ti.travel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TravelController {
	
	//여행일정 리스트 조회 - 예랑
	@RequestMapping("travelList.trv")
	public String travelList() {
		
		return "travel/travelList";
	}
	
	//여행일정 리스트 검색 - 예랑
	@RequestMapping("searchTravelList.trv")
	public String searchTravelList() {
		
		return "travel/travelList";
	}
	
	//여행일정 상세 조회 - 예랑
	@RequestMapping("travelDetailForm.trv")
	public String travelDetailForm(String num) {
		System.out.println(num);
		
		return "travel/travelDetail";
	}
	
	//여행일정 좋아요 - 예랑
	@RequestMapping("travelLikey.trv")
	public String travelLikey() {
		
		return "travel/travelDetail";
	}
	
	//여행일정 상세 / 일정표 / 날짜별 지도 보기 - 예랑
	@RequestMapping("dayMapSelect.trv")
	public String dayMapSelect() {
		
		return "travel/travelDetail";
	}
	
	//여행일정 상세 / 가계부 / 전체 보기 - 예랑
	@RequestMapping("allCost.trv")
	public String allCost() {
		
		return "travel/travelDetail";
	}
	
	//여행일정 상세 / 가계부 / 일별 보기 - 예랑
	@RequestMapping("dayCost.trv")
	public String dayCost() {
		
		return "travel/travelDetail";
	}
	
	//여행일정 상세 / 가계부 / 가계부 다운로드 - 예랑
	@RequestMapping("costDownload.trv")
	public String costDownload() {
		
		return "travel/travelDetail";
	}
	
	//여행일정 상세 / 리뷰 작성 - 예랑
	@RequestMapping("insertReview.trv")
	public String insertReview() {
			
		return "travel/travelDetail";
	}
	
	//여행일정 상세 / 리뷰 삭제 - 예랑
	@RequestMapping("deliteReview.trv")
	public String deliteReview() {
		
		return "travel/travelDetail";
	}
	
	//여행일정 상세 / 날짜별 갤러리 보기 - 예랑
	@RequestMapping("selectGallery.trv")
	public String selectGallery() {
		
		return "travel/travelDetail";
	}

}
