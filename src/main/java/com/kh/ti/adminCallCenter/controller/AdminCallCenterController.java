package com.kh.ti.adminCallCenter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//관리자 고객센터
@Controller
public class AdminCallCenterController {
	
	//관리자 공지사항 리스트 - 이선우
	@RequestMapping("adminNoticeList.ad")
	public String SelectNoticeList() {
		
		return "admin/callCenter/adminNoticeList";
	}
	
	//관리자 공지사항 상세보기 - 이선우
	@RequestMapping("adminNoticeDetail.ad")
	public String selectNoticeDetail() {
		
		return "admin/callCenter/adminNoticeDetail";
	}
	
	//관리자 공지사항 작성 - 이선우
	@RequestMapping("insertNotice.ad")
	public String insertNotice() {
		
		return "admin/callCenter/insertNotice";
	}
	
	//관리자 공지사항 수정 - 이선우
	@RequestMapping("updateNotice.ad")
	public String updateNotice() {
		
		return "admin/callCenter/updateNotice";
	}
	
	//관리자 자주묻는질문 리스트 - 이선우
	@RequestMapping("adminMoreQuestionList.ad")
	public String selectMoreQuestionList() {
		
		return "admin/callCenter/adminMoreQuestionList";
	}
	
	//관리자 자주묻는질문 상세보기 - 이선우
	@RequestMapping("adminMoreQuestionDetail.ad")
	public String selectMoreQuestionDetail() {
		
		return "admin/callCenter/adminMoreQuestionDetail";
	}
	
	//관리자 자주묻는질문 작성 - 이선우
	@RequestMapping("insertMoreQuestion.ad")
	public String insertMoreQuestion() {
		
		return "admin/callCenter/insertMoreQuestion";
	}
	
	//관리자 자주묻는질문 수정 - 이선우
	@RequestMapping("updateMoreQuestion.ad")
	public String updateMoreQuestion() {
		
		return "admin/callCenter/updateMoreQuestion";
	}
	
	//관리자 1:1문의 리스트  - 이선우
	@RequestMapping("oneToOneList.ad")
	public String selectOneToOneList() {
		
		return "admin/callCenter/oneToOneList";
	}
	
	//관리자 1:1문의 상세보기 - 이선우
	@RequestMapping("oneToOneDetail.ad")
	public String slectOneToOneDetail() {
		
		return "admin/callCenter/oneToOneDetail";
	}
	
	//관리자 게시판관리 조회 - 이선우
	@RequestMapping("noticeControlList.ad")
	public String selectNoticeControlList() {
		
		return "admin/noticeControl/noticeControlList";
	}
	
	//관리자 게시글관리 상세보기 - 이선우
	@RequestMapping("noticeControlDetail.ad")
	public String selectNoticeControlDetail() {
		
		return "admin/noticeControl/noticeControlDetail";
	}
	
	//관리자 신고관리 조회 - 이선우
	@RequestMapping("reportControlList.ad")
	public String selectReportControlList() {
		
		return "admin/reportControl/reportControlList";
	}
	
	//관리자 신고관리 상세보기 - 이선우
	@RequestMapping("reportControlDetail.ad")
	public String selectReportControlDetail() {
		
		return "admin/reportControl/reportControlDetail";
	}
}
