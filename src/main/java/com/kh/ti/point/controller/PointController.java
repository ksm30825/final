package com.kh.ti.point.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ti.common.PageInfo;
import com.kh.ti.common.Pagination;
import com.kh.ti.member.model.vo.Member;
import com.kh.ti.point.model.service.PointService;
import com.kh.ti.point.model.vo.Payment;
import com.kh.ti.point.model.vo.Proceeds;
import com.kh.ti.point.model.vo.Rebate;
import com.kh.ti.point.model.vo.Refund;
import com.kh.ti.point.model.vo.ReservePoint;
import com.kh.ti.point.model.vo.SearchPoint;
import com.kh.ti.point.model.vo.UsePoint;

@Controller
public class PointController {
	@Autowired
	private PointService ps;	
	
	
	
	
	//누적포인트, 누적수익금 조회
	@ResponseBody
	@RequestMapping("/selectAccumulate.po")
	public ResponseEntity selectAccumulate(ModelAndView mv, HttpServletRequest request, int memberId) {
		//회원의 누적 포인트, 수익금 조회
		
		//System.out.println("memberId : " + memberId);
		int userPoint = ps.selectUserPoint(memberId);
		//System.out.println("userPoint : " + userPoint);
		int userProceeds = ps.selectUserProceeds(memberId);
		//System.out.println("userProceeds : " + userProceeds);
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("userPoint", userPoint);
		hmap.put("userProceeds", userProceeds);
		
		mv.addObject("hmap", hmap);
		
		return new ResponseEntity(hmap, HttpStatus.OK);
	}
	
	
	
	//포인트 전체 페이지
	@RequestMapping("/pointMainView.po")
	public String selectPointMainView(Model model , HttpServletRequest request, @RequestParam("currentPage") int currentPage) {
		//포인트충전, 지급, 사용 내역 테이블 전체 조회
		//페이징 처리도 전부
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		////System.out.println(loginUser.getMemberId());
		int memberId = loginUser.getMemberId();
		
		//포인트 충전에 관한 것들 조회
		Payment charge = new Payment();
		charge.setMemberId(memberId);
		int chargeListCount = ps.getChargeListCount(charge);
		////System.out.println("chargeListCount : " + chargeListCount);
		int chargeCurrentPage = currentPage;
		PageInfo chPi = Pagination.getPageInfo(chargeCurrentPage, chargeListCount);
		////System.out.println("chPi : " + chPi);
		ArrayList<Payment> chPayList = ps.selectChargeList(chPi, charge);
		model.addAttribute("chPayList", chPayList);
		model.addAttribute("chPi",chPi);
		////System.out.println("chmodel : " + model);
		
//		for(int i=0 ; i<chPayList.size() ; i++) {
//		//포인트 충전에 관한 것들 조회(일단 임 ; i++) {
//			//System.out.println("chPayList["+i+"] : "+chPayList.get(i)); 
//		}
		
		//포인트 지급에 관한 것들 조회
		ReservePoint reserve = new ReservePoint();
		reserve.setMemberId(memberId);
		int receiveListCount = ps.getReceiveListCount(reserve);
		////System.out.println("ReceiveListCount : " + receiveListCount);
		int receiveCurrentPage = currentPage;
		PageInfo rePi = Pagination.getPageInfo(receiveCurrentPage, receiveListCount);
		ArrayList<ReservePoint> rePayList = ps.selectReceiveList(rePi, reserve);
		model.addAttribute("rePayList", rePayList);
		////System.out.println("rePi : " + rePi);
		model.addAttribute("rePi",rePi);
		
		//포인트 사용에 관한 것들 조회
		UsePoint use = new UsePoint();
		use.setMemberId(memberId);
		int useListCount = ps.getUseListCount(use);
		////System.out.println("useListCount : " + useListCount);
		int useCurrentPage = currentPage;
		PageInfo usPi = Pagination.getPageInfo(useCurrentPage, useListCount);
		////System.out.println("usPi : " + usPi);
		ArrayList<UsePoint> usPayList = ps.selectUseList(usPi, use);
		model.addAttribute("usPayList", usPayList);
		model.addAttribute("usPi",usPi);
		//-------------------------------------------------------------------------------------------ptcpId찾아서 넘겨주기
		
		return "point/pointMain";
	}
	
	
	
	//포인트 충전 페이징//-------------------------------------------------------------------------------------------
	@RequestMapping("/paymentMain.po")
	public String selectPaymentMain(Model model , HttpServletRequest request, @RequestParam("currentPage") int currentPage) {
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		////System.out.println(loginUser.getMemberId());
		int memberId = loginUser.getMemberId();
		
		//포인트 충전에 관한 것들 조회
		Payment charge = new Payment();
		charge.setMemberId(memberId);
		int chargeListCount = ps.getChargeListCount(charge);
		////System.out.println("chargeListCount : " + chargeListCount);
		int chargeCurrentPage = currentPage;
		PageInfo chPi = Pagination.getPageInfo(chargeCurrentPage, chargeListCount);
		////System.out.println("chPi : " + chPi);
		ArrayList<Payment> chPayList = ps.selectChargeList(chPi, charge);
		model.addAttribute("chPayList", chPayList);
		model.addAttribute("chPi",chPi);
		
		return "point/pointMain";		
	}
	
