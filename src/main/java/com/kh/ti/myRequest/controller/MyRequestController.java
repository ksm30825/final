package com.kh.ti.myRequest.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.ti.myRequest.model.service.MyRequestService;
import com.kh.ti.travelBoard.model.vo.TrvDaySchedule;
import com.kh.ti.travelRequest.model.vo.Participation;
import com.kh.ti.travelRequest.model.vo.PlanDay;
import com.kh.ti.travelRequest.model.vo.PlanPlace;
import com.kh.ti.travelRequest.model.vo.TravelRequestPlan;

@Controller
@SessionAttributes("loginUser")
public class MyRequestController {

	@Autowired
	private MyRequestService mrs;
	// 여행 의뢰 - 이선우
	@RequestMapping("myRequestList.mr")
	public String selectRequestList() {

		return "travelRequest/myRequestList";
	}

	// 여행 설계 - 이선우
	@RequestMapping("myRequestPlan.mr")
	public String insertMyPlan(@ModelAttribute PlanDay pd, 
							   @ModelAttribute PlanPlace pp,
							   @ModelAttribute TravelRequestPlan tp,
							   @ModelAttribute Participation p, Model modle) {
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
			PlanDay day = new PlanDay(pDay[i], pDayMemo[i], openStatus[i]);
			dayList.add(day);
			System.out.println(dayList);
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
		
		System.out.println(p);
		System.out.println(tp);
		int result = mrs.insertRequestPlan(dayList, placeList, tp, p);
		System.out.println(result);

		return "travelRequest/myRequestPlan";
	}
	
	//설계 목록 불러오기 - 이선우
	@RequestMapping("loadRequestPlan.mr")
	public ResponseEntity<ArrayList> selectLoadRequestPlan(
			@RequestParam("memberId")int memberId) {
	
		System.out.println("회원번호 : " + memberId);
		TravelRequestPlan trp = new TravelRequestPlan();
		trp.setMemberId(memberId);
		
		//작성된 설계글 조회
		ArrayList<TravelRequestPlan> planList = mrs.selectRequestPlanList(trp);
		System.out.println(planList);
		return new ResponseEntity<ArrayList>(planList, HttpStatus.OK);
	}
	
	//선택된 설계글 불러오기 - 이선우
	@RequestMapping("loadRequetPlan.mr")
	public String selectLoadRequestPlan(@RequestParam("reqId")int reqId,
									    @RequestParam("planId")int planId, Model model) {
		System.out.println("의뢰번호 : " + reqId);
		System.out.println("설계번호 : " + planId);
		
		ArrayList<TravelRequestPlan> trp = mrs.selectLoadRequestPlan(planId);
		System.out.println("조회 결과 : " + trp);
		
		model.addAttribute("trp", trp);
		model.addAttribute("reqId", reqId);
		model.addAttribute("planId", planId);
		return "travelRequest/travelRequestLoad";
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
