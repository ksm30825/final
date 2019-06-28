package com.kh.ti.myRequest.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.ti.myRequest.model.service.MyRequestService;
import com.kh.ti.travelRequest.model.vo.PlanDay;
import com.kh.ti.travelRequest.model.vo.PlanPlace;
import com.kh.ti.travelRequest.model.vo.TravelRequestPlan;

@Controller
@SessionAttributes("loginUser")
public class MyRequestController {

//	@Autowired
//	private MyRequestService mrs;
	// 여행 의뢰 - 이선우
	@RequestMapping("myRequestList.mr")
	public String selectRequestList() {

		return "travelRequest/myRequestList";
	}

	// 여행 설계 - 이선우
	@RequestMapping("myRequestPlan.mr")
	public String selectMyPlan(@ModelAttribute PlanDay pd, 
							   @ModelAttribute PlanPlace pp,
							   @ModelAttribute TravelRequestPlan tp, Model modle) {
		//각 일정및 메모, 공개여부
		//설계여행일자(PlanDay) 
		System.out.println(pd);
		String[] pDay = pd.getpDay().split(",");
		String[] pDayMemo = pd.getpDayMemo().split(",");
		String[] openStatus = pd.getOpenStatus().split(",");
		
		ArrayList<PlanDay> dayList = new ArrayList<PlanDay>();
		for(int i = 0; i < pDay.length; i++) {
			System.out.println("일자 : " + pDay[i]);
			System.out.println((i+1) + "일자 메모 : " + pDayMemo[i]);
			System.out.println((i+1) + "일자 공개여부 : " + openStatus[i]);
		}
		
		//각 일정의 장소
		//일자장소(PlanPlace)
		System.out.println(pp);
		String[] placeTitle = pp.getPplaceTitle().split("#");	//장소명
		String[] placeAddress = pp.getPplaceAddress().split("#");	//주소
		String[] placeLat = pp.getPplaceLat().split("#");	//위도
		String[] placeLng = pp.getPplaceLng().split("#");	//경도
		
		ArrayList<PlanPlace> placeList = new ArrayList<PlanPlace>();
		
		for(int i = 0; i < placeLat.length; i++) {
			System.out.println("장소 : " + placeTitle[i]);
			System.out.println("주소 : " + placeAddress[i]);
			System.out.println("위도 : " + placeLat[i]);
			System.out.println("경도 : " + placeLng[i]);
			System.out.println("========================");
			PlanPlace place = new PlanPlace(placeTitle[i], placeAddress[i], placeLat[i], placeLng[i]);
			placeList.add(place);
			System.out.println(placeList);
		}
		
		//int result = mrs.insertRequestPlan()
		//여행설계(TravelRequestPlan)
		System.out.println(tp);

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
