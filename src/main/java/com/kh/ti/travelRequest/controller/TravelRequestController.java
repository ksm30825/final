package com.kh.ti.travelRequest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
//의뢰 및 설계
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.ti.travelRequest.model.service.TravelRequestService;
import com.kh.ti.travelRequest.model.vo.TravelRequest;

@Controller
@SessionAttributes("loginUser")
public class TravelRequestController {
	
	@Autowired
	private TravelRequestService trs;
	//여행 의뢰 게시판 - 이선우
	@RequestMapping("travelRequest.tr")
	public String selectTravelRequest() {
		
		return "travelRequest/travelRequest";
	}
	
	//의뢰하기폼 - 이선우
	@RequestMapping("showRequestForm.tr")
	public String showRequest() {
		
		return "travelRequest/request";
	}
	
	//의뢰하기 - 이선우
	@RequestMapping("insertRequest.tr")
	public String insertRequest(@ModelAttribute TravelRequest tr, Model model) {
		System.out.println(tr);
		
		int result = trs.insertRequest(tr);
		
		if(result > 0) {
			return "travelRequest/travelRequest";
		} else {
			return "errorPage";
		}

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
