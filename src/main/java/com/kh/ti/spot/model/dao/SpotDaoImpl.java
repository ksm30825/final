package com.kh.ti.spot.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ti.spot.model.vo.Likey;
import com.kh.ti.spot.model.vo.SpotCityList;
import com.kh.ti.spot.model.vo.SpotList;

@Repository
public class SpotDaoImpl implements SpotDao {


	//명소 도시명 조회용 - 세령
	@Override
	public ArrayList<SpotCityList> selectCityNames(SqlSessionTemplate sqlSession) {
		ArrayList<SpotCityList> cityList = (ArrayList) sqlSession.selectList("Spot.selectCityNames");
		return cityList;
	}

	//먕소 도시 전체 조회용 - 세령
	@Override
	public ArrayList<SpotCityList> selectCityList(SqlSessionTemplate sqlSession) {
		ArrayList<SpotCityList> cityList = (ArrayList) sqlSession.selectList("Spot.selectCityList");
		return cityList;
	}

	//도시 상세보기용 - 세령
	@Override
	public ArrayList<SpotList> selectSpotList(SqlSessionTemplate sqlSession, int cityId) {
		ArrayList<SpotList> spotList = (ArrayList) sqlSession.selectList("Spot.selectSpotList", cityId);
		return spotList;
	}

	//명소 좋아요 추가용 - 세령
	@Override
	public int insertSpotLikey(SqlSessionTemplate sqlSession, Likey likey) {
		return sqlSession.insert("Spot.insertSpotLikey", likey);
	}

	//마이페이지 명조 좋아요 조회용 - 세령
	@Override
	public ArrayList<SpotList> selectMyLikeySpotList(SqlSessionTemplate sqlSession, int memberId) {
		ArrayList<SpotList> spotList = (ArrayList) sqlSession.selectList("Spot.selectMyLikeySpotList", memberId);
		return spotList;
	}
	

}
