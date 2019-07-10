package com.kh.ti.spot.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ti.spot.model.dao.SpotDao;
import com.kh.ti.spot.model.vo.SpotList;

@Service
public class SpotServiceImpl implements SpotService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private SpotDao sd;

	//명소 도시 조회용 - 세령
	@Override
	public ArrayList<SpotList> selectCityNames() {
		return sd.selectCityNames(sqlSession);
	}

	//도시 전체 조회용 - 세령
	@Override
	public ArrayList<SpotList> selectCityList() {
		return sd.selectCityList(sqlSession);
	}
	

}
