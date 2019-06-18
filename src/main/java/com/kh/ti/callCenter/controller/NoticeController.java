package com.kh.ti.callCenter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {
	//공지사항 리스트
	@RequestMapping("noticeList.cc")
	public String noticeList() {
		
		return "callCenter/noticeList";
	}
	
	//공지사항 상세보기
	@RequestMapping("noticeDetail.cc")
	public String noticeDetail() {
		
		return "callCenter/noticeDetail";
	}
	
	//자주묻는질문 리스트
	@RequestMapping("moreQuestionList.cc")
	public String moreQuestionList() {
		
		return "callCenter/moreQuestionList";
	}
	
	//자주묻는질문 상세보기
	@RequestMapping("moreQuestionDetail.cc")
	public String moreQuestionDetail() {
		
		return "callCenter/moreQuestionDetail";
	}
}
