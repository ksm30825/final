package com.kh.ti.travelRequest.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;

public class TravelRequestPlan implements Serializable{
	private int planId;		//설계번호
	private String planTitle;	//설계제목
	private int memberId;	//회원번호
	private String planRef;	//참조구분
	private int trvId;	//여행일정번호
	private String planContent;		//여행소개
	private Date modifyDate;	//수정일
	private Date enrollDate;	//작성일
	private int roomCharge;	//숙박비
	private int trafficCharge;	//교통비
	private int etcCharge;	//기타비
	private ArrayList<PlanDay> dayList;	//일정들
	
	public TravelRequestPlan() {}

	public TravelRequestPlan(int planId, String planTitle, int memberId, String planRef, int trvId, String planContent,
			Date modifyDate, Date enrollDate, int roomCharge, int trafficCharge, int etcCharge,
			ArrayList<PlanDay> dayList) {
		super();
		this.planId = planId;
		this.planTitle = planTitle;
		this.memberId = memberId;
		this.planRef = planRef;
		this.trvId = trvId;
		this.planContent = planContent;
		this.modifyDate = modifyDate;
		this.enrollDate = enrollDate;
		this.roomCharge = roomCharge;
		this.trafficCharge = trafficCharge;
		this.etcCharge = etcCharge;
		this.dayList = dayList;
	}

	public int getPlanId() {
		return planId;
	}

	public void setPlanId(int planId) {
		this.planId = planId;
	}

	public String getPlanTitle() {
		return planTitle;
	}

	public void setPlanTitle(String planTitle) {
		this.planTitle = planTitle;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public String getPlanRef() {
		return planRef;
	}

	public void setPlanRef(String planRef) {
		this.planRef = planRef;
	}

	public int getTrvId() {
		return trvId;
	}

	public void setTrvId(int trvId) {
		this.trvId = trvId;
	}

	public String getPlanContent() {
		return planContent;
	}

	public void setPlanContent(String planContent) {
		this.planContent = planContent;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public int getRoomCharge() {
		return roomCharge;
	}

	public void setRoomCharge(int roomCharge) {
		this.roomCharge = roomCharge;
	}

	public int getTrafficCharge() {
		return trafficCharge;
	}

	public void setTrafficCharge(int trafficCharge) {
		this.trafficCharge = trafficCharge;
	}

	public int getEtcCharge() {
		return etcCharge;
	}

	public void setEtcCharge(int etcCharge) {
		this.etcCharge = etcCharge;
	}

	public ArrayList<PlanDay> getDayList() {
		return dayList;
	}

	public void setDayList(ArrayList<PlanDay> dayList) {
		this.dayList = dayList;
	}

	@Override
	public String toString() {
		return "TravelRequestPlan [planId=" + planId + ", planTitle=" + planTitle + ", memberId=" + memberId
				+ ", planRef=" + planRef + ", trvId=" + trvId + ", planContent=" + planContent + ", modifyDate="
				+ modifyDate + ", enrollDate=" + enrollDate + ", roomCharge=" + roomCharge + ", trafficCharge="
				+ trafficCharge + ", etcCharge=" + etcCharge + ", dayList=" + dayList + "]";
	}
}
