package com.kh.ti.point.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Payment implements Serializable{
	//결제내역
	private int paymentId;		//결제코드
	private String tid;			//거래번호
	private int memberId;		//회원코드
	private int payAmount;		//결제금액
	private Date paymentDate;	//결제일
	private String month;		//검색 월
	
	public Payment() {}

	public Payment(int paymentId, String tid, int memberId, int payAmount, Date paymentDate, String month) {
		super();
		this.paymentId = paymentId;
		this.tid = tid;
		this.memberId = memberId;
		this.payAmount = payAmount;
		this.paymentDate = paymentDate;
		this.month = month;
	}

	public int getPaymentId() {
		return paymentId;
	}

	public String getTid() {
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

	public String getMonth() {
		return month;
	}

	public void setPaymentId(int paymentId) {
		this.paymentId = paymentId;
	}

	public void setTid(String tid) {
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

	public void setMonth(String month) {
		this.month = month;
	}

	@Override
	public String toString() {
		return "Payment [paymentId=" + paymentId + ", tid=" + tid + ", memberId=" + memberId + ", payAmount="
				+ payAmount + ", paymentDate=" + paymentDate + ", month=" + month + "]";
	}

	
}