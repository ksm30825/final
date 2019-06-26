package com.kh.ti.myRequest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.ti.travelRequest.model.vo.PlanDay;

@Controller
public class MyRequestController {

	// 여행 의뢰 - 이선우
	@RequestMapping("myRequestList.mr")
	public String selectRequestList() {

		return "travelRequest/myRequestList";
	}

	// 여행 설계 - 이선우
	@RequestMapping("myRequestPlan.mr")
	public String selectMyPlan(@ModelAttribute PlanDay pd, Model modle) {
		System.out.println(pd);
		for(int i = 0; i < pd.getList().size(); i++) {
			System.out.println(pd.getList().get(i));
		}
		 //설계여행일자(PlanDay) 
//		 String[] pDay = request.getParameterValues("Pday"); //일자
//		 String[] pDayMemo = request.getParameterValues("pdayMemo"); //메모
//		  
//		 //여행 설계(TravelRequestPlan) 
//		 String planTitle = request.getParameter("planTitle"); //설계제목
//		 String planContent = request.getParameter("planContent"); //설계 소개
//		 int roomCharge = Integer.parseInt(request.getParameter("roomCharge")); //숙비 
//		 int trafficCharge = Integer.parseInt(request.getParameter("trafficCharge")); //경비 
//		 int etcCharge = Integer.parseInt(request.getParameter("etcCharge")); //기타비
//		  
//		 for(int i = 0; i < pDay.length; i++) {
//			 System.out.println("일자 : " + pDay[i]);
//		 }
//		 for(int i = 0; i < pDayMemo.length; i++) {
//			 System.out.println((i+1) + "일자 메모 : " + pDayMemo[i]);
//		 }
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