	//포인트 충전 월 검색 내역 테이블--수민
	@ResponseBody
	@RequestMapping("/oneMonthPay.po")
	public Object searchOneMonthPay(String month, ModelAndView mv, HttpServletRequest request, @RequestParam("currentPage") int currentPage) {
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int memberId = loginUser.getMemberId();
		Payment charge = new Payment();
		charge.setMemberId(memberId);
		charge.setMonth(month);
		//System.out.println("month : " + month);
		//System.out.println("memberID : "+ memberId);
		//System.out.println("charge : " + charge);
		
		int chargeListCount = ps.getChargeListCount(charge); 
		//System.out.println("chargeListCount : "+chargeListCount);
		int chargeCurrentPage = currentPage; 
		PageInfo chPi = Pagination.getPageInfo(chargeCurrentPage, chargeListCount);
		ArrayList chPayList = ps.selectChargeList(chPi, charge);
		//System.out.println("chPayList : "+ chPayList);
		/*
		 * for(int i=0 ; i<chPayList.size() ; i++) {
		 * //System.out.println("chPayList.get("+i+").getPaymentDate().getTime()"+
		 * chPayList.get(i).getPaymentDate().getTime()); }
		 */
		//mv.addObject("chPayList", chPayList);
		//mv.addObject("chPi", chPi);
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("chPayList", chPayList);
		hmap.put("chPi", chPi);
		mv.addObject("hmap", hmap);
		
		mv.setViewName("jsonView");
		//System.out.println("mv : " + mv);
		
		return mv.getModel();
	}
	
	//---------------
	//포인트 충전 월검색 페이징//-------------------------------------------------------------------------------------------
	@RequestMapping("/oneMonthPayPaging.po")
	public String searchOneMonthPayPaging(String month, Model model, HttpServletRequest request, @RequestParam("currentPage") int currentPage) {
		//System.out.println("oneMonthPayPaging");
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int memberId = loginUser.getMemberId();
		Payment charge = new Payment();
		charge.setMemberId(memberId);
		charge.setMonth(month);
		
		int chargeListCount = ps.getChargeListCount(charge); 
		int chargeCurrentPage = currentPage; 
		PageInfo chPi = Pagination.getPageInfo(chargeCurrentPage, chargeListCount);
		ArrayList chPayList = ps.selectChargeList(chPi, charge);

		model.addAttribute("chPayList", chPayList);
		model.addAttribute("chPi", chPi);
		
		return "point/pointMain";
	}
	
	//포인트 충전하는 페이지로 이동--수민
	@RequestMapping("/toPayView.po")
	public String toPayView(/* int memberId, String payAmount */) {
		
		return "point/payment";
	}
	
	//포인트 충전--수민
	@RequestMapping("/toPay.po")
	public String toPay(String tid, String pAmount, HttpServletRequest request) {
		////System.out.println("tid : " + tid);
		////System.out.println("payAmount : " + pAmount);
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		////System.out.println(loginUser.getMemberId());
		int memberId = loginUser.getMemberId();
		//충전액
		int payAmount = Integer.parseInt(pAmount);
		//충전일
		Date paymentDate = new Date(new GregorianCalendar().getTimeInMillis());
		
		////System.out.println("paymentDate : " + paymentDate);
		
		Payment pay = new Payment();
		pay.setTid(tid);
		pay.setPayAmount(payAmount);
		pay.setPaymentDate(paymentDate);
		pay.setMemberId(memberId);
		pay.setMonth("0");
		
		//System.out.println("넘기기전 pay : " + pay);

		//포인트충전
		//->결제 테이블에 insert
		int result = ps.insertPay(pay);
		////System.out.println("result : " + result);
		int updateUserPoint = 0;
		if(result > 0) {
			//System.out.println("누적 전 : " + pay);
			updateUserPoint = ps.updateUserPoint(pay);
			
			
			//System.out.println("누적 후  : " + pay);
		} else {
			return "common/errorPage";
		}
		
		if(result>0 && updateUserPoint>0) {
			return "redirect:/pointMainView.po?currentPage=1";
		}else {
			return "common/errorPage";
		}
		
	}
	
	
	
	//포인트 지급 페이징//-------------------------------------------------------------------------------------------
	@RequestMapping("/reserveMain.po")
	public String selectReserveMain(Model model , HttpServletRequest request, @RequestParam("currentPage") int currentPage) {
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		////System.out.println(loginUser.getMemberId());
		int memberId = loginUser.getMemberId();
		
		//포인트 충전에 관한 것들 조회
		ReservePoint reserve = new ReservePoint();
		reserve.setMemberId(memberId);
		int reserveListCount = ps.getReceiveListCount(reserve);
		int reserveCurrentPage = currentPage;
		PageInfo rePi = Pagination.getPageInfo(reserveCurrentPage, reserveListCount);
		////System.out.println("chPi : " + chPi);
		ArrayList<ReservePoint> rePayList = ps.selectReceiveList(rePi, reserve);
		model.addAttribute("rePayList", rePayList);
		model.addAttribute("rePayList",rePayList);
		
		//-------------------------------------------------------------------------------------------ptcpId찾아서 넘겨주기
		
		return "point/pointMain";		
	}
	//포인트 지급 월 검색 내역 테이블--수민
	@ResponseBody
	@RequestMapping("/oneMonthRPoint.po")
	public Object searchOneMonthRPoint(String month, ModelAndView mv, HttpServletRequest request) {
		////System.out.println("month : " + month);
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int memberId = loginUser.getMemberId();
		
		ReservePoint reserve = new ReservePoint();
		reserve.setMemberId(memberId);
		reserve.setMonth(month);
		////System.out.println("reserve : " + reserve);
		
		int reserveListCount = ps.getReceiveListCount(reserve); 
		////System.out.println("월 검색 reserveListCount : "+reserveListCount);
		int reserveCurrentPage = 1; 
		PageInfo rePi = Pagination.getPageInfo(reserveCurrentPage, reserveListCount);
		ArrayList rePayList = ps.selectReceiveList(rePi, reserve);
		////System.out.println("rePayList : "+ rePayList);
		
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("rePayList", rePayList);
		hmap.put("rePi", rePi);
		mv.addObject("hmap", hmap);
		
		mv.setViewName("jsonView");
		////System.out.println("mv : " + mv);
		
		return mv.getModel();
	}
	
