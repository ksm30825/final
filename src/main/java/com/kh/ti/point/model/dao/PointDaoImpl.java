package com.kh.ti.point.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ti.point.model.vo.Payment;

@Repository
public class PointDaoImpl implements PointDao{

	//포인트 충전
	@Override
	public int insertPay(SqlSessionTemplate sqlSession, Payment pay) {
		
		System.out.println("pay : " + pay);
		return sqlSession.insert("Payment.insertPay",pay);
	}

}
