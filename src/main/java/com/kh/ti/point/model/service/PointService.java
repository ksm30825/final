package com.kh.ti.point.model.service;

import java.util.ArrayList;

import com.kh.ti.common.PageInfo;
import com.kh.ti.member.model.vo.Member;
import com.kh.ti.point.model.vo.Payment;
import com.kh.ti.point.model.vo.Proceeds;
import com.kh.ti.point.model.vo.Refund;
import com.kh.ti.point.model.vo.ReservePoint;
import com.kh.ti.point.model.vo.UsePoint;

public interface PointService {

	//포인트 충전
	int insertPay(Payment pay);
	//포인트 충전 리스트 전체 카운터
	int getChargeListCount(Payment charge);
	//포인트 지급 리스트 전체 카운터
	int getReceiveListCount(ReservePoint reserve);
	//포인트 사용 리스트 전체 카운터
	int getUseListCount(UsePoint use);
	//포인트 충전리스트 전체 조회
	ArrayList selectChargeList(PageInfo chPi, Payment charge);
	//포인트 지급리스트 전체 조회
	ArrayList<ReservePoint> selectReceiveList(PageInfo rePi, ReservePoint reserve);
	//포인트 사용리스트 전체 조회
	ArrayList<UsePoint> selectUseList(PageInfo usPi, UsePoint use);
	//포인트 자동으로 적립하기
	int insertReservePoint(ReservePoint rp);
	//포인트 환불신청하기-> 환불 내역에 인서트
	int insertRefund(Refund refund);
	//해당 reviewId로 trvId 조회해오기
	int selectOneTrv(ReservePoint rp);
	//Member 테이블의 userPoint조회해오기
	int selectUserPoint(int memberId);
	//Member 테이블의 userProceeds조회해오기
	int selectUserProceeds(int memberId);
	//포인트 사용 후 포인트 사용내역에 insert
	int insertPointUse(UsePoint userPoint);
	//포인트 충전시 멤버 테이블의 누적포인트 증가
	int updateUserPoint(Payment pay);
	//수익금 여행글에 따른 memberId 찾기
	int selectReceiverTrvMemberId(int trvId);
	//수익금 의뢰글에 따른 memberId 찾기
	int selectReceiverRequestMemberId(int ptcpId);
	//성공시 수익금발생내역에 인서트
	int insertReceiverProceeds(Proceeds receiverBoard);
	//성공시 member 테이블의 누적 포인트 차감(memberId)
	int updateUserDeductionPoint(UsePoint userPoint);
	//성공시 member 테이블의 누적 수익금 추가
	int updateUserIncreaseProceeds(Proceeds receiverBoard);
	//수익금 달성내역 전체 리스트 카운트
	int getProceedsListCount(Proceeds proceeds);
	//수익금 달성내역 가져오기
	ArrayList<Proceeds> selectAllProceeds(PageInfo proPi, Proceeds proceeds);
	//누적수익금을 위한 기존 수익금 조회
	Proceeds selectOneProceeds(Proceeds receiverBoard);
	//누적수익금을 위한 기존 수익금 조회2
	Proceeds selectOneProceedsPtcpId(int ptcpId);

}
