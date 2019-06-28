package com.kh.ti.point.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ti.common.PageInfo;
import com.kh.ti.point.model.dao.PointDao;
import com.kh.ti.point.model.vo.Payment;
import com.kh.ti.point.model.vo.ReservePoint;
import com.kh.ti.point.model.vo.UsePoint;
@Service
public class PointServiceImpl implements PointService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private PointDao pd;
	
	//포인트 충전
	@Override
	public int insertPay(Payment pay) {
		return pd.insertPay(sqlSession, pay);
	}	
	//포인트 충전 리스트 전체 카운터
	@Override
	public int getChargeListCount(Payment charge) {
		return pd.getChargeListCount(sqlSession, charge);
	}
	//포인트 지급 리스트 전체 카운터
	@Override
	public int getReceiveListCount(ReservePoint reserve) {
		return pd.getReceiveListCount(sqlSession, reserve);
	}
	//포인트 사용 리스트 전체 카운터
	@Override
	public int getUseListCount(UsePoint use) {
		return pd.getUseListCount(sqlSession, use);
	}
	//포인트 충전리스트 전체 조회
	@Override
	public ArrayList selectChargeList(PageInfo chPi, Payment charge) {
		ArrayList chPayList =  pd.selectChargeList(sqlSession, chPi, charge);
		for(int i=0 ; i<chPayList.size() ; i++) {
			/*
			 * System.out.println("service : chPayList.get("+i+").getPaymentDate() : "
			 * +chPayList.get(i).getPaymentDate());
			 */
		}
		return chPayList;
	}
	//포인트 지급리스트 전체 조회
	@Override
	public ArrayList<ReservePoint> selectReceiveList(PageInfo rePi, ReservePoint reserve) {
		return pd.selectReceiveList(sqlSession, rePi, reserve);
	}
	//포인트 사용리스트 전체 조회
	@Override
	public ArrayList<UsePoint> selectUseList(PageInfo usPi, UsePoint use) {
		return pd.selectUseList(sqlSession, usPi, use);
	}
	//포인트 자동으로 적립하기
	@Override
	public int insertReservePoint(ReservePoint rp) {
		return pd.insertReservePoint(sqlSession, rp);
	}

	

	

	

}
