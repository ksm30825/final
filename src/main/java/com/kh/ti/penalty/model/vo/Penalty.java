package com.kh.ti.penalty.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;

public class Penalty implements Serializable{
	private int listId;		//신고번호
	private String penalityContent;		//신고내용
	private Date penalityDate;		//신고일
	private String penalityResult;		//신고결과
	private Date processDate;		//처리일
	private int penalityId;		//신고종류코드
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
	private ArrayList<PenalityAttachment> attachmentFileList;	//사진들
	
	public Penalty() {}

	public Penalty(int listId, String penalityContent, Date penalityDate, String penalityResult, Date processDate,
			int penalityId, int complainantId, String list, String listType, String rejectionReson, int trvId,
			int reviewId, int memberId, int planId, int requestId, int memberPenalty,
			ArrayList<PenalityAttachment> attachmentFileList) {
		super();
		this.listId = listId;
		this.penalityContent = penalityContent;
		this.penalityDate = penalityDate;
		this.penalityResult = penalityResult;
		this.processDate = processDate;
		this.penalityId = penalityId;
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

	public String getPenalityContent() {
		return penalityContent;
	}

	public void setPenalityContent(String penalityContent) {
		this.penalityContent = penalityContent;
	}

	public Date getPenalityDate() {
		return penalityDate;
	}

	public void setPenalityDate(Date penalityDate) {
		this.penalityDate = penalityDate;
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

	public int getPenalityId() {
		return penalityId;
	}

	public void setPenalityId(int penalityId) {
		this.penalityId = penalityId;
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

	public ArrayList<PenalityAttachment> getAttachmentFileList() {
		return attachmentFileList;
	}

	public void setAttachmentFileList(ArrayList<PenalityAttachment> attachmentFileList) {
		this.attachmentFileList = attachmentFileList;
	}

	@Override
	public String toString() {
		return "Penalty [listId=" + listId + ", penalityContent=" + penalityContent + ", penalityDate=" + penalityDate
				+ ", penalityResult=" + penalityResult + ", processDate=" + processDate + ", penalityId=" + penalityId
				+ ", complainantId=" + complainantId + ", list=" + list + ", listType=" + listType + ", rejectionReson="
				+ rejectionReson + ", trvId=" + trvId + ", reviewId=" + reviewId + ", memberId=" + memberId
				+ ", planId=" + planId + ", requestId=" + requestId + ", memberPenalty=" + memberPenalty
				+ ", attachmentFileList=" + attachmentFileList + "]";
	}
}
