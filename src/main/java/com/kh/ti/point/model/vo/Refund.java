package com.kh.ti.point.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Refund implements Serializable {
	//환불내역
	private int refundId;		//환불코드
	private String refundReason;//환불사유
	private Date applyDate;		//환불신청일
	private Date processedDate;	//환불처리일
	private int refundStatus;	//환불신청여부	-10:대기, 20:승인, 30:거절
	private int pointId;		//포인트 사용내역코드
	
	public Refund() {}

	public Refund(int refundId, String refundReason, Date applyDate, Date processedDate, int refundStatus,
			int pointId) {
		super();
		this.refundId = refundId;
		this.refundReason = refundReason;
		this.applyDate = applyDate;
		this.processedDate = processedDate;
		this.refundStatus = refundStatus;
		this.pointId = pointId;
	}

	public int getRefundId() {
		return refundId;
	}

	public String getRefundReason() {
		return refundReason;
	}

	public Date getApplyDate() {
		return applyDate;
	}

	public Date getProcessedDate() {
		return processedDate;
	}

	public int getRefundStatus() {
		return refundStatus;
	}

	public int getPointId() {
		return pointId;
	}

	public void setRefundId(int refundId) {
		this.refundId = refundId;
	}

	public void setRefundReason(String refundReason) {
		this.refundReason = refundReason;
	}

	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}

	public void setProcessedDate(Date processedDate) {
		this.processedDate = processedDate;
	}

	public void setRefundStatus(int refundStatus) {
		this.refundStatus = refundStatus;
	}

	public void setPointId(int pointId) {
		this.pointId = pointId;
	}

	@Override
	public String toString() {
		return "Refund [refundId=" + refundId + ", refundReason=" + refundReason + ", applyDate=" + applyDate
				+ ", processedDate=" + processedDate + ", refundStatus=" + refundStatus + ", pointId=" + pointId + "]";
	}
	
	
}
