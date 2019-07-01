package com.kh.ti.myRequest.model.dao;


import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ti.travelRequest.model.vo.Participation;
import com.kh.ti.travelRequest.model.vo.PlanDay;
import com.kh.ti.travelRequest.model.vo.PlanPlace;
import com.kh.ti.travelRequest.model.vo.TravelRequestPlan;

@Repository
public class MyRequestDaoImpl implements MyRequestDao{

	//설계글 인서트(1단계) - 이선우
	@Override
	public int insertTravelRequestPlan(SqlSessionTemplate sqlSession, TravelRequestPlan tp) {
		return sqlSession.insert("TravelRequest.insertRequestPlan", tp);
	}

	//설계글 각 일자 인서트(2단계) - 이선우
	@Override
	public int insertRequestDay(SqlSessionTemplate sqlSession, ArrayList<PlanDay> dayList) {
		int result2 = 0;
		for(int i = 0; i < dayList.size(); i++) {
			sqlSession.insert("TravelRequest.insertRequestDay", dayList.get(i));
			result2++;
		}
		System.out.println(result2);
		return result2;
	}

	//설계글 각 장소 인서트(3단계) - 이선우
	@Override
	public int insertRequestPlace(SqlSessionTemplate sqlSession, ArrayList<PlanPlace> placeList) {
		int result3 = 0;
		for(int i = 0; i < placeList.size(); i++) {
			sqlSession.insert("TravelRequest.insertRequestPlace", placeList.get(i));
			result3++;
		}
		System.out.println(result3);
		return result3;
	}

	//설계글 의뢰참여 인서트(4단계) - 이선우
	@Override
	public int insertParticipation(SqlSessionTemplate sqlSession, Participation p) {
		return sqlSession.insert("TravelRequest.insertParticipation", p);
	}

}
