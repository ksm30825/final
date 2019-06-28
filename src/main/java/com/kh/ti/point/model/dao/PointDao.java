package com.kh.ti.point.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.ti.common.PageInfo;
import com.kh.ti.point.model.vo.Payment;
import com.kh.ti.point.model.vo.ReservePoint;
import com.kh.ti.point.model.vo.UsePoint;

public interface PointDao {

	//포인트 충전
	int insertPay(SqlSessionTemplate sqlSession, Payment pay);
	//포인트 충전 리스트 전체 카운터
	int getChargeListCount(SqlSessionTemplate sqlSession, Payment charge);
	//포인트 지급 리스트 전체 카운터
	int getReceiveListCount(SqlSessionTemplate sqlSession, ReservePoint reserve);
	//포인트 사용 리스트 전체 카운터
	int getUseListCount(SqlSessionTemplate sqlSession, UsePoint use);
	//포인트 충전리스트 전체 조회
	ArrayList selectChargeList(SqlSessionTemplate sqlSession, PageInfo chPi, Payment charge);
	//포인트 지급리스트 전체 조회
	ArrayList<ReservePoint> selectReceiveList(SqlSessionTemplate sqlSession, PageInfo rePi, ReservePoint reserve);
	//포인트 사용리스트 전체 조회
	ArrayList<UsePoint> selectUseList(SqlSessionTemplate sqlSession, PageInfo usPi, UsePoint use);
	//포인트 자동으로 적립하기
	int insertReservePoint(SqlSessionTemplate sqlSession, ReservePoint rp);

}
