package com.kh.ti.travel.model.service;

import java.util.HashMap;

import com.kh.ti.member.model.vo.Member;
import com.kh.ti.travel.model.vo.Place;
import com.kh.ti.travel.model.vo.SchFile;
import com.kh.ti.travel.model.vo.Tag;
import com.kh.ti.travel.model.vo.Travel;
import com.kh.ti.travel.model.vo.TrvCost;
import com.kh.ti.travel.model.vo.TrvDay;
import com.kh.ti.travel.model.vo.TrvSchedule;

public interface TravelService {

	int insertTravel(Travel trv);
	
	HashMap selectTravel(int trvId);

	int insertTrvCompany(Travel trv, Member m);

	int insertTrvTag(Travel trv, Tag tag);

	int insertTrvPlace(Travel trv, Place plc);

	int insertTrvSchedule(TrvSchedule sch, TrvCost cost, Place plc);

	int insertTrvCost(TrvDay day, TrvCost cost);

	int insertTrvCost(TrvSchedule sch, TrvCost cost);

	int updateTrvSchedule(TrvSchedule sch, Place plc);

	int insertSchFile(SchFile schFile);
	
	HashMap selectAllSchList(Travel trv);

	HashMap selectSpotList(Travel trv);

	int updateTravel(Travel trv);

	int completeTravel(Travel trv);

	int deleteTravel(Travel trv);

	int deleteTrvCity(Travel trv, int cityId);

	int deleteTrvComp(Travel trv, int memberId);

	int deleteTrvTag(Travel trv, int tagId);
	
	int updateTrvCost(TrvCost cost);

	int deleteTrvCost(TrvCost cost);

	int deleteSchFile(SchFile file);

	int deleteTrvSchedule(TrvSchedule sch);





}
