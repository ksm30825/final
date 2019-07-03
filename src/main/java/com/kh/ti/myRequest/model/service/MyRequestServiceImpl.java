package com.kh.ti.myRequest.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.ti.myRequest.model.dao.MyRequestDao;
import com.kh.ti.travelRequest.model.vo.Participation;
import com.kh.ti.travelRequest.model.vo.PlanDay;
import com.kh.ti.travelRequest.model.vo.PlanPlace;
import com.kh.ti.travelRequest.model.vo.TravelRequestPlan;

@Service
public class MyRequestServiceImpl implements MyRequestService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MyRequestDao mrd;
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	@Override
	public int insertRequestPlan(ArrayList<PlanDay> dayList, ArrayList<PlanPlace> placeList,
								 TravelRequestPlan tp, Participation p) {
		int result = 0;
		
		//설계글 인서트(1단계) - 이선우
		int result1 = mrd.insertTravelRequestPlan(sqlSession, tp);
		//설계글 각 일자 인서트(2단계) - 이선우
		int result2 = mrd.insertRequestDay(sqlSession, dayList);
		//설계글 각 장소 인서트(3단계) - 이선우
		int result3 = mrd.insertRequestPlace(sqlSession, placeList);
		//설계글 의뢰참여 인서트(4단계) - 이선우
		int result4 = mrd.insertParticipation(sqlSession, p);
		
		if(result1 > 0 && result2 == dayList.size() && result3 == placeList.size() && result4 > 0) {
			result = 1;
		} else {
			result = 0;
		}
		
		return result;
	}

	//설계글 불러오기 - 이선우
	@Override
	public ArrayList<TravelRequestPlan> selectRequestPlanList(TravelRequestPlan trp) {
		return mrd.selectRequestPlanList(sqlSession, trp);
	}

	//선택한 설계글 불러오기 - 이선우
	@Override
	public ArrayList<TravelRequestPlan> selectLoadRequestPlan(int planId) {
		return mrd.selectLoadRequestPlan(sqlSession, planId);
	}
}
