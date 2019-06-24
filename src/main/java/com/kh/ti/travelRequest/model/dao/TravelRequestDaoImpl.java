package com.kh.ti.travelRequest.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ti.travelRequest.model.vo.TravelRequest;

@Repository
public class TravelRequestDaoImpl implements TravelRequestDao{

	//의뢰하기 신청
	@Override
	public int insertRequest(SqlSessionTemplate sqlSession, TravelRequest tr) {
		
		return sqlSession.insert("TravelRequest.insertRequest", tr);
	}

}
