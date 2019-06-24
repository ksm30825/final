package com.kh.ti.travelRequest.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class TravelRequest implements Serializable{
	private int requestId;	//의뢰번호
	private String requestTitle;	//제목
	private String requestContent;	//내용
	private Date endDate;	//의뢰마감일
	private int requestPrice;	//의뢰가격
	private int memberId;	//회원코드
	private String chooseStatus;	//채택상태
	private Date chooseDate;	//채택날짜
	private int trvCost;	//예산
	
	public TravelRequest() {}

	public TravelRequest(int requestId, String requestTitle, String requestContent, Date endDate, int requestPrice,
			int memberId, String chooseStatus, Date chooseDate, int trvCost) {
		super();
		this.requestId = requestId;
		this.requestTitle = requestTitle;
		this.requestContent = requestContent;
		this.endDate = endDate;
		this.requestPrice = requestPrice;
		this.memberId = memberId;
		this.chooseStatus = chooseStatus;
		this.chooseDate = chooseDate;
		this.trvCost = trvCost;
	}

	public int getRequestId() {
		return requestId;
	}

	public void setRequestId(int requestId) {
		this.requestId = requestId;
	}

	public String getRequestTitle() {
		return requestTitle;
	}

	public void setRequestTitle(String requestTitle) {
		this.requestTitle = requestTitle;
	}

	public String getRequestContent() {
		return requestContent;
	}

	public void setRequestContent(String requestContent) {
		this.requestContent = requestContent;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public int getRequestPrice() {
		return requestPrice;
	}

	public void setRequestPrice(int requestPrice) {
		this.requestPrice = requestPrice;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public String getChooseStatus() {
		return chooseStatus;
	}

	public void setChooseStatus(String chooseStatus) {
		this.chooseStatus = chooseStatus;
	}

	public Date getChooseDate() {
		return chooseDate;
	}

	public void setChooseDate(Date chooseDate) {
		this.chooseDate = chooseDate;
	}

	public int getTrvCost() {
		return trvCost;
	}

	public void setTrvCost(int trvCost) {
		this.trvCost = trvCost;
	}

	@Override
	public String toString() {
		return "TravelRequest [requestId=" + requestId + ", requestTitle=" + requestTitle + ", requestContent="
				+ requestContent + ", endDate=" + endDate + ", requestPrice=" + requestPrice + ", memberId=" + memberId
				+ ", chooseStatus=" + chooseStatus + ", chooseDate=" + chooseDate + ", trvCost=" + trvCost + "]";
	}
}
