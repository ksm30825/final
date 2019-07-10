package com.kh.ti.penalty.controller;

import java.util.ArrayList;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
//신고 및 문의
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.ti.penalty.model.vo.Penalty;

@Controller
public class PenaltyController {
	
	//신고할 대상 조회 - 이선우
	@RequestMapping("selectPanelty.pe")
	public ResponseEntity selectPanelty(
		@RequestParam("code")int code) {
		
		System.out.println("구분 : " + code);
		return new ResponseEntity(code, HttpStatus.OK);
	}
	//신고하기 - 이선우
	@RequestMapping("insertPanelty.pe")
	public String insertPanelty(@ModelAttribute Penalty p,
			@RequestParam("attachmentFile") ArrayList<MultipartFile> attachmentFile) {
			System.out.println(p);
			System.out.println(attachmentFile);
			System.out.println(attachmentFile.size());
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
}
