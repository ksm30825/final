package com.kh.ti.travel.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ti.member.model.vo.Member;
import com.kh.ti.travel.model.service.TravelService;
import com.kh.ti.travel.model.vo.City;
import com.kh.ti.travel.model.vo.Country;
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
	
	@RequestMapping("showMyTravel.trv")
	public String showMyTravel() {
		return "travel/myTravel";
	}
	
	@RequestMapping("selectCountryList.trv")
	public ModelAndView selectCountryList(ModelAndView mv) {
		ArrayList<Country> countryList = ts.selectCountryList();
		mv.addObject("countryList", countryList);
		mv.setViewName("jsonView");
		return mv;
	}
	@RequestMapping("selectCityList.trv")
	public ModelAndView selectCityList(ModelAndView mv, int countryId) {
		ArrayList<City> cityList = ts.selectCityList(countryId);
		mv.addObject("cityList", cityList);
		mv.setViewName("jsonView");
		return mv;
	}
	
	//새일정작성-민지
	@RequestMapping("insertTravel.trv")
	public String insertTravel(Travel trv, String startDate, String endDate, String trvCity, Model model) {
		
		trv.setStartDate(Date.valueOf(startDate));
		trv.setEndDate(Date.valueOf(endDate));
		String[] strArr = trvCity.split(",");
		int[] cityArr = new int[strArr.length];
		for(int i = 0; i < strArr.length; i++) {
			cityArr[i] = Integer.parseInt(strArr[i]);
		}
		trv.setTrvCities(cityArr);
		
		int trvId = ts.insertTravel(trv);
		if(trvId > 0) {
			return "redirect:/selectTravel.trv?trvId=" + trvId;
		}else {
			model.addAttribute("msg", "새 일정 만들기 실패");
			return "common/errorPage";
		}
	}
	
	//일정조회-민지
	@RequestMapping("selectTravel.trv")
	public String showTrvEditor(int trvId, Model model) {
		HashMap trvMap = ts.selectTravel(trvId);

		if(!trvMap.isEmpty()) {
			model.addAttribute("trv", trvMap.get("trv"));
			model.addAttribute("trvCityList", trvMap.get("trvCityList"));
			model.addAttribute("trvDayList", trvMap.get("trvDayList"));
			model.addAttribute("allTagList", trvMap.get("allTagList"));
			return "travel/travelEditor";
		}else {
			model.addAttribute("msg", "일정 정보 불러오기 실패");
			return "common/errorPage";
		}
	}
	
	//전체일정정보 수정-민지
	@RequestMapping("updateTravel.trv")
	public String updateTravel(Travel trv, String trvCity, Model model) {
		String[] strArr = trvCity.split(",");
		int[] cityArr = new int[strArr.length];
		for(int i = 0; i < strArr.length; i++) {
			cityArr[i] = Integer.parseInt(strArr[i]);
		}
		trv.setTrvCities(cityArr);
		
		int result = ts.updateTravel(trv);
		if(result > 0) {
			return "redirect:/selectTravel.trv?trvId=" + trv.getTrvId();
		}else {
			model.addAttribute("msg", "여행 정보 수정 실패!");
			return "common/errorPage";
		}
	}
	
	//작성완료처리-민지
	@RequestMapping("completeTravel.trv")
	public String completeTravel(int trvId, Model model) {
		System.out.println(trvId);
		int result = ts.completeTravel(trvId);
		
		if(result > 0) {
			model.addAttribute("memberId", 5);
			model.addAttribute("reserveType", 10);
			model.addAttribute("code", trvId);
			model.addAttribute("rPoint",300);
			return "redirect:/pointReserve.po";
		}else {
			model.addAttribute("msg", "일정 작성완료처리 실패!");
			return "common/errorPage";
		}
	}
	
	//상세일정추가-민지
	@RequestMapping("insertSch.trv")
	public String insertTrvSchedule(TrvSchedule sch, TrvCost cost, Place plc, int trvId, Model model) {
		/*
		 * SCH : TrvSchedule [schId=0, schTitle=브런치, startTime=10:00, endTime=13:00,
		 * schContent=null, schTransp=지하철, plcId=0, dayId=1, likeyId=0] COST : TrvCost
		 * [costId=0, costContent=null, costAmount=50, schId=0, dayId=1, costType=식비]
		 * PLC : Place [plcId=0, cityId=0, plcName=, plcAddress=null, plcTypeId=0,
		 * plcEngName=null, plcLat=null, plcLng=null, plcCount=0] isTimeset : null
		 */
		/*
		 * SCH : TrvSchedule [schId=0, schTitle=브런치2~~, startTime=, endTime=,
		 * schContent=null, schTransp=지하철, plcId=0, dayId=1, likeyId=0] COST : TrvCost
		 * [costId=0, costContent=null, costAmount=500, schId=0, dayId=1, costType=교통]
		 * PLC : Place [plcId=0, cityId=0, plcName=, plcAddress=null, plcTypeId=0,
		 * plcEngName=null, plcLat=null, plcLng=null, plcCount=0] isTimeset : on
		 */
		System.out.println("SCH : " + sch);
		System.out.println("COST : " + cost);
		
		int count = ts.selectSchCount(sch.getDayId());
		if(sch.getIsTimeset() != null) {
			sch.setIsTimeset("N");
			sch.setSchNumber(count + 1);
		}else {
			sch.setIsTimeset("Y");
			if(count > 0) {
				int number = ts.selectSchNumber(sch.getDayId(), sch.getStartTime());
				sch.setSchNumber(number);
				System.out.println("number : " + number);
			}else {
				sch.setSchNumber(count + 1);
			}
		}
		
		
		int result = ts.insertTrvSchedule(sch, cost, plc);
		if(result > 0) {
			return "redirect:/selectTravel.trv?trvId=" + trvId;
		}else {
			model.addAttribute("msg", "상세일정 등록 실패!");
			return "common/errorPage";
		}
		
	}
	
	//동행추가-민지
	@RequestMapping("insertCompany.trv")
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
	

	
	//가계부 작성-민지
	@RequestMapping("insertCost.trv")
	public String insertTrvCost(TrvDay day, TrvSchedule sch, TrvCost cost) {
		int result1 = ts.insertTrvCost(day, cost);
		int result2 = ts.insertTrvCost(sch, cost);
		return "";
	}
	
	//상세일정업데이트-민지
	@RequestMapping("updateSch.trv")
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
	@RequestMapping("selectSchList.trv")
	public String selectAllSchList(Travel trv) {
		HashMap schMap = ts.selectAllSchList(trv);
		return "";
	}
	
	//인기명소 불러오기-민지
	@RequestMapping("selectSpotList.trv")
	public String selectSpotList(Travel trv) {
		HashMap spotMap = ts.selectSpotList(trv);
		return "";
	}
	


	
	//여행일정 삭제-민지
	@RequestMapping("deleteTravel.trv")
	public String deleteTravel(Travel trv) {
		int result = ts.deleteTravel(trv);
		return "";
	}
	
	//여행도시삭제-민지
	@RequestMapping("deleteCity.trv")
	public String deleteTrvCity(Travel trv, int cityId) {
		int result = ts.deleteTrvCity(trv, cityId);
		return "";
	}
	
	//여행동행삭제-민지
	@RequestMapping("deleteComp.trv")
	public String deleteTrvComp(Travel trv, int memberId) {
		int result = ts.deleteTrvComp(trv, memberId);
		return "";
	}
	
	//여행테마삭제-민지
	@RequestMapping("deleteTag.trv")
	public String deleteTrvTag(Travel trv, int tagId) {
		int result = ts.deleteTrvTag(trv, tagId);
		return "";
	}
	
	//가계부수정-민지
	@RequestMapping("updateCost.trv")
	public String updateTrvCost(TrvCost cost) {
		int result = ts.updateTrvCost(cost);
		return "";
	}
	
	//가계부삭제-민지
	@RequestMapping("deleteCost.trv")
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
	
	

























}
