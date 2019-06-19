package com.kh.ti.travel.model.vo;

public class Place implements java.io.Serializable{

	private int plcId;
	private int cityId;
	private String plcName;
	private String plcAddress;
	private int plcTypeId;
	private String plcEngName;
	private String plcLat;
	private String plcLng;
	private int plcCount;
	
	public Place() {}

	public Place(int plcId, int cityId, String plcName, String plcAddress, int plcTypeId, String plcEngName,
			String plcLat, String plcLng, int plcCount) {
		super();
		this.plcId = plcId;
		this.cityId = cityId;
		this.plcName = plcName;
		this.plcAddress = plcAddress;
		this.plcTypeId = plcTypeId;
		this.plcEngName = plcEngName;
		this.plcLat = plcLat;
		this.plcLng = plcLng;
		this.plcCount = plcCount;
	}

	public int getPlcId() {
		return plcId;
	}

	public void setPlcId(int plcId) {
		this.plcId = plcId;
	}

	public int getCityId() {
		return cityId;
	}

	public void setCityId(int cityId) {
		this.cityId = cityId;
	}

	public String getPlcName() {
		return plcName;
	}

	public void setPlcName(String plcName) {
		this.plcName = plcName;
	}

	public String getPlcAddress() {
		return plcAddress;
	}

	public void setPlcAddress(String plcAddress) {
		this.plcAddress = plcAddress;
	}

	public int getPlcTypeId() {
		return plcTypeId;
	}

	public void setPlcTypeId(int plcTypeId) {
		this.plcTypeId = plcTypeId;
	}

	public String getPlcEngName() {
		return plcEngName;
	}

	public void setPlcEngName(String plcEngName) {
		this.plcEngName = plcEngName;
	}

	public String getPlcLat() {
		return plcLat;
	}

	public void setPlcLat(String plcLat) {
		this.plcLat = plcLat;
	}

	public String getPlcLng() {
		return plcLng;
	}

	public void setPlcLng(String plcLng) {
		this.plcLng = plcLng;
	}

	public int getPlcCount() {
		return plcCount;
	}

	public void setPlcCount(int plcCount) {
		this.plcCount = plcCount;
	}

	@Override
	public String toString() {
		return "Place [plcId=" + plcId + ", cityId=" + cityId + ", plcName=" + plcName + ", plcAddress=" + plcAddress
				+ ", plcTypeId=" + plcTypeId + ", plcEngName=" + plcEngName + ", plcLat=" + plcLat + ", plcLng="
				+ plcLng + ", plcCount=" + plcCount + "]";
	}
	
	
	
}
