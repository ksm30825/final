package com.kh.ti.travelRequest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
//의뢰 및 설계

@Controller
public class TravelRequestController {
	//여행 의뢰 게시판 - 이선우
	@RequestMapping("travelRequest.tr")
	public String selectTravelRequest() {
		
		return "travelRequest/travelRequest";
	}
	
	//의뢰하기 - 이선우
	@RequestMapping("request.tr")
	public String insertRequest() {
		
		return "travelRequest/request";
	}
	
	//의뢰글 상세보기 - 이선우
	@RequestMapping("requestDetail.tr")
	public String selectRequestDetail() {
		
		return "travelRequest/requestDetail";
	}
	
	//설계해주기 - 이선우
	@RequestMapping("requestStart")
	public String insertRequestStart() {
		
		return "travelRequest/requestStart";
	}
	
	//설계글 상세보기(의뢰자가) - 이선우
	@RequestMapping("requestPlan.tr")
	public String selectRequestPlan() {
		
		return "travelRequest/requestPlan";
	}
}
