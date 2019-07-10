package com.kh.ti.penalty.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;

public class Penalty implements Serializable{
	private int listId;		//신고번호
	private String penaltyContent;		//신고내용
	private Date penaltyDate;		//신고일
	private String penalityResult;		//신고결과
	private Date processDate;		//처리일
	private int penaltyId;		//신고종류코드
	private int complainantId;		//신고인 번호
	private String list;			//구분
	private String listType;		//구분번호
	private String rejectionReson;		//거절사유
	private int trvId;				//여행일정번호
	private int reviewId;			//여행리뷰코드
	private int memberId;			//회원번호
	private int planId;				//설계번호
	private int requestId;			//의뢰번호
	private int memberPenalty;		//벌점
	private ArrayList<PenaltyAttachment> attachmentFileList;	//사진들
	
	public Penalty() {}

	public Penalty(int listId, String penaltyContent, Date penaltyDate, String penalityResult, Date processDate,
			int penaltyId, int complainantId, String list, String listType, String rejectionReson, int trvId,
			int reviewId, int memberId, int planId, int requestId, int memberPenalty,
			ArrayList<PenaltyAttachment> attachmentFileList) {
		super();
		this.listId = listId;
		this.penaltyContent = penaltyContent;
		this.penaltyDate = penaltyDate;
		this.penalityResult = penalityResult;
		this.processDate = processDate;
		this.penaltyId = penaltyId;
		this.complainantId = complainantId;
		this.list = list;
		this.listType = listType;
		this.rejectionReson = rejectionReson;
		this.trvId = trvId;
		this.reviewId = reviewId;
		this.memberId = memberId;
		this.planId = planId;
		this.requestId = requestId;
		this.memberPenalty = memberPenalty;
		this.attachmentFileList = attachmentFileList;
	}

	public int getListId() {
		return listId;
	}

	public void setListId(int listId) {
		this.listId = listId;
	}

	public String getPenaltyContent() {
		return penaltyContent;
	}

	public void setPenaltyContent(String penaltyContent) {
		this.penaltyContent = penaltyContent;
	}

	public Date getPenaltyDate() {
		return penaltyDate;
	}

	public void setPenaltyDate(Date penaltyDate) {
		this.penaltyDate = penaltyDate;
	}

	public String getPenalityResult() {
		return penalityResult;
	}

	public void setPenalityResult(String penalityResult) {
		this.penalityResult = penalityResult;
	}

	public Date getProcessDate() {
		return processDate;
	}

	public void setProcessDate(Date processDate) {
		this.processDate = processDate;
	}

	public int getPenaltyId() {
		return penaltyId;
	}

	public void setPenaltyId(int penaltyId) {
		this.penaltyId = penaltyId;
	}

	public int getComplainantId() {
		return complainantId;
	}

	public void setComplainantId(int complainantId) {
		this.complainantId = complainantId;
	}

	public String getList() {
		return list;
	}

	public void setList(String list) {
		this.list = list;
	}

	public String getListType() {
		return listType;
	}

	public void setListType(String listType) {
		this.listType = listType;
	}

	public String getRejectionReson() {
		return rejectionReson;
	}

	public void setRejectionReson(String rejectionReson) {
		this.rejectionReson = rejectionReson;
	}

	public int getTrvId() {
		return trvId;
	}

	public void setTrvId(int trvId) {
		this.trvId = trvId;
	}

	public int getReviewId() {
		return reviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public int getPlanId() {
		return planId;
	}

	public void setPlanId(int planId) {
		this.planId = planId;
	}

	public int getRequestId() {
		return requestId;
	}

	public void setRequestId(int requestId) {
		this.requestId = requestId;
	}

	public int getMemberPenalty() {
		return memberPenalty;
	}

	public void setMemberPenalty(int memberPenalty) {
		this.memberPenalty = memberPenalty;
	}

	public ArrayList<PenaltyAttachment> getAttachmentFileList() {
		return attachmentFileList;
	}

	public void setAttachmentFileList(ArrayList<PenaltyAttachment> attachmentFileList) {
		this.attachmentFileList = attachmentFileList;
	}

	@Override
	public String toString() {
		return "Penalty [listId=" + listId + ", penaltyContent=" + penaltyContent + ", penaltyDate=" + penaltyDate
				+ ", penalityResult=" + penalityResult + ", processDate=" + processDate + ", penaltyId=" + penaltyId
				+ ", complainantId=" + complainantId + ", list=" + list + ", listType=" + listType + ", rejectionReson="
				+ rejectionReson + ", trvId=" + trvId + ", reviewId=" + reviewId + ", memberId=" + memberId
				+ ", planId=" + planId + ", requestId=" + requestId + ", memberPenalty=" + memberPenalty
				+ ", attachmentFileList=" + attachmentFileList + "]";
	}
}
