package com.kh.ti.point.model.vo;

import java.sql.Date;

public class Proceeds {
	private int proceedsId;
	private int proceeds;
	private Date proceedsDate;
	private int proceedsType;
	private int memberId;
	private int trvId;
	private int ptcpId;
	
	public Proceeds() {}

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

	@Override
	public String toString() {
		return "Proceeds [proceedsId=" + proceedsId + ", proceeds=" + proceeds + ", proceedsDate=" + proceedsDate
				+ ", proceedsType=" + proceedsType + ", memberId=" + memberId + ", trvId=" + trvId + ", ptcpId="
				+ ptcpId + "]";
	}
}
