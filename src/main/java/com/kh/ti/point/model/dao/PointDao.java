package com.kh.ti.point.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.ti.common.PageInfo;
import com.kh.ti.point.model.vo.Payment;

public interface PointDao {

	//포인트 충전
	int insertPay(SqlSessionTemplate sqlSession, Payment pay);
	//포인트 충전 리스트 전체 카운터
	int getChargeListCount(SqlSessionTemplate sqlSession, int memberId);
	//포인트 지급 리스트 전체 카운터
	int getReceiveListCount(SqlSessionTemplate sqlSession, int memberId);
	//포인트 충전리스트 전체 조회
	ArrayList<Payment> selectChargeList(SqlSessionTemplate sqlSession, PageInfo chPi, int memberId);
	//포인트 지급리스트 전체 조회
	ArrayList<Payment> selectReceiveList(SqlSessionTemplate sqlSession, PageInfo rePi, int memberId);

}
