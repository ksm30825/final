package com.kh.ti.point.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ti.common.PageInfo;
import com.kh.ti.point.model.dao.PointDao;
import com.kh.ti.point.model.vo.Payment;
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
	public int getChargeListCount(int memberId) {
		return pd.getChargeListCount(sqlSession, memberId);
	}
	//포인트 지급 리스트 전체 카운터
	@Override
	public int getReceiveListCount(int memberId) {
		return pd.getReceiveListCount(sqlSession, memberId);
	}
	//포인트 충전리스트 전체 조회
	@Override
	public ArrayList<Payment> selectChargeList(PageInfo chPi, int memberId) {
		return pd.selectChargeList(sqlSession, chPi, memberId);
	}

}
