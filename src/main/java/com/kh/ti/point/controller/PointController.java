package com.kh.ti.point.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.GregorianCalendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ti.common.PageInfo;
import com.kh.ti.common.Pagination;
import com.kh.ti.point.model.service.PointService;
import com.kh.ti.point.model.vo.Payment;

@Controller
public class PointController {
	@Autowired
	private PointService ps;	
	
	//포인트 전체 페이지
	@RequestMapping("/pointMainView.po")
	public String selectPointMainView(Model model) {
		//포인트충전, 지급, 사용 내역 테이블 전체 조회
		//페이징 처리도 전부
		
		//포인트 충전에 관한 것들 조회(일단 임시로 memberId=1)
		int chargeListCount = ps.getChargeListCount(1);
		//System.out.println("chargeListCount : " + chargeListCount);
		int chargeCurrentPage = 1;
		PageInfo chPi = Pagination.getPageInfo(chargeCurrentPage, chargeListCount);
		//System.out.println("chPi : " + chPi);
		ArrayList<Payment> chPayList = ps.selectChargeList(chPi, 1);
		model.addAttribute("chPayList", chPayList);
		//System.out.println("chmodel : " + model);
		/*
		for(int i=0 ; i<chPayList.size() ; i++) {
		System.out.println("chPayList["+i+"] : "+chPayList.get(i)); }
		 */
		
		//포인트 충전에 관한 것들 조회
		int receiveListCount = ps.getReceiveListCount(1);
		//System.out.println("ReceiveListCount : " + receiveListCount);
		int receiveCurrentPage = 1;
		PageInfo rePi = Pagination.getPageInfo(receiveCurrentPage, receiveListCount);
		ArrayList<Payment> rePayList = ps.selectReceiveList(rePi, 1);
		model.addAttribute("rePayList", rePayList);
		//System.out.println("rePi : " + rePi);
		
		//포인트 사용에 관한 것들 조회
		int useListCount = ps.getReceiveListCount(1);
		//System.out.println("useListCount : " + useListCount);
		int useCurrentPage = 1;
		PageInfo usPi = Pagination.getPageInfo(useCurrentPage, useListCount);
		//System.out.println("usPi : " + usPi);
		
		
		return "point/pointMain";
	}
	@RequestMapping("/totalList.po")
	public ModelAndView selectTotalListCount(ModelAndView mv) {
		
		return mv;
	}

	
	
	
	//포인트 충전 월 검색 내역 테이블--수민
	@RequestMapping("/oneMonthPay.po")
	public ModelAndView searchOneMonthPay(int memberId, int month, ModelAndView mv) {
		
		return mv;
	}
	//포인트 충전하는 페이지로 이동--수민
	@RequestMapping("/toPayView.po")
	public String toPayView(/* int memberId, String payAmount */) {
		
		return "point/payment";
	}
	//포인트 충전--수민
	@RequestMapping("/toPay.po")
	public String toPay(String tid, String pAmount) {
		//System.out.println("tid : " + tid);
		//System.out.println("payAmount : " + pAmount);
		//충전액
		int payAmount = Integer.parseInt(pAmount);
		//충전일
		Date paymentDate = new Date(new GregorianCalendar().getTimeInMillis());
		
		System.out.println("paymentDate : " + paymentDate);
		
		Payment pay = new Payment();
		pay.setTid(tid);
		pay.setPayAmount(payAmount);
		pay.setPaymentDate(paymentDate);
		pay.setMemberId(1);
		
		//System.out.println("넘기기전 pay : " + pay);

		//포인트충전
		//->결제 테이블에 insert
		int result = ps.insertPay(pay);
		//System.out.println("result : " + result);
		
		if(result>0) {
			return "redirect:/pointMainView.po";
		}else {
			return "common/errorPage";
		}
		
	}
	
	
	
	
	
