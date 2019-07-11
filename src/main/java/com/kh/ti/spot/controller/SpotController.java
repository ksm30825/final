package com.kh.ti.spot.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.ti.member.model.vo.Member;
import com.kh.ti.spot.model.service.SpotService;
import com.kh.ti.spot.model.vo.Likey;
import com.kh.ti.spot.model.vo.SpotFile;
import com.kh.ti.spot.model.vo.SpotList;
import com.kh.ti.travel.model.vo.Country;

@Controller
public class SpotController {
	
	@Autowired
	private SpotService ss;
	
	//메인화면으로 가는 용 메소드 -- 세령
	@RequestMapping("showIndex.me")
	public String showIndexPage() {
		return "redirect:index.jsp";
	}
	
	//관리자 입력폼으로 여행지추가용 메소드 --세령
	@RequestMapping("showInserOneSpot.sp")
	public String showAdminAddOneSpot() {
		return "admin/spot/adminAddOneSpot";
	}
	
	//엑셀로여행지추가용메소드
	@RequestMapping("insertSpotExcel.sp")
	public String insertSpotFromExcel() {
		return null;
	}
	
	//입력폼으로여행지추가용메소드
	@RequestMapping("insertOneSpot.sp")
	public String insertSpotFromForm() {
		return null;
	}
	
	//관리자여행지전체조회용메소드 --세령
	@RequestMapping("selectAllSpotAdmin.sp")
	public String selectAllSpotListForAdmin() {
		return "admin/spot/adminSpotList";
	}
	
	//관리자여행지조건조회용메소드
	@RequestMapping("selectConditionSpotAdmin.sp")
	public String selectConditionSpotListForAdmin() {
		return null;
	}
	
	//관리자여행지상세보기용메소드 --세령
	@RequestMapping("selectSpotInfoAdmin.sp")
	public String selectSpotDetailInfoForAdmin() {
		return "admin/spot/adminSpotDetail";
	}
	
	//여행지수정용메소드
	@RequestMapping("updateSpotInfo.sp")
	public String updateSpotInfo() {
		return null;
	}
	
	//여행지정보단일삭제용메소드
	@RequestMapping("deleteOneSpot.sp")
	public String updateOneSpotStatusN() {
		return null;
	}
	
	//여행지정보복수삭제용메소드
	@RequestMapping("deleteManySpot.sp")
	public String updateManySpotStatusN() {
		return null;
	}
	
	//여행지정보단일복구용메소드
	@RequestMapping("restoreOneSpot.sp")
	public String updateOneSpotStatusY() {
		return null;
	}
	
	//여행지정보복수복구용메소드
	@RequestMapping("restoreManySpot.sp")
	public String updateManySpotStatusY() {
		return null;
	}
	
	//사용자여행지전체조회용메소드 --세령
	@RequestMapping("selectAllSpotUser.sp")
	public String selectAllSpotFromUser(Model model) {
		/*
		 * ArrayList<SpotCityList> cityNameList = ss.selectCityNames();
		 * ArrayList<SpotCityList> cityList = ss.selectCityList();
		 * model.addAttribute("cityNameList", cityNameList);
		 * model.addAttribute("cityList", cityList);
		 */
		ArrayList<Country> countryList = ss.selectCountryList();
		ArrayList<HashMap> cityMap = ss.selectCityMap();
		model.addAttribute("countryList", countryList);
		model.addAttribute("cityMap", cityMap);
 		return "spot/spotHome";
	}
	
	//사용자여행지조건조회용메소드
	@RequestMapping("selectConditionSpotUser.sp")
	public String selectConditionSpotFromUser() {
		return null;
	}
	
	//사용자여행지상세보기용메소드 --세령
	@RequestMapping("selectSpotInfoUser.sp")
	public String selectSpotInfoFromUser(@RequestParam("cityId") int cityId, Model model) {
		ArrayList<HashMap> spotList = ss.selectSpotList(cityId);
		Country countryInfo = ss.selectCountryOneInfo(cityId);
		ArrayList<SpotFile> cityFile = ss.selectCityFile(cityId);
		
		model.addAttribute("spotList", spotList);
		model.addAttribute("countryInfo", countryInfo);
		model.addAttribute("cityFile", cityFile);
		return "spot/spotInfoPage";
	}
	
	//명소상세보기용메소드
	@RequestMapping("selectSpotDetailInfo.sp")
	public String selectSpotDetailInfo() {
		return "spot/spotDetailPage";
	}
	
	//사용자명소리뷰등록용메소드
	@RequestMapping("insertSpotReview.sp")
	public String insertSpotReview() {
		return null;
	}
	
	//관리자명소리뷰전체조회용메소드
	@RequestMapping("selectAllSpotReviewAdmin.sp")
	public String selectAllSpotReviewForAdmin() {
		return "admin/spot/adminSpotReviewList";
	}
	
	//여행지지도마커표시용메소드
	@RequestMapping("selectAllSpotPointMap.sp")
	public String selectAllSpotAddressForMap() {
		return null;
	}
	
	//명소지도마커표시용메소드
	@RequestMapping("selectOneSpotPointMap.sp")
	public String selectOneSpotAddressForMap() {
		return null;
	}
	
	//명소좋아요추가용메소드
	@RequestMapping("insertLikeySpot.sp")
	public void insertLikeySpot(@RequestParam("spotId") int spotId, HttpServletResponse response, HttpServletRequest request) {
		Likey likey = new Likey();
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		likey.setMemberId(loginUser.getMemberId());
		likey.setSpotId(spotId);
		int result = ss.insertSpotLikey(likey);
		String msg = "";
		if(result > 0) {
			msg = "좋아요 리스트에 추가했습니다.";
		} else {
			msg = "회원가입이 필요한 서비스 입니다.";
		}
		try {
			response.getWriter().print(msg);
		} catch (IOException e) {
			e.printStackTrace();
		} //end try
	}
	
	//명소좋아요전체조회용메소드
	@RequestMapping("selectAllLikeySpot.sp")
	public String selectAllLikeySpot(HttpServletRequest request, Model model) {
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		ArrayList<SpotList> spotList = ss.selectMyLikeySpotList(loginUser.getMemberId());
		model.addAttribute("spotList", spotList);
		return "spot/myLikeySpotList";
	}
	
	//명소좋아요조건조회용메소드
	@RequestMapping("selectConditionLikeySpot.sp")
	public String selectConditionLikeySpot() {
		return null;
	}
	
	//명소좋아요삭제용메소드
	@RequestMapping("deleteLikeySpot.sp")
	public String deleteLikeySpot() {
		return null;
	}
	
} //end class
