package com.kh.ti.Chatting.model.vo;

import java.sql.Date;

public class Reputation implements java.io.Serializable{

	private int reputId;
	private Date reputDate;
	private String reputType;
	private String reputContent;
	private int chatId;
	private int memberId;
	private int reputant;
	private int victim;
	
	public Reputation() {}

	public Reputation(int reputId, Date reputDate, String reputType, String reputContent, int chatId, int memberId,
			int reputant, int victim) {
		super();
		this.reputId = reputId;
		this.reputDate = reputDate;
		this.reputType = reputType;
		this.reputContent = reputContent;
		this.chatId = chatId;
		this.memberId = memberId;
		this.reputant = reputant;
		this.victim = victim;
	}

	public int getReputId() {
		return reputId;
	}

	public void setReputId(int reputId) {
		this.reputId = reputId;
	}

	public Date getReputDate() {
		return reputDate;
	}

	public void setReputDate(Date reputDate) {
		this.reputDate = reputDate;
	}

	public String getReputType() {
		return reputType;
	}

	public void setReputType(String reputType) {
		this.reputType = reputType;
	}

	public String getReputContent() {
		return reputContent;
	}

	public void setReputContent(String reputContent) {
		this.reputContent = reputContent;
	}

	public int getChatId() {
		return chatId;
	}

	public void setChatId(int chatId) {
		this.chatId = chatId;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public int getReputant() {
		return reputant;
	}

	public void setReputant(int reputant) {
		this.reputant = reputant;
	}

	public int getVictim() {
		return victim;
	}

	public void setVictim(int victim) {
		this.victim = victim;
	}

	@Override
	public String toString() {
		return "Reputation [reputId=" + reputId + ", reputDate=" + reputDate + ", reputType=" + reputType
				+ ", reputContent=" + reputContent + ", chatId=" + chatId + ", memberId=" + memberId + ", reputant="
				+ reputant + ", victim=" + victim + "]";
	}
	

}
