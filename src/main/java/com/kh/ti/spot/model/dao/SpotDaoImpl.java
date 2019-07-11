package com.kh.ti.spot.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ti.spot.model.vo.Likey;
import com.kh.ti.spot.model.vo.SpotCityList;
import com.kh.ti.spot.model.vo.SpotFile;
import com.kh.ti.spot.model.vo.SpotList;
import com.kh.ti.travel.model.vo.Country;

@Repository
public class SpotDaoImpl implements SpotDao {

	//도시 상세보기용 - 세령
	@Override
	public ArrayList<HashMap> selectSpotList(SqlSessionTemplate sqlSession, int cityId) {
		return (ArrayList) sqlSession.selectList("Spot.selectSpotList", cityId);
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

	//--------------------
	//여행지의 국가명만 조회용 - 세령
	@Override
	public ArrayList<Country> selectCountryList(SqlSessionTemplate sqlSession) {
		ArrayList<Country> countryList = (ArrayList) sqlSession.selectList("Spot.selectCountryList");
		return countryList;
	}

	//여행도시(파일과 함께) 조회 - 세령
	@Override
	public ArrayList<HashMap> selectCityMap(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("Spot.selectCityMap");
	}

	//CITY ID로 도시정보 조회 - 세령
	@Override
	public Country selectCountryOneInfo(SqlSessionTemplate sqlSession, int cityId) {
		return sqlSession.selectOne("Spot.selectCountryOneInfo", cityId);
	}

	//CITY ID로 도시 사진 조회 - 세령
	@Override
	public ArrayList<SpotFile> selectCityFile(SqlSessionTemplate sqlSession, int cityId) {
		return (ArrayList) sqlSession.selectList("Spot.selectCityFile", cityId);
	}


	
	

}
