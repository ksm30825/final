package com.kh.ti.spot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SpotController {
	
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
	public String selectAllSpotFromUser() {
		return "spot/spotHome";
	}
	
	//사용자여행지조건조회용메소드
	@RequestMapping("selectConditionSpotUser.sp")
	public String selectConditionSpotFromUser() {
		return null;
	}
	
	//사용자여행지상세보기용메소드 --세령
	@RequestMapping("selectSpotInfoUser.sp")
	public String selectSpotInfoFromUser() {
		return "spot/spotInfoPage";
	}
	
	//명소상세보기용메소드
	@RequestMapping("selectSpotDetailInfo.sp")
	public String selectSpotDetailInfo() {
		return null;
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
	public String insertLikeySpot() {
		return null;
	}
	
	//명소좋아요전체조회용메소드
	@RequestMapping("selectAllLikeySpot.sp")
	public String selectAllLikeySpot() {
		return null;
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
