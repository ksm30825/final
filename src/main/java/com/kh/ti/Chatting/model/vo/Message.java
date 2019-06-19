package com.kh.ti.Chatting.model.vo;

import java.sql.Date;

public class Message implements java.io.Serializable {
	
	private int msgId;
	private Date msgTime;
	private String msgContent;
	private int ChatId;
	private int MemberId;
	
	public Message() {}

	public Message(int msgId, Date msgTime, String msgContent, int chatId, int memberId) {
		super();
		this.msgId = msgId;
		this.msgTime = msgTime;
		this.msgContent = msgContent;
		ChatId = chatId;
		MemberId = memberId;
	}

	public int getMsgId() {
		return msgId;
	}

	public void setMsgId(int msgId) {
		this.msgId = msgId;
	}

	public Date getMsgTime() {
		return msgTime;
	}

	public void setMsgTime(Date msgTime) {
		this.msgTime = msgTime;
	}

	public String getMsgContent() {
		return msgContent;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	public int getChatId() {
		return ChatId;
	}

	public void setChatId(int chatId) {
		ChatId = chatId;
	}

	public int getMemberId() {
		return MemberId;
	}

	public void setMemberId(int memberId) {
		MemberId = memberId;
	}

	@Override
	public String toString() {
		return "Message [msgId=" + msgId + ", msgTime=" + msgTime + ", msgContent=" + msgContent + ", ChatId=" + ChatId
				+ ", MemberId=" + MemberId + "]";
	}
	
	
	

}
