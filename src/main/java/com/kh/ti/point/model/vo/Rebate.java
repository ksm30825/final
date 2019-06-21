package com.kh.ti.point.model.vo;

import java.sql.Date;

public class Rebate {
	private int rebateId;
	private Date applyDate;
	private int payAmount;
	private int memberId;
	private Date payDate;
	private int rebateStatus;
	
	public Rebate() {}

	public Rebate(int rebateId, Date applyDate, int payAmount, int memberId, Date payDate, int rebateStatus) {
		super();
		this.rebateId = rebateId;
		this.applyDate = applyDate;
		this.payAmount = payAmount;
		this.memberId = memberId;
		this.payDate = payDate;
		this.rebateStatus = rebateStatus;
	}

	public int getRebateId() {
		return rebateId;
	}

	public Date getApplyDate() {
		return applyDate;
	}

	public int getPayAmount() {
		return payAmount;
	}

	public int getMemberId() {
		return memberId;
	}

	public Date getPayDate() {
		return payDate;
	}

	public int getRebateStatus() {
		return rebateStatus;
	}

	public void setRebateId(int rebateId) {
		this.rebateId = rebateId;
	}

	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}

	public void setPayAmount(int payAmount) {
		this.payAmount = payAmount;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public void setRebateStatus(int rebateStatus) {
		this.rebateStatus = rebateStatus;
	}

	@Override
	public String toString() {
		return "Rebate [rebateId=" + rebateId + ", applyDate=" + applyDate + ", payAmount=" + payAmount + ", memberId="
				+ memberId + ", payDate=" + payDate + ", rebateStatus=" + rebateStatus + "]";
	}
}
