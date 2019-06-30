package com.kh.ti.myRequest.model.dao;


import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ti.travelRequest.model.vo.PlanDay;
import com.kh.ti.travelRequest.model.vo.PlanPlace;
import com.kh.ti.travelRequest.model.vo.TravelRequestPlan;

public interface MyRequestDao {

	int insertTravelRequestPlan(SqlSessionTemplate sqlSession, TravelRequestPlan tp);

	int insertRequestDay(SqlSessionTemplate sqlSession, ArrayList<PlanDay> dayList);

	int insertRequestPlace(SqlSessionTemplate sqlSession, ArrayList<PlanPlace> placeList);

}
