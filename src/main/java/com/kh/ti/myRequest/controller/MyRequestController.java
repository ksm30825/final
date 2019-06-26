package com.kh.ti.myRequest.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ti.travelRequest.model.vo.PlanDay;
//마이페이지 여행 의뢰 및 설계
import com.kh.ti.travelRequest.model.vo.TravelRequestPlan;

@Controller
public class MyRequestController {

	// 여행 의뢰 - 이선우
	@RequestMapping("myRequestList.mr")
	public String selectRequestList() {

		return "travelRequest/myRequestList";
	}

	// 여행 설계 - 이선우
	@RequestMapping("myRequestPlan.mr")
	public String selectMyPlan(HttpServletRequest request, HttpServletResponse response) {

		 //설계여행일자(PlanDay) 
//		 String[] Pday = request.getParameterValues("Pday"); //일자
//		 String[] pdayMemo = request.getParameterValues("pdayMemo"); //메모
//		  
//		 //여행 설계(TravelRequestPlan) 
//		 String planTitle = request.getParameter("planTitle"); //설계제목
//		 String planContent = request.getParameter("planContent"); //설계 소개
//		 int roomCharge = Integer.parseInt("roomCharge"); //숙비 
//		 int trafficCharge = Integer.parseInt("traffiCharge"); //경비 
//		 int etcCharge = Integer.parseInt("etcCharge"); //기타비
//		  
//		 System.out.println("일자 : " + Pday); 
//		 System.out.println("메모 : " + pdayMemo);
//		 System.out.println("설계 제목 : " + planTitle);
//		 System.out.println("설계 소개 : " + planContent); 
//		 System.out.println("숙비 : " + roomCharge);
//		 System.out.println("경비 : " + trafficCharge); 
//		 System.out.println("기타비 : " + etcCharge);

		return "travelRequest/myRequestPlan";
	}

	// 나의 문의 내역 - 이선우
	@RequestMapping("myInquiryList.mr")
	public String selectMyInquiryList() {

		return "inquiry/myInquiryList";
	}

	// 문의하기 - 이선우
	@RequestMapping("goInquiry.mr")
	public String insertGoInquiry() {

		return "inquiry/goInquiry";
	}

	// 나의 문의 상세보기 - 이선우
	@RequestMapping("myInquiryDetail.mr")
	public String selectMyInquiryDetail() {

		return "inquiry/myInquiryDetail";
	}
}