	//포인트 지급 월 검색 내역 테이블--수민
	@RequestMapping("/oneMonthRPoint.po")
	public ModelAndView searchOneMonthRPoint(int memberId, int month, ModelAndView mv) {
		
		return mv;
	}
	//포인트 지급 게시글 확인하러 가기버튼 눌렀을때
		//-> 해당 게시글번호(리뷰면 리뷰, 일정작성이면 일정작성)--수민
	@RequestMapping("/oneBoardRPoint.po")
	public String selectOneBoardRPoint(int memberId, int bid) {
		
		return "??";
	}
	//포인트 자동 인서트!!
	//10:일정작성, 20:일정리뷰, 30:여행지리뷰
	//일정작성:300P, 일정리뷰:50P, 여행지리뷰:10P
	@RequestMapping("/pointReserve.po")
	public String insertPointReserve(int memberId, int code, int type, int rPoint) {
		
		return "??";
	}
	
	
	

	//포인트 사용 월 검색 내역 테이블--수민
	@RequestMapping("/oneMonthUPoint.po")
	public ModelAndView searchOneMonthUPoint(int memberId, int month, ModelAndView mv) {
		
		return mv;
	}
	//포인트 사용 게시글 확인하러 가기버튼 눌렀을때
		//-> 해당 게시글번호(일정작성이면 일정작성, 의뢰면 의뢰글)--수민
	@RequestMapping("/oneBoardUPoint.po")
	public String selectOneBoardUPoint(int memberId, int bid) {
		
		return "??";
	}
	//포인트 환불 (사용자가 '환불신청' 눌렀을 때 ->환불테이블에 insert된다!)--수민
	@RequestMapping("/refundUPoint.po")
	public String insertRefund(int memberId, int pointId) {
		
		return "??";
	}
	//포인트 사용하는 컨트롤러 -> 자동 차감
	//10:일정구매, 20:설계의뢰
	@RequestMapping("/usePoint.po")
	public String insertPointUse(int memberId, int code, int type, int uPoint) {
		
		return "??";
	}
	
	
	
	
	//수익금 환급신청 + 수익금 달성 전체 조회--수민
	@RequestMapping("/allRebate.po")//????????????/ModelAndView로 해야 되지 않나?
	public String selectAllRebate() {
		
		return "point/proceedsMain";
	}
	//수익금 환급 월 검색 조회--수민
	@RequestMapping("/oneMonthRebate.po")
	public ModelAndView searchOneMonthRebate(int memberId, int month, ModelAndView mv) {
		
		return mv;
	}
	//수익금 환급 상태 검색 조회--수민
	@RequestMapping("/statusRebate.po")
	public ModelAndView searchStatusRebate(int memberId, String status, ModelAndView mv) {
		
		return mv;
	}
	
	
	
	
	//수익금 달성 월 검색 조회--수민
	@RequestMapping("/oneMonthProceeds.po")
	public ModelAndView searchOneMonthProceeds(int memberId, int month, ModelAndView mv) {
		
		return mv;
	}
	//수익금 달성 환급신청 버튼--수민
		//->환급내역 테이블에 insert
	@RequestMapping("/rebateProceeds.po")
	public String insertRebate(int memberId, int proceedsId, String pointId) {
		
		return "??";
	}

	
	
	
	//멤버테이블에서 누적포인트, 누적 수익금 조회--수민
	@RequestMapping("/pointProceeds.po")
	public ModelAndView selectPointProceeds(int memberId, ModelAndView mv) {
		
		return mv;
	}
	
	
	//-------------------------------------------------------------------------------------------
	//임시 관리자페이지--수민
	@RequestMapping("/aPayment.ad")
	public String aPayment() {
		return "admin/adminPoint/aPayment";
	}
	
	
	
	
	//결제 전체 내역 테이블--수민
	@RequestMapping("/allAdPay.po")
	public String adSelectAllPayment() {
		
		return "admin/adminPoint/aPayment";
		
	}	
	//결제 회원 검색 내역 테이블--수민
	@RequestMapping("/oneMemberAdPay.po")
	public ModelAndView adSearchOneMemberPayment(String userName, ModelAndView mv) {
		
		return mv;
	}		
	//결제 날짜 검색 내역 테이블--수민
	@RequestMapping("/dayAdPay.po")
	public ModelAndView adSearchDatePayment(String startDate, String endDate, ModelAndView mv) {
		
		return mv;
	}
	
	
	
	
	//포인트 전체 내역 테이블--수민
	@RequestMapping("/allAdPoint.po")
	public String adSelectAllPoint() {
		
		return "admin/adminPoint/aPoint";
	}	
	//포인트 회원 검색 내역 테이블--수민
	@RequestMapping("/oneMemberAdPoint.po")
	public ModelAndView adSearchOneMemberPoint(String userName, ModelAndView mv) {
		
		return mv;
	}
	
	
	
	
	//수익금 전체 내역 테이블--수민
	@RequestMapping("/allAdProceeds.po")
	public String adSelectAllProceeds() {
		
		return "admin/adminPoint/aProceeds";
	}	
	//수익금 회원 검색 내역 테이블--수민
	@RequestMapping("/oneMemberAdProceeds.po")
	public ModelAndView adSearchOneMemberProceeds(String userName, ModelAndView mv) {
		
		return mv;
	}
	//수익금 발생 게시글 조회--수민
	@RequestMapping("/oneBoardAdProceeds.po")
	public String adSelectOneBoardProceeds(String bid) {
		
		return "??";
	}
	
	
	
	
	//수익금 환급 내역 전체 조회--수민
	@RequestMapping("/allAdRebate.po")
	public String adSelectAllRebate() {
		
		return "admin/adminPoint/aRebate";
	}
	//수익금 환급 회원 검색 조회--수민
	@RequestMapping("/oneMemberAdRebate.po")
	public ModelAndView adSelectOneMemberRebate(String userName, ModelAndView mv) {
		
		return mv;
	}
	//수익금 환급 신청 상태 검색 조회--수민
	@RequestMapping("/statusAdRebate.po")
	public ModelAndView adSelectStatusRebate(String status, ModelAndView mv) {
		
		return mv;
	}
	//수익금 환급 검색 날짜에 따른 조회--수민
	@RequestMapping("/dayAdRebate.po")
	public ModelAndView adSelectDateRebate(String startDate, String endDate, ModelAndView mv) {
		
		return mv;
	}
	//수익금 환급 한개 상태 변경->update
		//->member 테이블에 누적수익금 변경--수민
	@RequestMapping("updateOneAdRebate.po")
	public ModelAndView adUpdateOneRebate(int rebateId, ModelAndView mv) {
		
		return mv;
	}
	//수익금 환급 전체 상태 변경->update
		//->member 테이블에 누적수익금 변경
		//->환급지급상태 한번에 변경--수민
	@RequestMapping("updateAllAdRebate.po")
	public ModelAndView adUpdateAllRebate(ModelAndView mv) {
		
		return mv;
	}
	

	
	
	
	
	//포인트 환불 전체 내역--수민
	@RequestMapping("/allAdRefund.po")
	public String adSelectAllRefund(String pointId) {
		
		return "admin/adminPoint/aRefund";
	}
	//포인트 환불 회원 검색 내역--수민
	@RequestMapping("/oneMemberAdRefund.po")
	public ModelAndView adSelectOneMemberRefund(String userName, ModelAndView mv) {
		
		return mv;
	}
	//포인트 환불 상태 검색 내역--수민
	@RequestMapping("/statusAdRefund.po")
	public ModelAndView adSelectStatusRefund(String status, ModelAndView mv) {
		
		return mv;
	}
	//포인트 환불 승인여부 update 
		//-> 승인일 경우 멤버테이블의 누적포인트 update--수민
	@RequestMapping("/updateAdRefund.po")
	public String adUpdateRefund(String pointId) {
		
		return "??";
	}
}
