package com.kh.ti.myRequest.model.service;

import java.util.ArrayList;

import com.kh.ti.travelRequest.model.vo.Participation;
import com.kh.ti.travelRequest.model.vo.PlanDay;
import com.kh.ti.travelRequest.model.vo.PlanPlace;
import com.kh.ti.travelRequest.model.vo.TravelRequestPlan;

public interface MyRequestService {

	int insertRequestPlan(ArrayList<PlanDay> dayList, ArrayList<PlanPlace> placeList, TravelRequestPlan tp, Participation p);

	ArrayList<TravelRequestPlan> selectRequestPlanList(TravelRequestPlan trp);

	ArrayList<TravelRequestPlan> selectLoadRequestPlan(int planId);

}
