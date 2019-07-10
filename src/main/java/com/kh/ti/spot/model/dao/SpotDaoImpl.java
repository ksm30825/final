package com.kh.ti.spot.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ti.spot.model.vo.SpotList;

@Repository
public class SpotDaoImpl implements SpotDao{


	//명소 도시명 조회용 - 세령
	@Override
	public ArrayList<SpotList> selectCityNames(SqlSessionTemplate sqlSession) {
		ArrayList<SpotList> cityList = (ArrayList) sqlSession.selectList("Spot.selectCityNames");
		return cityList;
	}

	//먕소 도시 전체 조회용
	@Override
	public ArrayList<SpotList> selectCityList(SqlSessionTemplate sqlSession) {
		ArrayList<SpotList> cityList = (ArrayList) sqlSession.selectList("Spot.selectCityList");
		return cityList;
	}
	

}
