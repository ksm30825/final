package com.kh.ti.point.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PointController {
	
	//임시 마이페이지 메인--수민
	@RequestMapping("/myPageMain.me")
	public String myPageMain() {
		return "point/pointMain";
	}

	
	
	//포인트 충전 전체 내역 테이블--수민
	@RequestMapping("/allPay.po")
	public ModelAndView selectAllPay(ModelAndView mv) {
		
		return mv;
	}	
	//포인트 충전 월 검색 내역 테이블--수민
	@RequestMapping("/oneMonthPay.po")
	public ModelAndView searchOneMonthPay(String month, ModelAndView mv) {
		
		return mv;
	}
	
	
	
	//포인트 지급 전체 내역 테이블--수민
	@RequestMapping("/allRPoint.po")
	public ModelAndView selectAllRPoint(ModelAndView mv) {
		
		return mv;
	}	
	//포인트 지급 월 검색 내역 테이블--수민
	@RequestMapping("/oneMonthRPoint.po")
	public ModelAndView searchOneMonthRPoint(ModelAndView mv) {
		
		return mv;
	}
	//포인트 지급 게시글 확인하러 가기버튼 눌렀을때
		//-> 해당 게시글번호(리뷰면 리뷰, 일정작성이면 일정작성)--수민
	@RequestMapping("/oneBoardRPoint.po")
	public String selectOneBoardRPoint(String bid) {
		
		return "??";
	}
	
	
	
	//포인트 사용 전체 내역 테이블--수민
	@RequestMapping("/allUPoint.po")
	public ModelAndView selectAllUPoint(ModelAndView mv) {
		
		return mv;
	}	
	//포인트 사용 월 검색 내역 테이블--수민
	@RequestMapping("/oneMonthUPoint.po")
	public ModelAndView searchOneMonthUPoint(ModelAndView mv) {
		
		return mv;
	}
	//포인트 사용 게시글 확인하러 가기버튼 눌렀을때
		//-> 해당 게시글번호(일정작성이면 일정작성, 의뢰면 의뢰글)--수민
	@RequestMapping("/oneBoardUPoint.po")
	public String selectOneBoardUPoint(String bid) {
		
		return "??";
	}
	//포인트 환불 (사용자가 '환불신청' 눌렀을 때 ->환불테이블에 insert된다!)--수민
	@RequestMapping("/refundUPoint.po")
	public String insertRefund(String pointId) {
		
		return "??";
	}
	
	
	
	
	//수익금 환급신청 + 수익금 달성 전체 조회
	@RequestMapping("/allRebate.po")//????????????/ModelAndView로 해야 되지 않나?
	public String selectAllRebate() {
		
		return "point/proceedsMain";
	}
	//수익금 환급 월 검색 조회--수민
	@RequestMapping("/oneMonthRebate.po")
	public ModelAndView searchOneMonthRebate(ModelAndView mv) {
		
		return mv;
	}
	//수익금 환급 상태 검색 조회
	@RequestMapping("/statusRebate.po")
	public ModelAndView searchStatusRebate(ModelAndView mv) {
		
		return mv;
	}
	
	
	
	
	//수익금 달성 월 검색 조회--수민
	@RequestMapping("/oneMonthProceeds.po")
	public ModelAndView searchOneMonthProceeds(ModelAndView mv) {
		
		return mv;
	}
	//수익금 달성 환급신청 버튼
		//->환급내역 테이블에 insert
	@RequestMapping("/rebateProceeds.po")
	public String insertRebate(String pointId) {
		
		return "??";
	}

	
	
	
	//-------------------------------------------------------------------------------------------
	//임시 관리자페이지
	@RequestMapping("/aPayment.ad")
	public String aPayment() {
		return "adminPay/aPayment";
	}
	
	
	
	
	//결제 전체 내역 테이블
	@RequestMapping("/allAdPay.po")
	public String adSelectAllPayment() {
		
		return "adminPay/aPayment";
		
	}	
	//결제 회원 검색 내역 테이블
	@RequestMapping("/oneMemberAdPay.po")
	public ModelAndView adSearchOneMemberPayment(ModelAndView mv) {
		
		return mv;
	}		
	//결제 날짜 검색 내역 테이블
	@RequestMapping("/dayAdPay.po")
	public ModelAndView adSearchDatePayment(ModelAndView mv) {
		
		return mv;
	}
	
	
	
	
	//포인트 전체 내역 테이블
	@RequestMapping("/allAdPoint.po")
	public String adSelectAllPoint() {
		
		return "adminPay/aPoint";
	}	
	//포인트 회원 검색 내역 테이블
	@RequestMapping("/oneMemberAdPoint.po")
	public ModelAndView adSearchOneMemberPoint(ModelAndView mv) {
		
		return mv;
	}
	
	
	
	
	//수익금 전체 내역 테이블
	@RequestMapping("/allAdProceeds.po")
	public String adSelectAllProceeds() {
		
		return "adminPay/aProceeds";
	}	
	//수익금 회원 검색 내역 테이블
	@RequestMapping("/oneMemberAdProceeds.po")
	public ModelAndView adSearchOneMemberProceeds(ModelAndView mv) {
		
		return mv;
	}
	//수익금 발생 게시글 조회
	@RequestMapping("/oneBoardAdProceeds.po")
	public String adSelectOneBoardProceeds(String bid) {
		
		return "??";
	}
	
	
	
	
	//수익금 환급 내역 전체 조회
	@RequestMapping("/allAdRebate.po")
	public String adSelectAllRebate() {
		
		return "adminPay/aRebate";
	}
	//수익금 환급 회원 검색 조회
	@RequestMapping("/oneMemberAdRebate.po")
	public ModelAndView adSelectOneMemberRebate(ModelAndView mv) {
		
		return mv;
	}
	//수익금 환급 신청 상태 검색 조회
	@RequestMapping("/statusAdRebate.po")
	public ModelAndView adSelectStatusRebate(ModelAndView mv) {
		
		return mv;
	}
	//수익금 환급 검색 날짜에 따른 조회
	@RequestMapping("/dayAdRebate.po")
	public ModelAndView adSelectDateRebate(ModelAndView mv) {
		
		return mv;
	}
	
	
	
	
	//포인트 환불 전체 내역
	@RequestMapping("/allAdRefund.po")
	public String adSelectAllRefund(String pointId) {
		
		return "adminPay/aRefund";
	}
	//포인트 환불 회원 검색 내역
	@RequestMapping("/oneMemberAdRefund.po")
	public ModelAndView adSelectOneMemberRefund(ModelAndView mv) {
		
		return mv;
	}
	//포인트 환불 상태 검색 내역
	@RequestMapping("/statusAdRefund.po")
	public ModelAndView adSelectStatusRefund(ModelAndView mv) {
		
		return mv;
	}
	//포인트 환불 승인여부 update 
	@RequestMapping("/updateAdRefund.po")
	public String adUpdateRefund(String pointId) {
		
		return "??";
	}
}
