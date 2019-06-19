package com.kh.ti.penalty.controller;

import org.springframework.stereotype.Controller;
//신고 및 문의
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PenaltyController {
	//신고하기 - 이선우
	@RequestMapping("insertPanelty.pe")
	public String insertPanelty() {
		
		return "";
	}
	
	// 신고 내역 - 이선우
	@RequestMapping("paneltyList.pe")
	public String selectPaneltyList() {

		return "panelty/paneltyList";
	}

	// 신고 내역상세보기 - 이선우
	@RequestMapping("paneltyDetail.pe")
	public String selectPaneltyDetail() {

		return "panelty/paneltyDetail";
	}

	// 나의 문의 내역 - 이선우
	@RequestMapping("myInquiryList.pe")
	public String selectMyInquiryList() {

		return "inquiry/myInquiryList";
	}

	// 문의하기 - 이선우
	@RequestMapping("goInquiry.pe")
	public String insertGoInquiry() {

		return "inquiry/goInquiry";
	}

	// 나의 문의 상세보기 - 이선우
	@RequestMapping("myInquiryDetail.pe")
	public String selectMyInquiryDetail() {

		return "inquiry/myInquiryDetail";
	}
}
