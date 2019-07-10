package com.kh.ti.spot.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.ti.spot.model.vo.SpotList;

public interface SpotDao {

	ArrayList<SpotList> selectCityNames(SqlSessionTemplate sqlSession);

	ArrayList<SpotList> selectCityList(SqlSessionTemplate sqlSession);

}
