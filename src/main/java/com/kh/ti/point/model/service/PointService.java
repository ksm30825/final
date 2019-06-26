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
	int getChargeListCount(int memberId);
	//포인트 지급 리스트 전체 카운터
	int getReceiveListCount(int memberId);
	//포인트 사용 리스트 전체 카운터
	int getUseListCount(int memberId);
	//포인트 충전리스트 전체 조회
	ArrayList<Payment> selectChargeList(PageInfo chPi, int memberId);
	//포인트 지급리스트 전체 조회
	ArrayList<ReservePoint> selectReceiveList(PageInfo rePi, int memberId);
	//포인트 사용리스트 전체 조회
	ArrayList<UsePoint> selectUseList(PageInfo usPi, int memberId);

}
