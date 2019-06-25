package com.kh.ti.travelRequest.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
//의뢰 및 설계
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.ti.common.PageInfo;
import com.kh.ti.common.Pagination;
import com.kh.ti.travelRequest.model.service.TravelRequestService;
import com.kh.ti.travelRequest.model.vo.TravelRequest;

@Controller
@SessionAttributes("loginUser")
public class TravelRequestController {
	
	@Autowired
	private TravelRequestService trs;
	//여행 의뢰 게시판 - 이선우
	@RequestMapping("travelRequest.tr")
	public String selectTravelRequest(HttpServletRequest request, HttpServletResponse response) {
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		//전체 목록 조회
		int listCount = trs.getListCount();
		System.out.println("의뢰글 수 : " + listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		System.out.println("pageInfo : " + pi);
		
		ArrayList<TravelRequest> list = trs.selectRequestList(pi);
		System.out.println("의뢰글 목록 : " + list);
		
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
			return "redirect:travelRequest.tr";
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
