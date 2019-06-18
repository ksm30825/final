package com.kh.ti.myPage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
	//마이페이지
	@RequestMapping("myPage.mp")
	public String myPage() {
		
		return "myPage/mainMyPage";
	}
	
	//여행 의뢰
	@RequestMapping("requestList.mp")
	public String requestList() {
		
		return "myPage/requestList";
	}
	
	//여행 설계
	@RequestMapping("myRequestPlan.mp")
	public String myPlan() {
		
		return "myPage/myRequestPlan";
	}
	
	//신고 내역
	@RequestMapping("reportList.mp")
	public String reportList() {
		
		return "myPage/reportList";
	}
	
	//신고 내역상세보기
	@RequestMapping("reportDetail.mp")
	public String reportDetail() {
		
		return "myPage/reportDetail";
	}
	
	//나의 문의 내역
	@RequestMapping("myInquiryList.mp")
	public String myInquiryList() {
		
		return "myPage/myInquiryList";
	}
	
	//문의하기
	@RequestMapping("goInquiry.mp")
	public String goInquiry() {
		
		return "myPage/goInquiry";
	}
	
	//나의 문의 상세보기
	@RequestMapping("myInquiryDetail.mp")
	public String myInquiryDetail() {
		
		return "myPage/myInquiryDetail";
	}
}
