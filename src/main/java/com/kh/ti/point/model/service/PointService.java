package com.kh.ti.point.model.service;

import com.kh.ti.point.model.vo.Payment;

public interface PointService {

	//포인트 충전
	int insertPay(Payment pay);

}
