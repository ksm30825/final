package com.kh.ti.travel.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ti.member.model.vo.Member;
import com.kh.ti.travel.model.service.TravelService;
import com.kh.ti.travel.model.vo.Place;
import com.kh.ti.travel.model.vo.SchFile;
import com.kh.ti.travel.model.vo.Tag;
import com.kh.ti.travel.model.vo.Travel;
import com.kh.ti.travel.model.vo.TrvCost;
import com.kh.ti.travel.model.vo.TrvDay;
import com.kh.ti.travel.model.vo.TrvSchedule;

@Controller
public class TravelController {
	
	@Autowired
	private TravelService ts;

	//새일정작성-민지
	@RequestMapping("/insertTravel.trv")
	public String insertTravel(Travel trv) {
		int result = ts.insertTravel(trv);
		return "";
	}
	
	//동행추가-민지
	@RequestMapping("/insertCompany.trv")
	public String insertTrvCompany(Travel trv, Member m) {
		int result = ts.insertTrvCompany(trv, m);
		return "";
	}
	
	//여행테마추가-민지
	@RequestMapping("/insertTag.trv")
	public String insertTrvTag(Travel trv, Tag tag) {
		int result = ts.insertTrvTag(trv, tag);
		return "";
	}
	
	//상세일정추가-민지
	@RequestMapping("/insertSch.trv")
	public String insertTrvSchedule(TrvDay day, TrvSchedule sch, TrvCost cost, Place plc) {
		int result = ts.insertTrvSchedule(sch, cost, plc);
		return "";
	}
	
	//가계부 작성-민지
	@RequestMapping("/insertCost.trv")
	public String insertTrvCost(TrvDay day, TrvSchedule sch, TrvCost cost) {
		int result1 = ts.insertTrvCost(day, cost);
		int result2 = ts.insertTrvCost(sch, cost);
		return "";
	}
	
	//상세일정업데이트-민지
	@RequestMapping("/updateSch.trv")
	public String updateTrvSchedule(TrvSchedule sch, Place plc) {
		int result = ts.updateTrvSchedule(sch, plc);
		return "";
	}
	
	//여행사진추가-민지
	@RequestMapping("/insertFile.trv")
	public String insertSchFile(SchFile schFile) {
		int result = ts.insertSchFile(schFile);
		return "";
	}
	
	
	//전체일정조회-민지
	@RequestMapping("/selectSchList.trv")
	public String selectAllSchList(Travel trv) {
		HashMap schMap = ts.selectAllSchList(trv);
		return "";
	}
	
	//인기명소 불러오기-민지
	@RequestMapping("/selectSpotList.trv")
	public String selectSpotList(Travel trv) {
		HashMap spotMap = ts.selectSpotList(trv);
		return "";
	}
	
	//전체일정정보 수정-민지
	@RequestMapping("/updateTravel.trv")
	public String updateTravel(Travel trv) {
		int result = ts.updateTravel(trv);
		return "";
	}
	
	//작성완료처리-민지
	@RequestMapping("/completeTravel.trv")
	public String completeTravel(Travel trv) {
		int result = ts.completeTravel(trv);
		return "";
	}
	
	//여행일정 삭제-민지
	@RequestMapping("/deleteTravel.trv")
	public String deleteTravel(Travel trv) {
		int result = ts.deleteTravel(trv);
		return "";
	}
	
	//여행도시삭제-민지
	@RequestMapping("/deleteCity.trv")
	public String deleteTrvCity(Travel trv, int cityId) {
		int result = ts.deleteTrvCity(trv, cityId);
		return "";
	}
	
	//여행동행삭제-민지
	@RequestMapping("/deleteComp.trv")
	public String deleteTrvComp(Travel trv, int memberId) {
		int result = ts.deleteTrvComp(trv, memberId);
		return "";
	}
	
	//여행테마삭제-민지
	@RequestMapping("/deleteTag.trv")
	public String deleteTrvTag(Travel trv, int tagId) {
		int result = ts.deleteTrvTag(trv, tagId);
		return "";
	}
	
	//가계부수정-민지
	@RequestMapping("/updateCost.trv")
	public String updateTrvCost(TrvCost cost) {
		int result = ts.updateTrvCost(cost);
		return "";
	}
	
	//가계부삭제-민지
	@RequestMapping("/deleteCost.trv")
	public String deleteTrvCost(TrvCost cost) {
		int result = ts.deleteTrvCost(cost);
		return "";
	}
	
	//사진삭제-민지
	@RequestMapping("/deleteFile.trv")
	public String deleteSchFile(SchFile file) {
		int result = ts.deleteSchFile(file);
		return "";
	}
	
	//일정삭제-민지
	@RequestMapping("/deleteSch.trv") 
	public String deleteSchedule(TrvSchedule sch) {
		int result = ts.deleteTrvSchedule(sch);
		return "";
	}
	
  //여행일정 리스트 조회 - 예랑
	@RequestMapping("travelList.trv")
	public String travelList() {
		
		return "travel/travelList";
	}
	
	//여행일정 리스트 검색 - 예랑
	@RequestMapping("searchTravelList.trv")
	public String searchTravelList() {
		
		return "travel/travelList";
	}
	
	//여행일정 상세 조회 - 예랑
	@RequestMapping("travelDetailForm.trv")
	public String travelDetailForm(String num) {
		System.out.println(num);
		
		return "travel/travelDetail";
	}
	
	//여행일정 좋아요 - 예랑
	@RequestMapping("travelLikey.trv")
	public String travelLikey() {
		
		return "travel/travelDetail";
	}
	
	//여행일정 상세 / 일정표 / 날짜별 지도 보기 - 예랑
	@RequestMapping("dayMapSelect.trv")
	public String dayMapSelect() {
		
		return "travel/travelDetail";
	}
	
	//여행일정 상세 / 가계부 / 전체 보기 - 예랑
	@RequestMapping("allCost.trv")
	public String allCost() {
		
		return "travel/travelDetail";
	}
	
	//여행일정 상세 / 가계부 / 일별 보기 - 예랑
	@RequestMapping("dayCost.trv")
	public String dayCost() {
		
		return "travel/travelDetail";
	}
	
	//여행일정 상세 / 가계부 / 가계부 다운로드 - 예랑
	@RequestMapping("costDownload.trv")
	public String costDownload() {
		
		return "travel/travelDetail";
	}
	
	//여행일정 상세 / 리뷰 작성 - 예랑
	@RequestMapping("insertReview.trv")
	public String insertReview() {
			
		return "travel/travelDetail";
	}
	
	//여행일정 상세 / 리뷰 삭제 - 예랑
	@RequestMapping("deliteReview.trv")
	public String deliteReview() {
		
		return "travel/travelDetail";
	}
	
	//여행일정 상세 / 날짜별 갤러리 보기 - 예랑
	@RequestMapping("selectGallery.trv")
	public String selectGallery() {
		
		return "travel/travelDetail";
	}

























}
