package com.kh.ti.travel.model.vo;

import java.util.ArrayList;

public class TrvSchedule implements java.io.Serializable {

	private int schId;
	private String startTime;
	private String endTime;
	private String schMemo;
	private String schContent;
	private String schTransp;
	private int plcId;
	private int dayId;
	private int likeyId;
	
	public TrvSchedule() {}

	public TrvSchedule(int schId, String startTime, String endTime, String schMemo, String schContent, String schTransp,
			int plcId, int dayId, int likeyId) {
		super();
		this.schId = schId;
		this.startTime = startTime;
		this.endTime = endTime;
		this.schMemo = schMemo;
		this.schContent = schContent;
		this.schTransp = schTransp;
		this.plcId = plcId;
		this.dayId = dayId;
		this.likeyId = likeyId;
	}

	public int getSchId() {
		return schId;
	}

	public void setSchId(int schId) {
		this.schId = schId;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getSchMemo() {
		return schMemo;
	}

	public void setSchMemo(String schMemo) {
		this.schMemo = schMemo;
	}

	public String getSchContent() {
		return schContent;
	}

	public void setSchContent(String schContent) {
		this.schContent = schContent;
	}

	public String getSchTransp() {
		return schTransp;
	}

	public void setSchTransp(String schTransp) {
		this.schTransp = schTransp;
	}

	public int getPlcId() {
		return plcId;
	}

	public void setPlcId(int plcId) {
		this.plcId = plcId;
	}

	public int getDayId() {
		return dayId;
	}

	public void setDayId(int dayId) {
		this.dayId = dayId;
	}

	public int getLikeyId() {
		return likeyId;
	}

	public void setLikeyId(int likeyId) {
		this.likeyId = likeyId;
	}

	@Override
	public String toString() {
		return "TrvSchedule [schId=" + schId + ", startTime=" + startTime + ", endTime=" + endTime + ", schMemo="
				+ schMemo + ", schContent=" + schContent + ", schTransp=" + schTransp + ", plcId=" + plcId + ", dayId="
				+ dayId + ", likeyId=" + likeyId + "]";
	}
	
	
	
	
}
