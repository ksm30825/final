package com.kh.ti.travelRequest.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.ti.common.PageInfo;
import com.kh.ti.travelRequest.model.vo.TravelRequest;

public interface TravelRequestDao {

	int insertRequest(SqlSessionTemplate sqlSession, TravelRequest tr);

	int getListCount(SqlSessionTemplate sqlSession);

	ArrayList<TravelRequest> selectRequestList(SqlSessionTemplate sqlSession, PageInfo pi);

}
