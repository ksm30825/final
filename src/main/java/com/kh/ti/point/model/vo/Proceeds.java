package com.kh.ti.point.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Proceeds implements Serializable {
	//수익금 발생 내역
	private int proceedsId;		//수익금발생코드	
	private int proceeds;		//수익발생액
	private int accumulateProceeds; //누적수익금
	private Date proceedsDate;	//수익발생일
	private int proceedsType;	//발생타입	-10:일정판매, 20:설계판매
	private int memberId;		//회원코드
	private int trvId;			//여행일정번호
	private int ptcpId;			//참여번호
	private String month;		//검색월
	
	private String userName;
	private String email;
	private String trvTitle;
	private int planId;
	private String planTitle;
	
	private int usePoint;
	private int requestId;
	
	public Proceeds() {}

	public Proceeds(int proceedsId, int proceeds, int accumulateProceeds, Date proceedsDate, int proceedsType,
			int memberId, int trvId, int ptcpId, String month, String userName, String email, String trvTitle,
			int planId, String planTitle) {
		super();
		this.proceedsId = proceedsId;
		this.proceeds = proceeds;
		this.accumulateProceeds = accumulateProceeds;
		this.proceedsDate = proceedsDate;
		this.proceedsType = proceedsType;
		this.memberId = memberId;
		this.trvId = trvId;
		this.ptcpId = ptcpId;
		this.month = month;
		this.userName = userName;
		this.email = email;
		this.trvTitle = trvTitle;
		this.planId = planId;
		this.planTitle = planTitle;
	}

	public int getProceedsId() {
		return proceedsId;
	}

	public int getProceeds() {
		return proceeds;
	}

	public int getAccumulateProceeds() {
		return accumulateProceeds;
	}

	public Date getProceedsDate() {
		return proceedsDate;
	}

	public int getProceedsType() {
		return proceedsType;
	}

	public int getMemberId() {
		return memberId;
	}

	public int getTrvId() {
		return trvId;
	}

	public int getPtcpId() {
		return ptcpId;
	}

	public String getMonth() {
		return month;
	}

	public String getUserName() {
		return userName;
	}

	public String getEmail() {
		return email;
	}

	public String getTrvTitle() {
		return trvTitle;
	}

	public int getPlanId() {
		return planId;
	}

	public String getPlanTitle() {
		return planTitle;
	}

	public void setProceedsId(int proceedsId) {
		this.proceedsId = proceedsId;
	}

	public void setProceeds(int proceeds) {
		this.proceeds = proceeds;
	}

	public void setAccumulateProceeds(int accumulateProceeds) {
		this.accumulateProceeds = accumulateProceeds;
	}

	public void setProceedsDate(Date proceedsDate) {
		this.proceedsDate = proceedsDate;
	}

	public void setProceedsType(int proceedsType) {
		this.proceedsType = proceedsType;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public void setTrvId(int trvId) {
		this.trvId = trvId;
	}

	public void setPtcpId(int ptcpId) {
		this.ptcpId = ptcpId;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setTrvTitle(String trvTitle) {
		this.trvTitle = trvTitle;
	}

	public void setPlanId(int planId) {
		this.planId = planId;
	}

	public void setPlanTitle(String planTitle) {
		this.planTitle = planTitle;
	}

	@Override
	public String toString() {
		return "Proceeds [proceedsId=" + proceedsId + ", proceeds=" + proceeds + ", accumulateProceeds="
				+ accumulateProceeds + ", proceedsDate=" + proceedsDate + ", proceedsType=" + proceedsType
				+ ", memberId=" + memberId + ", trvId=" + trvId + ", ptcpId=" + ptcpId + ", month=" + month
				+ ", userName=" + userName + ", email=" + email + ", trvTitle=" + trvTitle + ", planId=" + planId
				+ ", planTitle=" + planTitle + "]";
	}
	
}
