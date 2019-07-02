package com.kh.ti.travel.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.ti.member.model.vo.Member;
import com.kh.ti.travel.model.vo.City;
import com.kh.ti.travel.model.vo.Country;
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

	int updateTravel(Travel trv);
	
	int completeTravel(int trvId);

	int deleteTravel(int trvId);
	
	

	int selectSchNumber(ArrayList<TrvSchedule> schList, String startTime);

	int insertTrvSchedule(TrvSchedule sch, TrvCost cost);

	int updateTrvSchedule(TrvSchedule sch, TrvCost cost);

	ArrayList<TrvSchedule> selectSchList(int dayId);
	
	int updateSchNumber(int dayId, int[] sch);

	int deleteSchNumber(int originDayId, int[] sch);

	int updateSchDay(TrvSchedule trvSch, int[] sch);
	
	int deleteTrvSchedule(int schId);

	int updateDayMemo(TrvDay trvDay);
	
	

	int insertTrvTag(TrvTag trvTag);

	int deleteTrvTag(TrvTag trvTag);	
	
	
	
	
	
	
	
	



	int insertTrvCompany(Travel trv, Member m);

	int deleteTrvComp(Travel trv, int memberId);

	int insertSchFile(SchFile schFile);

	int deleteSchFile(SchFile file);
	
	HashMap selectSpotList(Travel trv);

	
	
	TrvCost selectTrvCost(int schId);
	
	int insertTrvCost(TrvDay day, TrvCost cost);

	int insertTrvCost(TrvSchedule sch, TrvCost cost);
	
	int updateTrvCost(TrvCost cost);

	int deleteTrvCost(TrvCost cost);


















}