	//-------------------------------------------------------------------------------일정작성, 일정리뷰, 명소리뷰
	//포인트 지급 게시글 확인하러 가기버튼 눌렀을때
		//-> 해당 게시글번호(리뷰면 리뷰, 일정작성이면 일정작성)--수민
	@RequestMapping("/oneBoardRPoint.po")
	public String selectOneBoardRPoint(String mid, String bid) {
		int memberId = Integer.parseInt(mid);
		int boardCode = Integer.parseInt(bid);
//		int reserveType = Integer.parseInt(rType);
//		
//		if(reserveType == 10) {
//			//일정 작성
//			return "redirect:/selectTravel.trv?trvId="+boardCode;//-------------------------------------------------------------------------------
//		}else if(reserveType == 20) {
//			//일정 리뷰
//			return "redirect:/selectTravel.trv?trvId="+boardCode;
//		}else {
//			//명소 리뷰
//			return "redirect:/selectTravel.trv?trvId="+boardCode;
//		}
		
		//System.out.println("memberID : " + memberId);
		//System.out.println("boardCode : " + boardCode);
		return "redirect:/travelDetailForm.tb?trvId="+boardCode;//-------------------------------------------------------------------------------
	}
	//관리자 수익금 페이지에서 해당 글 상세보기 (의뢰)
	@RequestMapping("/oneBoard.po")
	public String adOneBoard(@RequestParam("bid") int bid) {
		return "redirect:/travelDetailForm.tb?trvId="+bid;
	}
	@RequestMapping("/oneBoardRequest.po")
	public String selectOneBoardRequest(@RequestParam("bid") int bid) {
		
		return "redirect:requestPlan.tr?ptcpId="+bid;
	}
	//포인트 자동 인서트!!
	//10:일정작성, 20:일정리뷰, 30:여행지리뷰
	//일정작성:300P, 일정리뷰:50P, 여행지리뷰:10P
	@RequestMapping("/pointReserve.po")
	public String insertPointReserve(int memberId, int code, int reserveType, int rPoint) {
		//memberId : 작성 회원코드
		//code : 작성글 코드
		//type : 10:일정작성, 20:일정리뷰, 30:여행지리뷰
		//rPoint : 일정작성:300, 일정리뷰:50, 여행지리뷰:10
		////System.out.println("처리전 memberId : " + memberId);
		////System.out.println("처리전 code : " + code);
		////System.out.println("처리전 reserveType : " + reserveType);
		////System.out.println("처리전 rPoint : " + rPoint);
		Date reserveDate = new Date(new GregorianCalendar().getTimeInMillis());
		ReservePoint rp = new ReservePoint();
		
		rp.setReservePoint(rPoint);
		rp.setReserveDate(reserveDate);
		rp.setMemberId(memberId);
		rp.setReserveType(reserveType);
		int spotId=0;
		switch(reserveType) {
		case 10 : rp.setTrvId(code); break;
		case 20 : rp.setReviewId(code);	break;
		case 30 : rp.setSpotReviewId(code);	
			spotId = ps.selectSpotId(rp.getSpotReviewId());
			break;
		}
		
		////System.out.println("처리전 rp : " + rp);
		int result = ps.insertReservePoint(rp);//포인트 insert
		////System.out.println("result : " + result);
		
		int updateUserPoint = ps.updateUserPointAuto(rp);//userPoint 증가
		
		
		
		if(result>0 && updateUserPoint>0) {
			switch(reserveType) {
			case 10 : return "redirect:/showMyTravel.trv";
			case 20 : int trvId = ps.selectOneTrv(rp); return "redirect:/travelDetailForm.tb?trvId="+trvId; 
			case 30 : return "redirect:/showMyTravel.trv?"; //세령이 매핑주소로 넘기기
			}
		}
		return "common/errorPage";
	}

	
	
	
	//포인트 사용 페이징//-------------------------------------------------------------------------------------------
	@RequestMapping("/useMain.po")
	public String selectUseMain(Model model , HttpServletRequest request, @RequestParam("currentPage") int currentPage) {
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		////System.out.println(loginUser.getMemberId());
		int memberId = loginUser.getMemberId();
		
		//포인트 충전에 관한 것들 조회
		UsePoint use = new UsePoint();
		use.setMemberId(memberId);
		int useListCount = ps.getUseListCount(use);
		int useCurrentPage = currentPage;
		PageInfo usPi = Pagination.getPageInfo(useCurrentPage, useListCount);
		ArrayList<UsePoint> usPayList = ps.selectUseList(usPi, use);
		model.addAttribute("usPayList", usPayList);
		model.addAttribute("usPi",usPi);
		
		return "point/pointMain";		
	}
	//포인트 사용 월 검색 내역 테이블--수민
	@ResponseBody
	@RequestMapping("/oneMonthUPoint.po")
	public Object searchOneMonthUPoint(String month, ModelAndView mv, HttpServletRequest request) {
		//System.out.println("month : " + month);
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int memberId = loginUser.getMemberId();
		
		UsePoint use = new UsePoint();
		use.setMemberId(memberId);
		use.setMonth(month);
		//System.out.println("use : " + use);
		
		int useListCount = ps.getUseListCount(use); 
		//System.out.println("월 검색 reserveListCount : "+useListCount);
		int useCurrentPage = 1; 
		PageInfo usPi = Pagination.getPageInfo(useCurrentPage, useListCount);
		ArrayList usPayList = ps.selectUseList(usPi, use);
		//System.out.println("rePayList : "+ usePayList);
		
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("usPayList", usPayList);
		hmap.put("usPi", usPi);
		mv.addObject("hmap", hmap);
		
		mv.setViewName("jsonView");
		//System.out.println("mv : " + mv);
		
		return mv.getModel();
	}
	
