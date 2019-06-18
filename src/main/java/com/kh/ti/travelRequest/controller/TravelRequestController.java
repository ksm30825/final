package com.kh.ti.travelRequest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TravelRequestController {
	//여행 의뢰 게시판
	@RequestMapping("travelRequest.tr")
	public String travelRequest() {
		
		return "travelRequest/travelRequest";
	}
	
	//의뢰하기
	@RequestMapping("request.tr")
	public String request() {
		
		return "travelRequest/request";
	}
	
	//의뢰글 상세보기
	@RequestMapping("requestDetail.tr")
	public String requestDetail() {
		
		return "travelRequest/requestDetail";
	}
	
	//설계해주기
	@RequestMapping("requestStart")
	public String requestStart() {
		
		return "travelRequest/requestStart";
	}
	
	//설계글 상세보기(의뢰자가)
	@RequestMapping("requestPlan.tr")
	public String requestPlan() {
		
		return "travelRequest/requestPlan";
	}
}
