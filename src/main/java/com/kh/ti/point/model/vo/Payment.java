package com.kh.ti.point.model.vo;

import java.sql.Date;

public class Payment {
	private int paymentId;
	private int tid;
	private int memberId;
	private int payAmount;
	private Date paymentDate;
	private String buyerName;
	
	public Payment() {}

	public Payment(int paymentId, int tid, int memberId, int payAmount, Date paymentDate, String buyerName) {
		super();
		this.paymentId = paymentId;
		this.tid = tid;
		this.memberId = memberId;
		this.payAmount = payAmount;
		this.paymentDate = paymentDate;
		this.buyerName = buyerName;
	}

	public int getPaymentId() {
		return paymentId;
	}

	public int getTid() {
		return tid;
	}

	public int getMemberId() {
		return memberId;
	}

	public int getPayAmount() {
		return payAmount;
	}

	public Date getPaymentDate() {
		return paymentDate;
	}

	public String getBuyerName() {
		return buyerName;
	}

	public void setPaymentId(int paymentId) {
		this.paymentId = paymentId;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public void setPayAmount(int payAmount) {
		this.payAmount = payAmount;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}

	@Override
	public String toString() {
		return "Payment [paymentId=" + paymentId + ", tid=" + tid + ", memberId=" + memberId + ", payAmount="
				+ payAmount + ", paymentDate=" + paymentDate + ", buyerName=" + buyerName + "]";
	}
}