package com.kh.ti.point.model.service;

import java.util.ArrayList;

import com.kh.ti.common.PageInfo;
import com.kh.ti.point.model.vo.Payment;
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

}
