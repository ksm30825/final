package com.kh.ti.spot.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.ti.spot.model.vo.Likey;
import com.kh.ti.spot.model.vo.SpotCityList;
import com.kh.ti.spot.model.vo.SpotFile;
import com.kh.ti.spot.model.vo.SpotList;
import com.kh.ti.travel.model.vo.Country;

public interface SpotDao {

	ArrayList<HashMap> selectSpotList(SqlSessionTemplate sqlSession, int cityId);

	int insertSpotLikey(SqlSessionTemplate sqlSession, Likey likey);

	ArrayList<SpotList> selectMyLikeySpotList(SqlSessionTemplate sqlSession, int memberId);

	ArrayList<Country> selectCountryList(SqlSessionTemplate sqlSession);

	ArrayList<HashMap> selectCityMap(SqlSessionTemplate sqlSession);

	Country selectCountryOneInfo(SqlSessionTemplate sqlSession, int cityId);

	ArrayList<SpotFile> selectCityFile(SqlSessionTemplate sqlSession, int cityId);

}
