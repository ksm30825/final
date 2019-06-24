package com.kh.ti.travel.model.vo;

public class TrvCity {
	
	private int cityId;
	private int trvId;
	
	public TrvCity() {}

	public TrvCity(int cityId, int trvId) {
		super();
		this.cityId = cityId;
		this.trvId = trvId;
	}

	public int getCityId() {
		return cityId;
	}

	public void setCityId(int cityId) {
		this.cityId = cityId;
	}

	public int getTrvId() {
		return trvId;
	}

	public void setTrvId(int trvId) {
		this.trvId = trvId;
	}

	@Override
	public String toString() {
		return "TrvCity [cityId=" + cityId + ", trvId=" + trvId + "]";
	}
	
	

}
