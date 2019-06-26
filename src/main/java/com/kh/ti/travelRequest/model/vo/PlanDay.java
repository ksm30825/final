package com.kh.ti.travelRequest.model.vo;

import java.io.Serializable;
import java.util.ArrayList;

//설계 여행일자
public class PlanDay implements Serializable {
	private int PdayId;		//설계일자 코드
	private String Pday;	//일자
	private String pdayMemo;	//메모
	private String openStatus;	//공개여부
	private int planId;	//설계번호
	private ArrayList<PlanPlace> placeList;	//일자장소들
	
	public PlanDay() {}

	public PlanDay(int pdayId, String pday, String pdayMemo, String openStatus, int planId,
			ArrayList<PlanPlace> placeList) {
		super();
		PdayId = pdayId;
		Pday = pday;
		this.pdayMemo = pdayMemo;
		this.openStatus = openStatus;
		this.planId = planId;
		this.placeList = placeList;
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
		return "PlanDay [PdayId=" + PdayId + ", Pday=" + Pday + ", pdayMemo=" + pdayMemo + ", openStatus=" + openStatus
				+ ", planId=" + planId + ", placeList=" + placeList + "]";
	}
}
