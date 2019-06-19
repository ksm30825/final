package com.kh.ti.spot.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Reviews implements Serializable{
	private int reviewId;
	private String review;
	private Date reviewDate;
	private Date morifyDate;
	private Date delDate;
	private int memberId;
	private String memberName;
	private String memberEmail;
	private int spotId;
	private int grade;
	
	public Reviews() {
		// TODO Auto-generated constructor stub
	}

	public Reviews(int reviewId, String review, Date reviewDate, Date morifyDate, Date delDate, int memberId,
			String memberName, String memberEmail, int spotId, int grade) {
		super();
		this.reviewId = reviewId;
		this.review = review;
		this.reviewDate = reviewDate;
		this.morifyDate = morifyDate;
		this.delDate = delDate;
		this.memberId = memberId;
		this.memberName = memberName;
		this.memberEmail = memberEmail;
		this.spotId = spotId;
		this.grade = grade;
	}

	public int getReviewId() {
		return reviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	public Date getMorifyDate() {
		return morifyDate;
	}

	public void setMorifyDate(Date morifyDate) {
		this.morifyDate = morifyDate;
	}

	public Date getDelDate() {
		return delDate;
	}

	public void setDelDate(Date delDate) {
		this.delDate = delDate;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public int getSpotId() {
		return spotId;
	}

	public void setSpotId(int spotId) {
		this.spotId = spotId;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	@Override
	public String toString() {
		return "Reviews [reviewId=" + reviewId + ", review=" + review + ", reviewDate=" + reviewDate + ", morifyDate="
				+ morifyDate + ", delDate=" + delDate + ", memberId=" + memberId + ", memberName=" + memberName
				+ ", memberEmail=" + memberEmail + ", spotId=" + spotId + ", grade=" + grade + "]";
	}

	
}
