package com.kh.ti.Chatting.model.vo;

import java.sql.Date;

public class Chatting implements java.io.Serializable{
	
	private int chatId;
	private String chatTitle;
	private String trvPlace;
	private Date trvStart;
	private Date trvEnd;
	private int Capacity;
	private String chatStatus;
	
	public Chatting() {}
	
	public Chatting(int chatId, String chatTitle, String trvPlace, Date trvStart, Date trvEnd, int capacity,
			String chatStatus) {
		super();
		this.chatId = chatId;
		this.chatTitle = chatTitle;
		this.trvPlace = trvPlace;
		this.trvStart = trvStart;
		this.trvEnd = trvEnd;
		Capacity = capacity;
		this.chatStatus = chatStatus;
	}

	public int getChatId() {
		return chatId;
	}
	public void setChatId(int chatId) {
		this.chatId = chatId;
	}
	public String getChatTitle() {
		return chatTitle;
	}
	public void setChatTitle(String chatTitle) {
		this.chatTitle = chatTitle;
	}
	public String getTrvPlace() {
		return trvPlace;
	}
	public void setTrvPlace(String trvPlace) {
		this.trvPlace = trvPlace;
	}
	public Date getTrvStart() {
		return trvStart;
	}
	public void setTrvStart(Date trvStart) {
		this.trvStart = trvStart;
	}
	public Date getTrvEnd() {
		return trvEnd;
	}
	public void setTrvEnd(Date trvEnd) {
		this.trvEnd = trvEnd;
	}
	public int getCapacity() {
		return Capacity;
	}
	public void setCapacity(int capacity) {
		Capacity = capacity;
	}
	public String getChatStatus() {
		return chatStatus;
	}
	public void setChatStatus(String chatStatus) {
		this.chatStatus = chatStatus;
	}

	@Override
	public String toString() {
		return "Chatting [chatId=" + chatId + ", chatTitle=" + chatTitle + ", trvPlace=" + trvPlace + ", trvStart="
				+ trvStart + ", trvEnd=" + trvEnd + ", Capacity=" + Capacity + ", chatStatus=" + chatStatus + "]";
	}
	
	

}
