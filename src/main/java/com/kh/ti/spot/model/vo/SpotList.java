package com.kh.ti.spot.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class SpotList implements Serializable{
	private int spotId;
	private String spotNameKo;
	private String spotNameEn;
	private String spotContent;
	private String spotAddress;
	private String openingHours;
	private String spotPhone;
	private String webAddress;
	private Date enrollDate;
	private Date modifyDate;
	private Date delDate;
	private Date recoveryDate;
	private int spotCount;
	private int cityId;
	private String cityNameKo;
	private String cityNameEn;
	private String spotStatus;
	private String countryNameKo;
	private String countryNameEn;
	private int plcTypeId;
	
	public SpotList() {
		// TODO Auto-generated constructor stub
	}

	public SpotList(int spotId, String spotNameKo, String spotNameEn, String spotContent, String spotAddress,
			String openingHours, String spotPhone, String webAddress, Date enrollDate, Date modifyDate, Date delDate,
			Date recoveryDate, int spotCount, int cityId, String cityNameKo, String cityNameEn, String spotStatus,
			String countryNameKo, String countryNameEn, int plcTypeId) {
		super();
		this.spotId = spotId;
		this.spotNameKo = spotNameKo;
		this.spotNameEn = spotNameEn;
		this.spotContent = spotContent;
		this.spotAddress = spotAddress;
		this.openingHours = openingHours;
		this.spotPhone = spotPhone;
		this.webAddress = webAddress;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.delDate = delDate;
		this.recoveryDate = recoveryDate;
		this.spotCount = spotCount;
		this.cityId = cityId;
		this.cityNameKo = cityNameKo;
		this.cityNameEn = cityNameEn;
		this.spotStatus = spotStatus;
		this.countryNameKo = countryNameKo;
		this.countryNameEn = countryNameEn;
		this.plcTypeId = plcTypeId;
	}

	public int getSpotId() {
		return spotId;
	}

	public void setSpotId(int spotId) {
		this.spotId = spotId;
	}

	public String getSpotNameKo() {
		return spotNameKo;
	}

	public void setSpotNameKo(String spotNameKo) {
		this.spotNameKo = spotNameKo;
	}

	public String getSpotNameEn() {
		return spotNameEn;
	}

	public void setSpotNameEn(String spotNameEn) {
		this.spotNameEn = spotNameEn;
	}

	public String getSpotContent() {
		return spotContent;
	}

	public void setSpotContent(String spotContent) {
		this.spotContent = spotContent;
	}

	public String getSpotAddress() {
		return spotAddress;
	}

	public void setSpotAddress(String spotAddress) {
		this.spotAddress = spotAddress;
	}

	public String getOpeningHours() {
		return openingHours;
	}

	public void setOpeningHours(String openingHours) {
		this.openingHours = openingHours;
	}

	public String getSpotPhone() {
		return spotPhone;
	}

	public void setSpotPhone(String spotPhone) {
		this.spotPhone = spotPhone;
	}

	public String getWebAddress() {
		return webAddress;
	}

	public void setWebAddress(String webAddress) {
		this.webAddress = webAddress;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public Date getDelDate() {
		return delDate;
	}

	public void setDelDate(Date delDate) {
		this.delDate = delDate;
	}

	public Date getRecoveryDate() {
		return recoveryDate;
	}

	public void setRecoveryDate(Date recoveryDate) {
		this.recoveryDate = recoveryDate;
	}

	public int getSpotCount() {
		return spotCount;
	}

	public void setSpotCount(int spotCount) {
		this.spotCount = spotCount;
	}

	public int getCityId() {
		return cityId;
	}

	public void setCityId(int cityId) {
		this.cityId = cityId;
	}

	public String getCityNameKo() {
		return cityNameKo;
	}

	public void setCityNameKo(String cityNameKo) {
		this.cityNameKo = cityNameKo;
	}

	public String getCityNameEn() {
		return cityNameEn;
	}

	public void setCityNameEn(String cityNameEn) {
		this.cityNameEn = cityNameEn;
	}

	public String getSpotStatus() {
		return spotStatus;
	}

	public void setSpotStatus(String spotStatus) {
		this.spotStatus = spotStatus;
	}

	public String getCountryNameKo() {
		return countryNameKo;
	}

	public void setCountryNameKo(String countryNameKo) {
		this.countryNameKo = countryNameKo;
	}

	public String getCountryNameEn() {
		return countryNameEn;
	}

	public void setCountryNameEn(String countryNameEn) {
		this.countryNameEn = countryNameEn;
	}

	public int getPlcTypeId() {
		return plcTypeId;
	}

	public void setPlcTypeId(int plcTypeId) {
		this.plcTypeId = plcTypeId;
	}

	@Override
	public String toString() {
		return "SpotList [spotId=" + spotId + ", spotNameKo=" + spotNameKo + ", spotNameEn=" + spotNameEn
				+ ", spotContent=" + spotContent + ", spotAddress=" + spotAddress + ", openingHours=" + openingHours
				+ ", spotPhone=" + spotPhone + ", webAddress=" + webAddress + ", enrollDate=" + enrollDate
				+ ", modifyDate=" + modifyDate + ", delDate=" + delDate + ", recoveryDate=" + recoveryDate
				+ ", spotCount=" + spotCount + ", cityId=" + cityId + ", cityNameKo=" + cityNameKo + ", cityNameEn="
				+ cityNameEn + ", spotStatus=" + spotStatus + ", countryNameKo=" + countryNameKo + ", countryNameEn="
				+ countryNameEn + ", plcTypeId=" + plcTypeId + "]";
	}
	
	
}
