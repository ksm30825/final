package com.kh.ti.point.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.ti.point.model.vo.Payment;

public interface PointDao {

	//포인트 충전
	int insertPay(SqlSessionTemplate sqlSession, Payment pay);

}
