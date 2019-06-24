package com.kh.ti.travelRequest.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.ti.travelRequest.model.vo.TravelRequest;

public interface TravelRequestDao {

	int insertRequest(SqlSessionTemplate sqlSession, TravelRequest tr);

}
