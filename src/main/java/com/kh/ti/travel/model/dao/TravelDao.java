package com.kh.ti.travel.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.ti.member.model.vo.Member;
import com.kh.ti.travel.model.vo.City;
import com.kh.ti.travel.model.vo.Country;
import com.kh.ti.travel.model.vo.Place;
import com.kh.ti.travel.model.vo.SchFile;
import com.kh.ti.travel.model.vo.Tag;
import com.kh.ti.travel.model.vo.Travel;
import com.kh.ti.travel.model.vo.TrvCity;
import com.kh.ti.travel.model.vo.TrvCost;
import com.kh.ti.travel.model.vo.TrvDay;
import com.kh.ti.travel.model.vo.TrvSchedule;

public interface TravelDao {

	int insertTravel(SqlSessionTemplate sqlSession, Travel trv);

	int insertTrvCity(SqlSessionTemplate sqlSession, TrvCity trvCity);
	
	City selectCity(SqlSessionTemplate sqlSession, int cityId);

	int selectTrvId(SqlSessionTemplate sqlSession);

	int insertTrvDay(SqlSessionTemplate sqlSession, TrvDay trvDay);
	
	Travel selectTravel(SqlSessionTemplate sqlSession, int trvId);
	
	ArrayList<Country> selectCountryList(SqlSessionTemplate sqlSession);
	
	ArrayList<City> selectCityList(SqlSessionTemplate sqlSession, int countryId);
	
	ArrayList<Tag> selectTagList(SqlSessionTemplate sqlSession);
	
	int updateTravel(SqlSessionTemplate sqlSession, Travel trv);
	
	int deleteTrvCity(SqlSessionTemplate sqlSession, TrvCity trvCity);
	
	int updateTrvDay(SqlSessionTemplate sqlSession, TrvDay trvDay);
	
	int deleteTrvDay(SqlSessionTemplate sqlSession, TrvDay trvDay);

	int insertTrvCompany(SqlSessionTemplate sqlSession, Travel trv, Member m);

	int insertTag(SqlSessionTemplate sqlSession, Travel trv, Tag tag);

	int insertTrvSchedule(SqlSessionTemplate sqlSession, TrvSchedule sch);

	int insertTrvCost(SqlSessionTemplate sqlSession, TrvCost cost);

	int insertTrvPlace(SqlSessionTemplate sqlSession, Place plc);

	int insertTrvCost(SqlSessionTemplate sqlSession, Travel trv, TrvCost cost);

	int insertSchFile(SqlSessionTemplate sqlSession, SchFile schFile);

	int updateTrvSchedule(SqlSessionTemplate sqlSession, TrvSchedule sch);

	ArrayList selectAllSchList(SqlSessionTemplate sqlSession, Travel trv, int day);

	HashMap selectSpotList(SqlSessionTemplate sqlSession, Travel trv, int cityCode);

	int completeTravel(SqlSessionTemplate sqlSession, Travel trv);

	int deleteTravel(SqlSessionTemplate sqlSession, Travel trv);

	int deleteTrvComp(SqlSessionTemplate sqlSession, Travel trv, int memberId);

	int deleteTrvTag(SqlSessionTemplate sqlSession, Travel trv, int tagId);

	int updateTrvCost(SqlSessionTemplate sqlSession, TrvCost cost);

	int deleteTrvCost(SqlSessionTemplate sqlSession, TrvCost cost);

	int deleteSchFile(SqlSessionTemplate sqlSession, SchFile file);

	int deleteTrvSchedule(SqlSessionTemplate sqlSession, TrvSchedule sch);

	ArrayList<TrvCity> selectTrvCity(SqlSessionTemplate sqlSession, int trvId);

	ArrayList<TrvDay> selectTrvDay(SqlSessionTemplate sqlSession, int trvId);
















}
