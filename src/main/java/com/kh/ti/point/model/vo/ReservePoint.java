package com.kh.ti.point.model.vo;

import java.sql.Date;

public class ReservePoint {
	private int pointId;
	private int reservePoint;
	private Date reserveDate;
	private int trvId;
	private int memberId;
	private int reserveType; 
	private int trvReviewId;
	private int reviewId;
	
	public ReservePoint() {}

	public ReservePoint(int pointId, int reservePoint, Date reserveDate, int trvId, int memberId, int reserveType,
			int trvReviewId, int reviewId) {
		super();
		this.pointId = pointId;
		this.reservePoint = reservePoint;
		this.reserveDate = reserveDate;
		this.trvId = trvId;
		this.memberId = memberId;
		this.reserveType = reserveType;
		this.trvReviewId = trvReviewId;
		this.reviewId = reviewId;
	}

	public int getPointId() {
		return pointId;
	}

	public int getReservePoint() {
		return reservePoint;
	}

	public Date getReserveDate() {
		return reserveDate;
	}

	public int getTrvId() {
		return trvId;
	}

	public int getMemberId() {
		return memberId;
	}

	public int getReserveType() {
		return reserveType;
	}

	public int getTrvReviewId() {
		return trvReviewId;
	}

	public int getReviewId() {
		return reviewId;
	}

	public void setPointId(int pointId) {
		this.pointId = pointId;
	}

	public void setReservePoint(int reservePoint) {
		this.reservePoint = reservePoint;
	}

	public void setReserveDate(Date reserveDate) {
		this.reserveDate = reserveDate;
	}

	public void setTrvId(int trvId) {
		this.trvId = trvId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public void setReserveType(int reserveType) {
		this.reserveType = reserveType;
	}

	public void setTrvReviewId(int trvReviewId) {
		this.trvReviewId = trvReviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}

	@Override
	public String toString() {
		return "ReservePoint [pointId=" + pointId + ", reservePoint=" + reservePoint + ", reserveDate=" + reserveDate
				+ ", trvId=" + trvId + ", memberId=" + memberId + ", reserveType=" + reserveType + ", trvReviewId="
				+ trvReviewId + ", reviewId=" + reviewId + "]";
	}
}
