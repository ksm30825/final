package com.kh.ti.travelRequest.model.vo;

import java.io.Serializable;
import java.util.ArrayList;

//설계 여행일자
public class PlanDay implements Serializable {
	private ArrayList<PlanDayList> list;	//각 일자 및 메모
	private int PdayId;		//설계일자 코드
	private String Pday;	//일자
	private String pdayMemo;	//메모
	private String openStatus;	//공개여부
	private int planId;	//설계번호
	private ArrayList<PlanPlace> placeList;	//일자장소들
	
	public PlanDay() {}

	public PlanDay(ArrayList<PlanDayList> list, int pdayId, String pday, String pdayMemo, String openStatus, int planId,
			ArrayList<PlanPlace> placeList) {
		super();
		this.list = list;
		this.PdayId = pdayId;
		this.Pday = pday;
		this.pdayMemo = pdayMemo;
		this.openStatus = openStatus;
		this.planId = planId;
		this.placeList = placeList;
	}

	public ArrayList<PlanDayList> getList() {
		return list;
	}

	public void setList(ArrayList<PlanDayList> list) {
		this.list = list;
	}

	public int getPdayId() {
		return PdayId;
	}

	public void setPdayId(int pdayId) {
		PdayId = pdayId;
	}

	public String getPday() {
		return Pday;
	}

	public void setPday(String pday) {
		Pday = pday;
	}

	public String getPdayMemo() {
		return pdayMemo;
	}

	public void setPdayMemo(String pdayMemo) {
		this.pdayMemo = pdayMemo;
	}

	public String getOpenStatus() {
		return openStatus;
	}

	public void setOpenStatus(String openStatus) {
		this.openStatus = openStatus;
	}

	public int getPlanId() {
		return planId;
	}

	public void setPlanId(int planId) {
		this.planId = planId;
	}

	public ArrayList<PlanPlace> getPlaceList() {
		return placeList;
	}

	public void setPlaceList(ArrayList<PlanPlace> placeList) {
		this.placeList = placeList;
	}

	@Override
	public String toString() {
		return "PlanDay [list=" + list + ", PdayId=" + PdayId + ", Pday=" + Pday + ", pdayMemo=" + pdayMemo
				+ ", openStatus=" + openStatus + ", planId=" + planId + ", placeList=" + placeList + "]";
	}
}
