package com.kh.ti.travel.model.vo;

public class TrvCompany implements java.io.Serializable{

	private int memberId;
	private int trvId;
	
	public TrvCompany() {}

	public TrvCompany(int memberId, int trvId) {
		super();
		this.memberId = memberId;
		this.trvId = trvId;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public int getTrvId() {
		return trvId;
	}

	public void setTrvId(int trvId) {
		this.trvId = trvId;
	}

	@Override
	public String toString() {
		return "TrvCompany [memberId=" + memberId + ", trvId=" + trvId + "]";
	}
	
}
