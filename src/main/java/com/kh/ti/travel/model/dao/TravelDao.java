package com.kh.ti.travel.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.ti.member.model.vo.Member;
import com.kh.ti.travel.model.vo.City;
import com.kh.ti.travel.model.vo.Country;
import com.kh.ti.travel.model.vo.SchFile;
import com.kh.ti.travel.model.vo.Tag;
import com.kh.ti.travel.model.vo.Travel;
import com.kh.ti.travel.model.vo.TrvCity;
import com.kh.ti.travel.model.vo.TrvCost;
import com.kh.ti.travel.model.vo.TrvDay;
import com.kh.ti.travel.model.vo.TrvSchedule;
import com.kh.ti.travel.model.vo.TrvTag;

public interface TravelDao {

	ArrayList<Travel> selectTrvList(SqlSessionTemplate sqlSession, int memberId);
	
	int insertTravel(SqlSessionTemplate sqlSession, Travel trv);

	int insertTrvCity(SqlSessionTemplate sqlSession, TrvCity trvCity);
	
	City selectCity(SqlSessionTemplate sqlSession, int cityId);

	int selectTrvId(SqlSessionTemplate sqlSession);

	int insertTrvDay(SqlSessionTemplate sqlSession, TrvDay trvDay);
	
	Travel selectTravel(SqlSessionTemplate sqlSession, int trvId);

	ArrayList<TrvCity> selectTrvCityList(SqlSessionTemplate sqlSession, int trvId);

	ArrayList<TrvDay> selectTrvDayList(SqlSessionTemplate sqlSession, int trvId);

	
	ArrayList<Country> selectCountryList(SqlSessionTemplate sqlSession);
	
	ArrayList<City> selectCityList(SqlSessionTemplate sqlSession, int countryId);
	
	ArrayList<Tag> selectTagList(SqlSessionTemplate sqlSession);
	
	int updateTravel(SqlSessionTemplate sqlSession, Travel trv);
	
	int deleteTrvCity(SqlSessionTemplate sqlSession, TrvCity trvCity);
	
	int updateTrvDay(SqlSessionTemplate sqlSession, TrvDay trvDay);
	
	int deleteTrvDay(SqlSessionTemplate sqlSession, TrvDay trvDay);

	int deleteTravel(SqlSessionTemplate sqlSession, int trvId);

	int selectSchCount(SqlSessionTemplate sqlSession, int dayId);
	
	ArrayList<TrvSchedule> selectSchList(SqlSessionTemplate sqlSession, int dayId);

	int insertTrvSchedule(SqlSessionTemplate sqlSession, TrvSchedule sch);	
	
	int selectSchId(SqlSessionTemplate sqlSession);

	int updateSchNumber(SqlSessionTemplate sqlSession, TrvSchedule sch);
	
	int insertTrvCost(SqlSessionTemplate sqlSession, TrvCost cost);
	
	TrvCost selectTrvCost(SqlSessionTemplate sqlSession, int schId);

	int updateTrvCost(SqlSessionTemplate sqlSession, TrvCost cost);

	int deleteTrvCost(SqlSessionTemplate sqlSession, TrvCost cost);

	TrvSchedule selectTrvSchedule(SqlSessionTemplate sqlSession, int schId);

	int updateTrvSchedule(SqlSessionTemplate sqlSession, TrvSchedule sch);
	
	int deleteSchTime(SqlSessionTemplate sqlSession, TrvSchedule sch);

	int updateSchDay(SqlSessionTemplate sqlSession, TrvSchedule sch);
	
	int deleteTrvSchedule(SqlSessionTemplate sqlSession, int schId);

	int updateTrvDayMemo(SqlSessionTemplate sqlSession, TrvDay trvDay);
	

	int updateSchPlcId(SqlSessionTemplate sqlSession, TrvSchedule sch);
	
	

	int insertTag(SqlSessionTemplate sqlSession, TrvTag trvTag);	

	int deleteTrvTag(SqlSessionTemplate sqlSession, TrvTag trvTag);	

	ArrayList<TrvTag> selectTrvTagList(SqlSessionTemplate sqlSession, int trvId);
	
	
	

	int updateSchContent(SqlSessionTemplate sqlSession, TrvSchedule sch);

	int insertSchFile(SqlSessionTemplate sqlSession, SchFile schFile);

	ArrayList<SchFile> selectSchFileList(SqlSessionTemplate sqlSession, int schId);	

	int deleteSchFile(SqlSessionTemplate sqlSession, SchFile file);
	
	
	
	
	

	int updateBudget(SqlSessionTemplate sqlSession, Travel trv);

	
	
	
	
	
	
	
	
	
	int insertTrvCompany(SqlSessionTemplate sqlSession, Travel trv, Member m);


	HashMap selectSpotList(SqlSessionTemplate sqlSession, Travel trv, int cityCode);

	int completeTravel(SqlSessionTemplate sqlSession, int trvId);


	int deleteTrvComp(SqlSessionTemplate sqlSession, Travel trv, int memberId);



































}