	//포인트 사용 게시글 확인하러 가기버튼 눌렀을때
		//-> 해당 게시글번호(일정작성이면 일정작성, 의뢰면 의뢰글)--수민
	/*
	@RequestMapping("/oneBoardUPoint.po") 
	public String selectOneBoardUPoint(String memberId, String bid) {
		return "??"; 
	}
	*/
	
	//포인트 환불 (사용자가 '환불신청' 눌렀을 때 ->환불내역테이블에 insert된다!)--수민
	@RequestMapping("/refundUPoint.po")
	public ModelAndView insertRefund(String refundId, String refundReason, ModelAndView mv) {
		
		int pointId = Integer.parseInt(refundId);
		//System.out.println("refundId:  "+refundId);
		//System.out.println("refundReason:  "+refundReason);
		
		//대기 상태로 인서트
		int refundStatus = 10;
		Refund refund = new Refund();
		refund.setPointId(pointId);
		refund.setRefundReason(refundReason);
		refund.setRefundStatus(refundStatus);
		
		int result = ps.insertRefund(refund);
		
		//System.out.println("result : " + result);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	//포인트 사용하는 컨트롤러 -> 자동 차감
	//10:일정구매, 20:설계의뢰
	@RequestMapping("/usePoint.po")
	public String insertPointUse(@RequestParam("memberId") int memberId, 
			@RequestParam("code") int code, 
			@RequestParam("useType") int useType, 
			@RequestParam("uPoint") int uPoint, HttpServletRequest request) {
		//code : 작성글 코드 
		//useType : 10:일정구매, 20:설계의뢰
		//uPoint : 사용 포인트
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		//System.out.println("loginUser : " + loginUser);
		//System.out.println("loginUser userPoint 1: " + loginUser.getUserPoint());
		//System.out.println("loginUser userProceeds 1: " + loginUser.getUserProceeds());
		int mid = loginUser.getMemberId();//포인트를 사용한 사람의 아이디
		
		//포인트 사용 내역에 insert(포인트 사용)
		UsePoint userPoint = new UsePoint(); 
		userPoint.setUsePoint(uPoint);//사용 포인트
		userPoint.setUseType(useType);//사용타입 10:일정구매, 20:설계채택
		userPoint.setMemberId(memberId);//포인트 사용하는 사람 아이디
		switch(useType) {
		case 10 : userPoint.setTrvId(code); break;//일정구매일 경우
		case 20 : userPoint.setRequestId(code); break;//설계채택일 경우
		}
		//System.out.println("userPoint : " + userPoint);
		int userResult = ps.insertPointUse(userPoint); 
		//System.out.println("userResult : "+userResult);
		
		//성공시 판 사람의 수익금발생내역에 인서트
		double receiveProceeds = uPoint * 0.8;
		int proceeds=(int) Math.round(receiveProceeds);//수익금 발생금액 -> 원금*0.8
		
		int receiverMemberId=0;//수익금 받는 사람 아이디(판 사람 아이디)
		int accumulateProceeds=0;//판사람의 누적 수익금 
		
		Proceeds findProceeds=null;//판매한 사람의 기존 수익금 내역
		
		Proceeds receiverBoard = new Proceeds();//판매자의 새로운 수익금 내역
		
		receiverBoard.setProceedsType(useType);//판매자의 새로운 수익금 내역의 타입 10:일정판매, 20:설계판매
		
		//성공시 수익금발생내역에 인서트
		int insertProceeds=0;
		int updateProceeds=0;
		
		switch(useType) {
		//(trvId, requestId 통해서 memberId 조회)
		case 10 : //일정판매시 
				receiverBoard.setTrvId(code); //판매자의 새로운 수익금 내역의  여행일정글 코드
				receiverMemberId = ps.selectReceiverTrvMemberId(receiverBoard.getTrvId()); //판매한 여행일정코드와 일치하는 회원번호를 조회
				
				findProceeds = ps.selectOneProceeds(receiverBoard);//판매한 사람의 기존 수익금 내역을 찾아옴
				//System.out.println("findProceeds : " + findProceeds);
				
				receiverBoard.setMemberId(receiverMemberId);//판매자의 새로운 수익금 내역에 판매한 사람의 회원번호를 setter
				
				if(findProceeds == null) {//판매자의 기존 수익금 내역이 없을 경우 -->insert
					receiverBoard.setProceeds(proceeds);//판매자의 수익금 발생금액 setter
					
					//판매자의 기존 수익금 내역이 없을 경우 -->insert
					insertProceeds= ps.insertReceiverProceeds(receiverBoard);
					
				}else {//판매자의 기존 수익금 내역이 존재 할 경우 --> update
					//System.out.println("findProceeds.getProceedsId() : "+findProceeds.getProceedsId());
					receiverBoard.setProceedsId(findProceeds.getProceedsId());
					receiverBoard.setProceeds(findProceeds.getProceeds()+proceeds);
					//System.out.println(receiverBoard);
					
					//판매자의 기존 수익금 내역이 존재 할 경우 --> update
					updateProceeds = ps.updateReceiverProceeds(receiverBoard);
				}
				break;
		case 20 : //설계판매시 
				//판매자의 새로운 수익금 내역의 참여번호를 넣어줘야 한다.
				//넘어온 것이 requestId
				//해당 requestId와 일치하는 ptcpId를 찾고 채택여부가 Y인 내역을 조회해 와야 한다.
				//System.out.println("userPoint.getRequestId() : " + userPoint.getRequestId());
				int ptcpId = ps.selectOnePtcp(userPoint.getRequestId());
				//System.out.println("ptcpId : " + ptcpId);
				receiverBoard.setPtcpId(ptcpId); //판매자의 새로운 수익금 내역의 참여번호를 넣어준다.
		
				receiverMemberId = ps.selectReceiverRequestMemberId(receiverBoard.getPtcpId()); //판매한 여행일정코드와 일치하는 회원번호를 조회해온다.
				receiverBoard.setMemberId(receiverMemberId);//판매자의 회원 아이디 집어넣고
				
				receiverBoard.setProceeds(proceeds);
				
				//판매자의 수익금 내역에 새로 insert -> 설계글이니까
				insertProceeds= ps.insertReceiverProceeds(receiverBoard);
				break;
		}
		//System.out.println("receiverBoard : " + receiverBoard);
		
		
		//성공시 구매자 member 테이블의 누적 포인트 차감
		int updateUserPoint = ps.updateUserDeductionPoint(userPoint);
		
		//성공시 판매자 member 테이블의 누적 수익금 추가
		int updateUserProceeds = ps.updateUserIncreaseProceeds(receiverBoard);
		
		//기존 loginUser의 userPoint
		int existingPoint = loginUser.getUserPoint();
		//System.out.println("existingPoint : " + existingPoint);
		
		//차감된 userPoint 찾기
		int laterPoint = ps.selectOnePoint(mid);
		//System.out.println("laterPoint : "+ laterPoint);
		loginUser.setUserPoint(laterPoint);
		//System.out.println("loginUser.getUserPoint() : " + loginUser.getUserPoint());
		
		
		if((updateProceeds>0 || insertProceeds>0) &&userResult>0 && updateUserPoint>0 && updateUserProceeds>0) {
			switch(useType) {
			//(trvId, requestId 통해서 memberId 조회)
			case 10 : return "redirect:/travelDetailForm.tb?trvId="+userPoint.getTrvId(); 
			case 20 : return "redirect:/selectRequest.mr?memberId="+memberId+"&code="+code;
			}
		}
		return "common/errorPage";
	}
	
	
	
	//수익금 페이지로 이동
	@RequestMapping("/toProceedsView.po")
	public String toProceedsView() {
		return "point/proceedsMain";
	}
//	//수익금 환급신청 + 수익금 달성 전체 조회--수민
//	@RequestMapping("/allRebate.po")//????????????/ModelAndView로 해야 되지 않나?
//	public String selectAllRebate() {
//		
//		return "point/proceedsMain";
//	}
	//수익금 달성내역 전체 조회
	@ResponseBody
	@RequestMapping("/allProceeds.po")
	public ResponseEntity selectAllProceeds(@RequestParam("memberId") int memberId, @RequestParam("currentpage") int currentPage, @RequestParam("month") String month) {
		//System.out.println("memberId : " + memberId);
		//System.out.println("currentPage : " + currentPage);
		//System.out.println("month : " + month);
		
		Proceeds proceeds = new Proceeds();
		proceeds.setMemberId(memberId);
		proceeds.setMonth(month);
		
		int proceedsListCount = ps.getProceedsListCount(proceeds);
		//System.out.println("proceedsListCount : " + proceedsListCount);
		int proceedsCurrentPage = currentPage;
		
		PageInfo proPi = Pagination.getPageInfo(proceedsCurrentPage, proceedsListCount);
		
		ArrayList<Proceeds> proceedsList = ps.selectAllProceeds(proPi, proceeds);
		
		//System.out.println("proceedsList : "+proceedsList);
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("proceedsList", proceedsList);
		hmap.put("proPi", proPi);
		
		return new ResponseEntity(hmap, HttpStatus.OK);
	}
	
	//환급 신청내역 전체 조회
	@ResponseBody
	@RequestMapping("/allRebate.po")
	public ResponseEntity selectAllRebate(@RequestParam("memberId") int memberId, @RequestParam("currentpage") int currentPage, @RequestParam("month") String month) {
		Rebate rebate = new Rebate();
		rebate.setMemberId(memberId);
		rebate.setMonth(month);
		
		int rebateListCount = ps.getRebateListCount(rebate);
		//System.out.println("rebateListCount : " + rebateListCount);
		int rebateCurrentPage = currentPage;
		
		PageInfo rebatePi = Pagination.getPageInfo(rebateCurrentPage, rebateListCount);
		
		ArrayList<Rebate> rebateList = ps.selectAllRebate(rebatePi, rebate);
		//System.out.println("rebateList : " + rebateList);
		HashMap<String, Object> rebateHmap = new HashMap<String, Object>();
		rebateHmap.put("rebateList", rebateList);
		rebateHmap.put("rebatePi", rebatePi);
		
		return new ResponseEntity(rebateHmap, HttpStatus.OK);
	}
	
	//수익금 환급 월 검색 조회--수민
	@RequestMapping("/oneMonthRebate.po")//-------------------------------------------------------------------------------------------
	public ModelAndView searchOneMonthRebate(int memberId, int month, ModelAndView mv) {
		
		return mv;
	}
	//수익금 환급 상태 검색 조회--수민//-------------------------------------------------------------------------------------------
	@RequestMapping("/statusRebate.po")
	public ModelAndView searchStatusRebate(int memberId, String status, ModelAndView mv) {
		
		return mv;
	}
	
	
	
	
	
	//수익금 달성 월 검색 조회--수민//-------------------------------------------------------------------------------------------
	@RequestMapping("/oneMonthProceeds.po")
	public ModelAndView searchOneMonthProceeds(int memberId, int month, ModelAndView mv) {
		
		return mv;
	}
	//환급신청 버튼--수민
		//->환급내역 테이블에 insert
		//10:승인대기, 20:지급대기 ,30:지급완료
	@RequestMapping("/rebateProceeds.po")
	public String insertRebate(@RequestParam("memberId") int memberId,@RequestParam("payAmount") int payAmount) {
		Rebate rebate = new Rebate();
		rebate.setPayAmount(payAmount);
		rebate.setMemberId(memberId);
		rebate.setRebateStatus(10);
		
		int insert = ps.insertRebate(rebate);
		
		int update = ps.updateDeductionRebate(rebate);
		
		if(insert>0 && update>0) {
			return "redirect:/toProceedsView.po";
		}else {
			return "common/errorPage";
		}
	}

	
	//-------------------------------------------------------------------------------------------
	//정산관리 메인페이로 이동 ->결제내역!
	@RequestMapping("/toAPaymentView.po")
	public String aPayment() {
		return "admin/adminPoint/aPayment";
	}
	
	
	
	
	//결제 전체 내역 테이블--수민
	@ResponseBody
	@RequestMapping("/allAdPay.po")
	public ResponseEntity adSelectAllPayment(@RequestParam("memberId") int memberId, @RequestParam("currentPage") int currentPage) {
		
		if(memberId == 1) {
			int adPayListCount = ps.getAdPaymentListCount();
			int adPayCurrentPage = currentPage;
			
			PageInfo adPayPi = Pagination.getPageInfo(adPayCurrentPage, adPayListCount);
			
			int condition = 99;
			
			SearchPoint sp = new SearchPoint();
			sp.setCondition(condition);
			
			ArrayList<Payment> adPayList = ps.selectAdPayList(adPayPi, sp);
			
			HashMap<String, Object> hmap = new HashMap<String, Object>();
			
			hmap.put("adPayList", adPayList);
			hmap.put("adPayPi", adPayPi);
			
			//System.out.println("hmap : " + hmap);
			
			return new ResponseEntity(hmap, HttpStatus.OK);
			
		}else {
			String msg = "관리자만 이용가능한 페이지 입니다.";
			return new ResponseEntity(msg, HttpStatus.OK);
		}
	}	
	
	//결제 회원 검색 내역 테이블--수민
	@RequestMapping("/seacrchAdPay.po")
	public ResponseEntity adSearchPayment(@RequestParam("userName") String userName, 
			@RequestParam("startDate") String start, @RequestParam("endDate") String end,
			@RequestParam("condition") int condition, @RequestParam("currentPage") int currentPage) {
		//System.out.println("userName : " + userName);
		//System.out.println("start : " + start);
		//System.out.println("end : " + end);
		//System.out.println("condition : " + condition);
		
		Date startDate;
		Date endDate;
		if(start == "") {
			startDate = new Date(new GregorianCalendar().getTimeInMillis());
		}else {
			startDate = Date.valueOf(start);
		}
		if(end == "") {
			endDate = new Date(new GregorianCalendar().getTimeInMillis());
		}else {
			endDate = Date.valueOf(end);
		}
		
		//System.out.println("startDate : " + startDate);
		//System.out.println("endDate : " + endDate);
		
		SearchPoint sp = new SearchPoint();
		
		if(condition == 30) {
			//이름과 검색 날짜가 검색 조건
			sp.setUserName(userName);
			sp.setStartDate(startDate);
			sp.setEndDate(endDate);
			sp.setCondition(condition);
			//System.out.println("condition 30 -> sp : " + sp);
		}else if(condition == 10) {
			//이름만 검색 조건
			sp.setUserName(userName);
			sp.setCondition(condition);
			//System.out.println("condition 10 -> sp : " + sp);
		}else if(condition == 20) {
			//날짜만 검색 조건
			sp.setStartDate(startDate);
			sp.setEndDate(endDate);
			sp.setCondition(condition);
			//System.out.println("condition 20 -> sp : " + sp);
		}
		
		//System.out.println("sp : " + sp);
		int adPaySearchListCount = ps.getAdPaySearchListCount(sp);
		//System.out.println("adPaySearchListCount : " + adPaySearchListCount);
		
		int adPayCurrentPage = currentPage;
		
		PageInfo adPayPi= Pagination.getPageInfo(adPayCurrentPage, adPaySearchListCount);
		
		ArrayList<Payment> adPayList = ps.selectAdPayList(adPayPi, sp);
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("adPayList", adPayList);
		hmap.put("adPayPi", adPayPi);
		
		return new ResponseEntity(hmap, HttpStatus.OK);
	}		
	
	
	
	//포인트 전체 내역 메인페이지로 이동 ->--수민
	@RequestMapping("/toAPointView.po")
	public String aPoint() {
		
		return "admin/adminPoint/aPoint";
	}	
	@ResponseBody
	@RequestMapping("/allAdPoint.po")
	public ResponseEntity adSelectAllPoint(@RequestParam("memberId") int memberId, @RequestParam("currentPage") int currentPage) {
		int condition = 99;
		SearchPoint sp = new SearchPoint();
		sp.setCondition(condition);
		
		int adPointListCount = ps.getAdPointListCount(sp);
		
		int adPointCurrentPage = currentPage;
		
		PageInfo adPointPi = Pagination.getPageInfo(adPointCurrentPage, adPointListCount);
		
		ArrayList<Payment> adPointList = ps.selectAdPointList(adPointPi, sp);
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("adPointList", adPointList);
		hmap.put("adPointPi", adPointPi);
		
		return new ResponseEntity(hmap, HttpStatus.OK);
	}
	
	//포인트 회원 검색 내역 테이블--수민
	@RequestMapping("/seacrchAdPoint.po")
	public ResponseEntity adSearchOneMemberPoint(@RequestParam("userName") String userName, 
			@RequestParam("condition") int condition, @RequestParam("currentPage") int currentPage) {
		SearchPoint sp = new SearchPoint();
		sp.setCondition(condition);
		
		if(condition == 10) {
			sp.setUserName(userName);
		}
		
		int adPointListCount = ps.getAdPointListCount(sp);
		
		int adPointCurrentPage = currentPage;
		
		PageInfo adPointPi = Pagination.getPageInfo(adPointCurrentPage, adPointListCount);
		
		ArrayList<Payment> adPointList = ps.selectAdPointList(adPointPi, sp);
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("adPointList", adPointList);
		hmap.put("adPointPi", adPointPi);
		
		return new ResponseEntity(hmap, HttpStatus.OK);
	}
	
	
	
	
	//수익금 전체 내역 테이블--수민
	@RequestMapping("/toAdProceedsView.po")
	public String adSelectAllProceeds() {
		
		return "admin/adminPoint/aProceeds";
	}	
	@RequestMapping("/adProceeds.po")
	public ResponseEntity adSelectAllProceeds(@RequestParam("currentPage") int currentPage, @RequestParam("condition") int condition) {
		SearchPoint sp = new SearchPoint();
		sp.setCondition(condition);
		
		System.out.println("sp : " + sp);
		int adProceedsListCount = ps.getAdProceedsListCount(sp);
		System.out.println("adProceedsListCount : " + adProceedsListCount);
		
		int adProceedsCurrentPage = currentPage;
		
		PageInfo adProceedsPi = Pagination.getPageInfo(adProceedsCurrentPage, adProceedsListCount);
		
		ArrayList<Proceeds> adProceedsList = ps.selectAdProceedsList(adProceedsPi, sp);
		System.out.println("adProceedsList : " + adProceedsList);
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("adProceedsList", adProceedsList);
		hmap.put("adProceedsPi", adProceedsPi);
		
		return new ResponseEntity(hmap, HttpStatus.OK);
	}
	//수익금 회원 검색 내역 테이블--수민
	@RequestMapping("/searchAdProceeds.po")
	public ResponseEntity adSearchOneMemberProceeds(@RequestParam("userName") String userName, 
			@RequestParam("condition") int condition, @RequestParam("currentPage") int currentPage) {
		SearchPoint sp = new SearchPoint();
		sp.setCondition(condition);
		sp.setUserName(userName);
		
		System.out.println("sp : " + sp);
		int adProceedsListCount = ps.getAdProceedsListCount(sp);
		System.out.println("adProceedsListCount : " + adProceedsListCount);
		
		int adProceedsCurrentPage = currentPage;
		
		PageInfo adProceedsPi = Pagination.getPageInfo(adProceedsCurrentPage, adProceedsListCount);
		
		ArrayList<Proceeds> adProceedsList = ps.selectAdProceedsList(adProceedsPi, sp);
		System.out.println("adProceedsList : " + adProceedsList);
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("adProceedsList", adProceedsList);
		hmap.put("adProceedsPi", adProceedsPi);
		
		return new ResponseEntity(hmap, HttpStatus.OK);
	}
	//수익금 발생 게시글 조회--수민
	@RequestMapping("/oneBoardAdProceeds.po")
	public String adSelectOneBoardProceeds(String bid) {
		
		return "??";
	}
	
	
	
	
	//수익금 환급 내역 이동--수민
	@RequestMapping("/toAdRebateView.po")
	public String adSelectAllRebate() {
		
		return "admin/adminPoint/aRebate";
	}
	//수익금 환급 내역 조회
	@RequestMapping("/adRebate.po")
	public ResponseEntity adSelectAllRebate(@RequestParam("currentPage") int currentPage, @RequestParam("condition") int condition) {
		SearchPoint sp = new SearchPoint();
		sp.setCondition(condition);
		
		System.out.println("sp : " + sp);
		int adRebateListCount = ps.getAdRebateListCount(sp);
		System.out.println("adProceedsListCount : " + adRebateListCount);
		
		int adRebateCurrentPage = currentPage;
		
		PageInfo adRebatePi = Pagination.getPageInfo(adRebateCurrentPage, adRebateListCount);
		
		ArrayList<Proceeds> adRebateList = ps.selectAdRebateList(adRebatePi, sp);
		System.out.println("adRebateList : " + adRebateList);
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("adRebateList", adRebateList);
		hmap.put("adRebatePi", adRebatePi);
		
		return new ResponseEntity(hmap, HttpStatus.OK);
	}
	//수익금 환급 회원 검색 조회--수민
	@RequestMapping("/searchAdRebate.po")
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
	

	
	
	//포인트 환불 전체 내역으로 이동!--수민
	@RequestMapping("/toAdRefundView.po")
	public String aRefund(String pointId) {
		
		return "admin/adminPoint/aRefund";
	}
	//환불 내역 전체 조회
	@RequestMapping("/adRefund.po")
	public ResponseEntity adSelectAllRefund(@RequestParam("currentPage") int currentPage, @RequestParam("condition") int condition) {
		SearchPoint sp = new SearchPoint();
		sp.setCondition(condition);
		
		int adRefundListCount = ps.getAdRefundListCount(sp);
		
		int adRefundCurrentPage = currentPage;
		
		PageInfo adRefundPi = Pagination.getPageInfo(adRefundCurrentPage, adRefundListCount);
		
		ArrayList<Payment> adRefundList = ps.selectAdRefundList(adRefundPi, sp);
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("adRefundList", adRefundList);
		hmap.put("adRefundPi", adRefundPi);
		
		return new ResponseEntity(hmap, HttpStatus.OK);
	}
	//포인트 환불 검색 내역--수민
	@RequestMapping("/searchAdRefund.po")
	public ResponseEntity adSelectOneMemberRefund(@RequestParam("userName") String userName, @RequestParam("refundSta") int refundSta, 
			@RequestParam("condition") int condition, @RequestParam("currentPage") int currentPage) {
		
		System.out.println("userName : " + userName);
		System.out.println("refundSta : " + refundSta);
		System.out.println("condition : " + condition);
		SearchPoint sp = new SearchPoint();
		
		if(condition == 30) {
			//이름과 셀렉트박스가 검색 조건
			sp.setUserName(userName);
			sp.setRefundStatus(refundSta);
			sp.setCondition(condition);
			//System.out.println("condition 30 -> sp : " + sp);
		}else if(condition == 10) {
			//이름만 검색 조건
			sp.setUserName(userName);
			sp.setCondition(condition);
			//System.out.println("condition 10 -> sp : " + sp);
		}else if(condition == 20) {
			//셀렉트박스만 검색 조건
			sp.setRefundStatus(refundSta);
			sp.setCondition(condition);
			//System.out.println("condition 20 -> sp : " + sp);
		}
		
		System.out.println("sp : " + sp);
		int adRefundSearchListCount = ps.getAdRefundListCount(sp);
		System.out.println("adRefundSearchListCount : " + adRefundSearchListCount);
		
		int adRefundCurrentPage = currentPage;
		
		PageInfo adRefundPi= Pagination.getPageInfo(adRefundCurrentPage, adRefundSearchListCount);
		
		ArrayList<Payment> adRefundList = ps.selectAdRefundList(adRefundPi, sp);
		
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("adRefundList", adRefundList);
		hmap.put("adRefundPi", adRefundPi);
		
		return new ResponseEntity(hmap, HttpStatus.OK);
	}
	//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	//포인트 환불 승인여부 update 
		//-> 거절 ->변화없음
		//-> 승인 ->환불한 사람 포인트 해당포인트만큼 증가
		//->	->환불한 게시글의 수익금(해당포인트만큼) 차감
	@RequestMapping("/updateAdRefund.po")
	public String adUpdateRefund(String refId, String bid, String cond) {
		//System.out.println("refundId : " + refId);
		//System.out.println("condition : " + cond);
		int refundId = Integer.parseInt(refId);
		int boardId = Integer.parseInt(bid);
		int condition = Integer.parseInt(cond);
		
		//환불 상태 바꿔주기
		Refund refund = new Refund();
		refund.setRefundId(refundId);//환불코드를 이용하여
		
		if(condition == 10 ) {
			//승인
			refund.setRefundStatus(20);//상태를 입력해주고
		}else {
			//거절
			refund.setRefundStatus(30);
		}
		
		int update = ps.updateRefund(refund);//업데이트 해준다
		
		//환불 신청한 내역에서 refundId가 일치하는 하나의 환불내역 조회
		Refund updatedRefund = ps.selectOneRefund(refund);
		//System.out.println("updatedRefund : " + updatedRefund);
		
		//산 사람한테 포인트 돌려주기
		//member테이블의 userPoint 증가
		int updateUserPoint = ps.updateUserPointRefund(updatedRefund);
		
		//판 사람한테 수익금 뺏기 proceeds 감소
		//member테이블의 userProceeds 차감
		Proceeds proceeds = new Proceeds();
		
		if(updatedRefund.getUseType() == 10) {
			//여행일정
			proceeds = ps.selectMemberIdTrv(updatedRefund);
			//System.out.println("TRV Proceeds : " + proceeds);
		}else if(updatedRefund.getUseType() == 20) {
			//설계채택
			proceeds = ps.selectMemberIdRequest(updatedRefund);
			//System.out.println("PLAN Proceeds : " + proceeds);
		}
		//System.out.println("Proceeds : " + proceeds);
		int updateUserProceeds = ps.updateUserProceedsRefund(proceeds);
		
		if(updatedRefund.getUseType() == 10) {
			if(update>0 && updateUserPoint>0 &&updateUserProceeds>0) {
				return "redirect:/toAdRefundView.po";
			}
		}else if(updatedRefund.getUseType() == 20){
			if(update>0 && updateUserPoint>0 &&updateUserProceeds>0 && refund.getRefundStatus()==20) {
				return "redirect:/myChooseCancel.mr?requestId="+updatedRefund.getRequestId();
			}
		}
		
		return "common/errorPage";
	}
}
