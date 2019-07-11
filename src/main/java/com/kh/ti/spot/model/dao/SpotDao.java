package com.kh.ti.spot.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.ti.spot.model.vo.Likey;
import com.kh.ti.spot.model.vo.SpotCityList;
import com.kh.ti.spot.model.vo.SpotList;

public interface SpotDao {

	ArrayList<SpotCityList> selectCityNames(SqlSessionTemplate sqlSession);

	ArrayList<SpotCityList> selectCityList(SqlSessionTemplate sqlSession);

	ArrayList<SpotList> selectSpotList(SqlSessionTemplate sqlSession, int cityId);

	int insertSpotLikey(SqlSessionTemplate sqlSession, Likey likey);

	ArrayList<SpotList> selectMyLikeySpotList(SqlSessionTemplate sqlSession, int memberId);

}
