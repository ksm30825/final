package com.kh.ti.travel.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.ti.member.model.vo.Member;
import com.kh.ti.travel.model.vo.City;
import com.kh.ti.travel.model.vo.Country;
import com.kh.ti.travel.model.vo.Place;
import com.kh.ti.travel.model.vo.SchFile;
import com.kh.ti.travel.model.vo.Tag;
import com.kh.ti.travel.model.vo.Travel;
import com.kh.ti.travel.model.vo.TrvCost;
import com.kh.ti.travel.model.vo.TrvDay;
import com.kh.ti.travel.model.vo.TrvSchedule;
import com.kh.ti.travel.model.vo.TrvTag;

public interface TravelService {


	ArrayList<Travel> selectTrvList(int memberId);
	
	int insertTravel(Travel trv);
	
	HashMap selectTravel(int trvId);
	
	ArrayList<Country> selectCountryList();
	
	ArrayList<City> selectCityList(int countryId);
	
	int completeTravel(int trvId);

	int deleteTravel(int trvId);

	int selectSchNumber(ArrayList<TrvSchedule> schList, String startTime);

	int insertTrvSchedule(TrvSchedule sch, TrvCost cost);

	int updateTrvSchedule(TrvSchedule sch, TrvCost cost);
	
	int deleteTrvSchedule(int schId);

	int updateDayMemo(TrvDay trvDay);

	int insertTrvTag(TrvTag trvTag);

	int deleteTrvTag(TrvTag trvTag);	
	
	
	
	
	
	
	
	

	TrvCost selectTrvCost(int schId);
	

	int insertTrvCompany(Travel trv, Member m);


//	int insertTrvPlace(Travel trv, Place plc);

	int insertTrvCost(TrvDay day, TrvCost cost);

	int insertTrvCost(TrvSchedule sch, TrvCost cost);


	int insertSchFile(SchFile schFile);
	
	HashMap selectAllSchList(Travel trv);

	HashMap selectSpotList(Travel trv);

	int updateTravel(Travel trv);


	int deleteTrvCity(Travel trv, int cityId);

	int deleteTrvComp(Travel trv, int memberId);

	
	int updateTrvCost(TrvCost cost);

	int deleteTrvCost(TrvCost cost);

	int deleteSchFile(SchFile file);















}
