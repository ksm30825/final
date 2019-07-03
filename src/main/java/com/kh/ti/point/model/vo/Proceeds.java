package com.kh.ti.point.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Proceeds implements Serializable {
	//수익금 발생 내역
	private int proceedsId;		//수익금발생코드	
	private int proceeds;		//수익발생액
	private Date proceedsDate;	//수익발생일
	private int proceedsType;	//발생타입	-10:일정판매, 20:설계판매
	private int memberId;		//회원코드
	private int trvId;			//여행일정번호
	private int ptcpId;			//참여번호
	private String month;		//검색월
	
	public Proceeds() {}

	public Proceeds(int proceedsId, int proceeds, Date proceedsDate, int proceedsType, int memberId, int trvId,
			int ptcpId, String month) {
		super();
		this.proceedsId = proceedsId;
		this.proceeds = proceeds;
		this.proceedsDate = proceedsDate;
		this.proceedsType = proceedsType;
		this.memberId = memberId;
		this.trvId = trvId;
		this.ptcpId = ptcpId;
		this.month = month;
	}

	public int getProceedsId() {
		return proceedsId;
	}

	public int getProceeds() {
		return proceeds;
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

	public void setProceedsId(int proceedsId) {
		this.proceedsId = proceedsId;
	}

	public void setProceeds(int proceeds) {
		this.proceeds = proceeds;
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

	@Override
	public String toString() {
		return "Proceeds [proceedsId=" + proceedsId + ", proceeds=" + proceeds + ", proceedsDate=" + proceedsDate
				+ ", proceedsType=" + proceedsType + ", memberId=" + memberId + ", trvId=" + trvId + ", ptcpId="
				+ ptcpId + ", month=" + month + "]";
	}

}
