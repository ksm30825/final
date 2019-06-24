package com.kh.ti.travelRequest.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.ti.travelRequest.model.dao.TravelRequestDao;
import com.kh.ti.travelRequest.model.vo.TravelRequest;

@Service
public class TravelRequestServiceImpl implements TravelRequestService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private TravelRequestDao trd;
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	//의뢰하기 신청
	@Override
	public int insertRequest(TravelRequest tr) {
		return trd.insertRequest(sqlSession, tr);
	}

}
