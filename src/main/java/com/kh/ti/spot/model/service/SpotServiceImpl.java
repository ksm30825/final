package com.kh.ti.spot.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ti.spot.model.dao.SpotDao;
import com.kh.ti.spot.model.vo.Likey;
import com.kh.ti.spot.model.vo.SpotCityList;
import com.kh.ti.spot.model.vo.SpotList;

@Service
public class SpotServiceImpl implements SpotService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private SpotDao sd;

	//명소 도시 조회용 - 세령
	@Override
	public ArrayList<SpotCityList> selectCityNames() {
		return sd.selectCityNames(sqlSession);
	}

	//도시 전체 조회용 - 세령
	@Override
	public ArrayList<SpotCityList> selectCityList() {
		return sd.selectCityList(sqlSession);
	}

	//도시 상세보기용 - 세령
	@Override
	public ArrayList<SpotList> selectSpotList(int cityId) {
		return sd.selectSpotList(sqlSession, cityId);
	}
	
	//명소 좋아요 추가용 - 세령
	@Override
	public int insertSpotLikey(Likey likey) {
		return sd.insertSpotLikey(sqlSession, likey);
	}

	//마이페이지 명조 좋아요 조회용 - 세령
	@Override
	public ArrayList<SpotList> selectMyLikeySpotList(int memberId) {
		return sd.selectMyLikeySpotList(sqlSession, memberId);
	}
	

}
