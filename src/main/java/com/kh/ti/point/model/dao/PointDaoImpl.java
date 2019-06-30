package com.kh.ti.point.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ti.common.PageInfo;
import com.kh.ti.point.model.vo.Payment;
import com.kh.ti.point.model.vo.ReservePoint;
import com.kh.ti.point.model.vo.UsePoint;

@Repository
public class PointDaoImpl implements PointDao{

	//포인트 충전
	@Override
	public int insertPay(SqlSessionTemplate sqlSession, Payment pay) {
		//System.out.println("넘어온 후 pay : " + pay);
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
		System.out.println("receiveCount : " + count);
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
	
	
	

}
