package com.kh.ti.Chatting.model.vo;

public class ChatManagement implements java.io.Serializable{

	private int cmId;
	private int cmLevel;
	private int memberId;
	private int chatId;
	private int cmStatus;
	
	public ChatManagement() {}
	
	public ChatManagement(int cmId, int cmLevel, int memberId, int chatId, int cmStatus) {
		super();
		this.cmId = cmId;
		this.cmLevel = cmLevel;
		this.memberId = memberId;
		this.chatId = chatId;
		this.cmStatus = cmStatus;
	}


	public int getCmId() {
		return cmId;
	}
	
	public void setCmId(int cmId) {
		this.cmId = cmId;
	}
	
	public int getCmLevel() {
		return cmLevel;
	}
	
	public void setCmLevel(int cmLevel) {
		this.cmLevel = cmLevel;
	}
	
	public int getMemberId() {
		return memberId;
	}
	
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	
	public int getChatId() {
		return chatId;
	}
	
	public void setChatId(int chatId) {
		this.chatId = chatId;
	}
	
	public int getCmStatus() {
		return cmStatus;
	}
	
	public void setCmStatus(int cmStatus) {
		this.cmStatus = cmStatus;
	}
	
	@Override
	public String toString() {
		return "ChatManagement [cmId=" + cmId + ", cmLevel=" + cmLevel + ", memberId=" + memberId + ", chatId=" + chatId
				+ ", cmStatus=" + cmStatus + "]";
	}
	
	
	
	
}
