package com.kh.ti.myRequest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
//마이페이지 여행 의뢰 및 설계

@Controller
public class MyRequestController {
	
	//여행 의뢰 - 이선우
	@RequestMapping("requestList.mp")
	public String selectRequestList() {
		
		return "travelRequest/myRequestList";
	}
	
	//여행 설계 - 이선우
	@RequestMapping("myRequestPlan.mp")
	public String selectMyPlan() {
		
		return "travelRequest/myRequestPlan";
	}
}
