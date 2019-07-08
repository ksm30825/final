package com.kh.ti.travelRequest.model.vo;

import java.io.Serializable;
import java.util.ArrayList;

//설계일자 장소 - 선우
public class PlanPlace implements Serializable {
	private int PplaceId;	//장소코드
	private String PplaceTitle;		//장소명
	private String PplaceAddress;	//주소
	private String PplaceLat;	//위도
	private String PplaceLng;	//경도
	private int PdayId;		//설계일자 코드
	private int PplanId;
	private int count = 1;
	
	public PlanPlace() {}

	public PlanPlace(int pplaceId, String pplaceTitle, String pplaceAddress, String pplaceLat, String pplaceLng,
			int pdayId, int pplanId, int count) {
		super();
		this.PplaceId = pplaceId;
		this.PplaceTitle = pplaceTitle;
		this.PplaceAddress = pplaceAddress;
		this.PplaceLat = pplaceLat;
		this.PplaceLng = pplaceLng;
		this.PdayId = pdayId;
		this.PplanId = pplanId;
		this.count = count;
	}

	public PlanPlace(String pplaceTitle, String pplaceAddress, String pplaceLat, String pplaceLng) {
		super();
		this.PplaceTitle = pplaceTitle;
		this.PplaceAddress = pplaceAddress;
		this.PplaceLat = pplaceLat;
		this.PplaceLng = pplaceLng;
	}


	public PlanPlace(String pplaceTitle, String pplaceAddress, String pplaceLat, String pplaceLng,
			int pdayId) {
		super();
		PplaceTitle = pplaceTitle;
		PplaceAddress = pplaceAddress;
		PplaceLat = pplaceLat;
		PplaceLng = pplaceLng;
		PdayId = pdayId;
	}

	public int getPplaceId() {
		return PplaceId;
	}

	public void setPplaceId(int pplaceId) {
		PplaceId = pplaceId;
	}

	public String getPplaceTitle() {
		return PplaceTitle;
	}

	public void setPplaceTitle(String pplaceTitle) {
		PplaceTitle = pplaceTitle;
	}

	public String getPplaceAddress() {
		return PplaceAddress;
	}

	public void setPplaceAddress(String pplaceAddress) {
		PplaceAddress = pplaceAddress;
	}

	public String getPplaceLat() {
		return PplaceLat;
	}

	public void setPplaceLat(String pplaceLat) {
		PplaceLat = pplaceLat;
	}

	public String getPplaceLng() {
		return PplaceLng;
	}

	public void setPplaceLng(String pplaceLng) {
		PplaceLng = pplaceLng;
	}

	public int getPdayId() {
		return PdayId;
	}

	public void setPdayId(int pdayId) {
		PdayId = pdayId;
	}

	public int getPplanId() {
		return PplanId;
	}

	public void setPplanId(int pplanId) {
		PplanId = pplanId;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "PlanPlace [PplaceId=" + PplaceId + ", PplaceTitle=" + PplaceTitle + ", PplaceAddress=" + PplaceAddress
				+ ", PplaceLat=" + PplaceLat + ", PplaceLng=" + PplaceLng + ", PdayId=" + PdayId + ", PplanId="
				+ PplanId + ", count=" + count + "]";
	}
}
