package com.kh.ti.penalty.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
//신고 및 문의
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.ti.common.CommonUtils;
import com.kh.ti.penalty.model.service.PenaltyService;
import com.kh.ti.penalty.model.vo.Penalty;
import com.kh.ti.penalty.model.vo.PenaltyAttachment;

@Controller
public class PenaltyController {
	
	@Autowired
	private PenaltyService ps;
	
	//신고할 대상 조회 - 이선우
	@RequestMapping("selectPanelty.pe")
	public ResponseEntity selectPanelty(
		@RequestParam("code")int code) {
		
		System.out.println("구분 : " + code);
		return new ResponseEntity(code, HttpStatus.OK);
	}
	// 신고하기 - 이선우
		@RequestMapping("insertPanelty.pe")
		public String insertPanelty(@ModelAttribute Penalty p,
				@RequestParam("attachmentFile") ArrayList<MultipartFile> attachmentFile,
				HttpServletRequest request) {
			System.out.println(p);
			System.out.println(attachmentFile);
			System.out.println(attachmentFile.size());
			
			//attachmentFile에 대한 처리
			String root = request.getSession().getServletContext().getRealPath("resources");
			String filePath = root + "\\uploadFiles";
			
			System.out.println(root);
			System.out.println(filePath);
			
			ArrayList<PenaltyAttachment> attachmentFileList = new ArrayList<PenaltyAttachment>();
			
			int i = 0;
			for(MultipartFile attachment : attachmentFile) {
				String originFileName = attachment.getOriginalFilename();	//원본이름
				String ext = originFileName.substring(originFileName.lastIndexOf(".")); //확장자명
				String changeName = CommonUtils.getRandomString();	//바뀐이름
				System.out.println("원본이름 : " + originFileName);
				System.out.println("확장자명 : " + ext);
				System.out.println("바뀐이름 : " + changeName);
				
				PenaltyAttachment pe = new PenaltyAttachment();
				pe.setOriginName(originFileName);
				pe.setChangeName(changeName);
				pe.setFilePath(filePath);
				pe.setFileType("신고");
				attachmentFileList.add(pe);
				
				System.out.println(attachmentFileList.get(i));
				
				try {
					attachment.transferTo(new File(filePath + "\\" + changeName + ext));
					System.out.println("원본명 : " + originFileName);
					System.out.println("바뀐명 : " + changeName);
					
				} catch(Exception e) {
					//실패시 파일 삭제
					new File(filePath + "\\" + changeName + ext).delete();
				}
				i++;
			}	

			switch (p.getList()) {
			case "의뢰글":
				p.setRequestId(Integer.parseInt(p.getListType()));
				System.out.println("의뢰글 번호 : " + p.getRequestId());
				break;
			case "설계글":
				p.setPlanId(Integer.parseInt(p.getListType()));
				System.out.println("설계글 번호 : " + p.getPlanId());
				break;
			case "일정글" :
				p.setTrvId(Integer.parseInt(p.getListType()));
				System.out.println("여행 일정글 번호: " + p.getTrvId());
				break;
			case "리뷰" :
				p.setReviewId(Integer.parseInt(p.getListType()));
				System.out.println("리뷰 번호 : " + p.getReviewId());
				break;
			case "채팅":
				p.setMemberId(Integer.parseInt(p.getListType()));
				System.out.println("채팅자 멤버번호 : " + p.getMemberId());
				break;
			}
			
			System.out.println("신고내용 : " + p.getPenaltyContent());
			System.out.println("신고종류 코드 : " + p.getPenaltyId());
			System.out.println("신고자 : " + p.getComplainantId());
			System.out.println("구분 : " + p.getList());
			System.out.println(p);
			
			int result = ps.insertPenalty(p, attachmentFileList);
			return "redirect:paneltyList.pe";
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
}
