package com.kh.ti.point.model.service;

import java.util.ArrayList;

import com.kh.ti.common.PageInfo;
import com.kh.ti.point.model.vo.Payment;

public interface PointService {

	//포인트 충전
	int insertPay(Payment pay);
	//포인트 충전 리스트 전체 카운터
	int getChargeListCount(int i);
	//포인트 지급 리스트 전체 카운터
	int getReceiveListCount(int i);
	//포인트 충전리스트 전체 조회
	ArrayList<Payment> selectChargeList(PageInfo chPi, int memberId);
	//포인트 지급리스트 전체 조회
	ArrayList<Payment> selectReceiveList(PageInfo rePi, int memberId);

}
