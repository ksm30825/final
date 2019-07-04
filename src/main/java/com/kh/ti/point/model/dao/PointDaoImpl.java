package com.kh.ti.point.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ti.common.PageInfo;
import com.kh.ti.member.model.vo.Member;
import com.kh.ti.point.model.vo.Payment;
import com.kh.ti.point.model.vo.Proceeds;
import com.kh.ti.point.model.vo.Refund;
import com.kh.ti.point.model.vo.ReservePoint;
import com.kh.ti.point.model.vo.UsePoint;

@Repository
public class PointDaoImpl implements PointDao{

	//포인트 충전
	@Override
	public int insertPay(SqlSessionTemplate sqlSession, Payment pay) {
		//System.out.println("넘어온 후 pay : " + pay);
		System.out.println("payAmount : " + pay.getPayAmount());
		return sqlSession.insert("Payment.insertPay", pay);
	}
	//포인트 충전 리스트 전체 카운터
	@Override
	public int getChargeListCount(SqlSessionTemplate sqlSession, Payment charge) {
		return sqlSession.selectOne("Payment.getChargeListCount", charge);
	}
	//포인트 지급 리스트 전체 카운터
	@Override
	public int getReceiveListCount(SqlSessionTemplate sqlSession, ReservePoint reserve) {
		int count = sqlSession.selectOne("Payment.getReceiveListCount", reserve);
		//System.out.println("receiveCount : " + count);
		return count;
	}
	//포인트 사용 리스트 전체 카운터
	@Override
	public int getUseListCount(SqlSessionTemplate sqlSession, UsePoint use) {
		return sqlSession.selectOne("Payment.getUseListCount",use);
	}
	//포인트 충전리스트 전체 조회
	@Override
	public ArrayList selectChargeList(SqlSessionTemplate sqlSession, PageInfo chPi, Payment charge) {
		int offset = (chPi.getCurrentPage() - 1) * chPi.getLimit();
		//System.out.println("chPayList offset : " + offset);
		RowBounds rowBounds = new RowBounds(offset, chPi.getLimit());
		//System.out.println("chPayList rowBounds : " + rowBounds);
		
		ArrayList chPayList = (ArrayList)sqlSession.selectList("Payment.selectChargeList",	charge, rowBounds);
		//System.out.println("chPayList chPayList : " + chPayList);
		
		/*
		 * for(int i=0 ; i<chPayList.size() ; i++) {
		 * System.out.println("dao : chPayList.get("+i+").getPaymentDate() : "+chPayList
		 * .get(i).getPaymentDate()); }
		 */
		return chPayList;
	}
	//포인트 지급리스트 전체 조회
	@Override
	public ArrayList<ReservePoint> selectReceiveList(SqlSessionTemplate sqlSession, PageInfo rePi, ReservePoint reserve) {
		int offset = (rePi.getCurrentPage() - 1) * rePi.getLimit();
		//System.out.println("rePayList offset : " + offset);
		RowBounds rowBounds = new RowBounds(offset, rePi.getLimit());
		//System.out.println("rePayList rowBounds : " + rowBounds);
		
		ArrayList<ReservePoint> rePayList = (ArrayList)sqlSession.selectList("Payment.selectReceiveList", reserve, rowBounds);
		//System.out.println("rePayList rePayList : " + rePayList);
		return rePayList;
	}
	//포인트 사용리스트 전체 조회
	@Override
	public ArrayList<UsePoint> selectUseList(SqlSessionTemplate sqlSession, PageInfo usPi, UsePoint use) {
		int offset = (usPi.getCurrentPage() - 1) * usPi.getLimit();
		//System.out.println("rePayList offset : " + offset);
		RowBounds rowBounds = new RowBounds(offset, usPi.getLimit());
		//System.out.println("rePayList rowBounds : " + rowBounds);
		
		ArrayList<UsePoint> usPayList = (ArrayList)sqlSession.selectList("Payment.selectUseList", use, rowBounds);
		//System.out.println("rePayList rePayList : " + rePayList);
		return usPayList;
	}
	//포인트 자동으로 적립하기
	@Override
	public int insertReservePoint(SqlSessionTemplate sqlSession, ReservePoint rp) {
		//System.out.println("rp : " + rp);
		//System.out.println("rp.getReservePoint() : " + rp.getReservePoint());
		return sqlSession.insert("Payment.insertReservePoint",rp);
	}
	//포인트 환불신청하기-> 환불 내역에 인서트
	@Override
	public int insertRefund(SqlSessionTemplate sqlSession, Refund refund) {
		return sqlSession.insert("Payment.insertRefund", refund);
	}
	//해당 reviewId로 trvId 조회해오기
	@Override
	public int selectOneTrv(SqlSessionTemplate sqlSession, ReservePoint rp) {
		return sqlSession.selectOne("Payment.selectOneTrv", rp);
	}
	//Member 테이블의 userPoint조회해오기
	@Override
	public int selectUserPoint(SqlSessionTemplate sqlSession, int memberId) {
		return sqlSession.selectOne("Payment.selectUserPoint", memberId);
	}
	//Member 테이블의 userPoint조회해오기
	@Override
	public int selectUserProceeds(SqlSessionTemplate sqlSession, int memberId) {
		return sqlSession.selectOne("Payment.selectUserProceeds", memberId);
	}
	//포인트 사용 후 포인트 사용내역에 insert
	@Override
	public int insertPointUse(SqlSessionTemplate sqlSession, UsePoint userPoint) {
		return sqlSession.insert("Payment.insertPointUse", userPoint);
	}
	//포인트 충전시 멤버 테이블의 누적포인트 증가
	@Override
	public int updateUserPoint(SqlSessionTemplate sqlSession, Payment pay) {
		System.out.println("update PayAmount : " + pay.getPayAmount());
		return sqlSession.update("Payment.updateUserPoint",pay);
	}
	//수익금 여행글에 따른 memberId 찾기
	@Override
	public int selectReceiverTrvMemberId(SqlSessionTemplate sqlSession, int trvId) {
		return sqlSession.selectOne("Payment.selectReceiverTrvMemberId", trvId);
	}
	//수익금 의뢰글에 따른 memberId 찾기
	@Override
	public int selectReceiverRequestMemberId(SqlSessionTemplate sqlSession, int ptcpId) {
		return sqlSession.selectOne("Pqyment.selectReceiverRequestMemberId", ptcpId);
	}
	//성공시 수익금발생내역에 인서트
	@Override
	public int insertReceiverProceeds(SqlSessionTemplate sqlSession, Proceeds receiverBoard) {
		return sqlSession.insert("Payment.insertReceiverProceeds", receiverBoard);
	}
	//성공시 member 테이블의 누적 포인트 차감(memberId)
	@Override
	public int updateUserDeductionPoint(SqlSessionTemplate sqlSession, UsePoint userPoint) {
		return sqlSession.update("Payment.updateUserDeductionPoint", userPoint);
	}
	//성공시 member 테이블의 누적 수익금 추가
	@Override
	public int updateUserIncreaseProceeds(SqlSessionTemplate sqlSession, Proceeds receiverBoard) {
		return sqlSession.update("Payment.updateUserIncreaseProceeds", receiverBoard);
	}
	//수익금 달성내역 전체 리스트 출력
	@Override
	public int getProceedsListCount(SqlSessionTemplate sqlSession, Proceeds proceeds) {
		return sqlSession.selectOne("Pqyment.getProceedsListCount", proceeds);
	}
	//수익금 달성내역 가져오기
	@Override
	public ArrayList<ReservePoint> selectAllProceeds(SqlSessionTemplate sqlSession, PageInfo proPi, Proceeds proceeds) {
		int offset = (proPi.getCurrentPage() - 1) * proPi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, proPi.getLimit());
		
		ArrayList<ReservePoint> proceedsList = (ArrayList)sqlSession.selectList("Payment.selectAllProceeds", proceeds, rowBounds);
		return proceedsList;
	}
	
	
	

}
