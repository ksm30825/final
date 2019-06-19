package com.kh.ti.travel.model.vo;

import java.sql.Date;

public class TrvDay implements java.io.Serializable {

	private int dayId;
	private int dayNumber;
	private Date dayDate;
	private String dayMemo;
	private String isTimeSet;
	private int trvId;
	
	public TrvDay() {}

	public TrvDay(int dayId, int dayNumber, Date dayDate, String dayMemo, String isTimeSet, int trvId) {
		super();
		this.dayId = dayId;
		this.dayNumber = dayNumber;
		this.dayDate = dayDate;
		this.dayMemo = dayMemo;
		this.isTimeSet = isTimeSet;
		this.trvId = trvId;
	}

	public int getDayId() {
		return dayId;
	}

	public void setDayId(int dayId) {
		this.dayId = dayId;
	}

	public int getDayNumber() {
		return dayNumber;
	}

	public void setDayNumber(int dayNumber) {
		this.dayNumber = dayNumber;
	}

	public Date getDayDate() {
		return dayDate;
	}

	public void setDayDate(Date dayDate) {
		this.dayDate = dayDate;
	}

	public String getDayMemo() {
		return dayMemo;
	}

	public void setDayMemo(String dayMemo) {
		this.dayMemo = dayMemo;
	}

	public String getIsTimeSet() {
		return isTimeSet;
	}

	public void setIsTimeSet(String isTimeSet) {
		this.isTimeSet = isTimeSet;
	}

	public int getTrvId() {
		return trvId;
	}

	public void setTrvId(int trvId) {
		this.trvId = trvId;
	}

	@Override
	public String toString() {
		return "TrvDay [dayId=" + dayId + ", dayNumber=" + dayNumber + ", dayDate=" + dayDate + ", dayMemo=" + dayMemo
				+ ", isTimeSet=" + isTimeSet + ", trvId=" + trvId + "]";
	}
	
	
	
}
