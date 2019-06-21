package com.kh.ti.point.model.vo;

import java.sql.Date;

public class usePoint {
	private int pointId;
	private int usePoint;
	private Date useDate;
	private int useType;
	private int memberId;
	private int trvId;
	private int requestId;
	
	public usePoint() {}

	public usePoint(int pointId, int usePoint, Date useDate, int useType, int memberId, int trvId, int requestId) {
		super();
		this.pointId = pointId;
		this.usePoint = usePoint;
		this.useDate = useDate;
		this.useType = useType;
		this.memberId = memberId;
		this.trvId = trvId;
		this.requestId = requestId;
	}

	public int getPointId() {
		return pointId;
	}

	public int getUsePoint() {
		return usePoint;
	}

	public Date getUseDate() {
		return useDate;
	}

	public int getUseType() {
		return useType;
	}

	public int getMemberId() {
		return memberId;
	}

	public int getTrvId() {
		return trvId;
	}

	public int getRequestId() {
		return requestId;
	}

	public void setPointId(int pointId) {
		this.pointId = pointId;
	}

	public void setUsePoint(int usePoint) {
		this.usePoint = usePoint;
	}

	public void setUseDate(Date useDate) {
		this.useDate = useDate;
	}

	public void setUseType(int useType) {
		this.useType = useType;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public void setTrvId(int trvId) {
		this.trvId = trvId;
	}

	public void setRequestId(int requestId) {
		this.requestId = requestId;
	}

	@Override
	public String toString() {
		return "usePoint [pointId=" + pointId + ", usePoint=" + usePoint + ", useDate=" + useDate + ", useType="
				+ useType + ", memberId=" + memberId + ", trvId=" + trvId + ", requestId=" + requestId + "]";
	}
}
