package com.kh.ti.adminCallCenter.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.ti.adminCallCenter.model.service.AdminCallCenterService;
import com.kh.ti.adminCallCenter.model.vo.Board;
import com.kh.ti.common.CommonUtils;
import com.kh.ti.penalty.model.vo.PenaltyAttachment;

//관리자 고객센터
@Controller
public class AdminCallCenterController {
	
	@Autowired
	private AdminCallCenterService ccs;
	
	//관리자 공지사항 리스트 - 이선우
	@RequestMapping("adminNoticeList.ad")
	public String SelectNoticeList() {	
//		int currentPage = 1;
//		
//		if(request.getParameter("currentPage") != null) {
//			currentPage = Integer.parseInt(request.getParameter("currentPage"));
//		}
//		//전체 목록 조회
//		int listCount = cs.getNoticeCount(memberId);
//		System.out.println("나의 의뢰글 수 : " + listCount);
//		
//		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
//		System.out.println("pageInfo : " + pi);
//		ArrayList<TravelRequest> list = cs.selectNoticeList(pi, memberId);
//		
//		System.out.println("나의 의뢰 목록 : " + list);
//		model.addAttribute("list", list);
//		model.addAttribute("pi", pi);
		return "admin/callCenter/adminNoticeList";
	}
	
	//관리자 공지사항 상세보기 - 이선우
	@RequestMapping("adminNoticeDetail.ad")
	public String selectNoticeDetail() {
		
		return "admin/callCenter/adminNoticeDetail";
	}
	
	//관리자 공지사항 작성폼 - 이선우
	@RequestMapping("insertNoticeForm.ad")
	public String insertNoticeForm() {
		
		return "admin/callCenter/insertNotice";
	}
	
	//관리자 공지사항 작성 - 이선우
	@RequestMapping("insertNotice.ad")
	public String insrtNotice(@ModelAttribute Board b,
							  @RequestParam("attachmentFile") ArrayList<MultipartFile> attachmentFile,
							  HttpServletRequest request,
						      Model model) {
		System.out.println(b);
		System.out.println(attachmentFile);
		System.out.println("초기 파일 갯수 : " + attachmentFile.size());
		
		//attachmentFile에 대한 처리
		String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = root + "\\uploadFiles";
		
		System.out.println(root);
		System.out.println(filePath);
		
		ArrayList<PenaltyAttachment> attachmentFileList = new ArrayList<PenaltyAttachment>();
		
//		int i = 0;
//		for(MultipartFile attachment : attachmentFile) {
//			String originFileName = attachment.getOriginalFilename();	//원본이름
//			String ext = originFileName.substring(originFileName.lastIndexOf(".")); //확장자명
//			String changeName = CommonUtils.getRandomString();	//바뀐이름
//			System.out.println("원본이름 : " + originFileName);
//			if(originFileName.isEmpty()) {
//				attachmentFileList.remove(i);
//				continue;
//			}
//			System.out.println("확장자명 : " + ext);
//			System.out.println("바뀐이름 : " + changeName);
//			
//			PenaltyAttachment pe = new PenaltyAttachment();
//			pe.setOriginName(originFileName);
//			pe.setChangeName(changeName + ext);
//			pe.setFilePath(filePath);
//			pe.setFileType("신고");
//			attachmentFileList.add(pe);
//			
//			System.out.println(attachmentFileList.get(i));
//			i++;
//		}
//		
//		System.out.println("빈 이미지 삭제후 갯수 : " + attachmentFile.size());
		
		return "admin/callCenter/adminNoticeList";
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
