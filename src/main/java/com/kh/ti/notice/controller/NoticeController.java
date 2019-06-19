package com.kh.ti.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {
	//공지사항 리스트 - 이선우
	@RequestMapping("noticeList.cc")
	public String SelectNoticeList() {
		
		return "callCenter/noticeList";
	}
	
	//공지사항 상세보기 - 이선우
	@RequestMapping("noticeDetail.cc")
	public String selectNoticeDetail() {
		
		return "callCenter/noticeDetail";
	}
	
	//자주묻는질문 리스트 - 이선우
	@RequestMapping("moreQuestionList.cc")
	public String selectMoreQuestionList() {
		
		return "callCenter/moreQuestionList";
	}
	
	//자주묻는질문 상세보기 - 이선우
	@RequestMapping("moreQuestionDetail.cc")
	public String selectMoreQuestionDetail() {
		
		return "callCenter/moreQuestionDetail";
	}
}
