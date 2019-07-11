package com.kh.ti.spot.model.vo;

import java.io.Serializable;
import java.util.ArrayList;

import com.kh.ti.travel.model.vo.City;
import com.kh.ti.travel.model.vo.Country;

public class SpotCityList implements Serializable{
	
	private int CityListId;
	private ArrayList<City> cityList;
	private ArrayList<Country> countryList;
	private ArrayList<SpotFile> sFileList;
	
	public SpotCityList() {
		// TODO Auto-generated constructor stub
	}

	public SpotCityList(int cityListId, ArrayList<City> cityList, ArrayList<Country> countryList,
			ArrayList<SpotFile> sFileList) {
		super();
		CityListId = cityListId;
		this.cityList = cityList;
		this.countryList = countryList;
		this.sFileList = sFileList;
	}

	@Override
	public String toString() {
		return "SpotCityList [CityListId=" + CityListId + ", cityList=" + cityList + ", countryList=" + countryList
				+ ", sFileList=" + sFileList + "]";
	}

	public int getCityListId() {
		return CityListId;
	}

	public void setCityListId(int cityListId) {
		CityListId = cityListId;
	}

	public ArrayList<City> getCityList() {
		return cityList;
	}

	public void setCityList(ArrayList<City> cityList) {
		this.cityList = cityList;
	}

	public ArrayList<Country> getCountryList() {
		return countryList;
	}

	public void setCountryList(ArrayList<Country> countryList) {
		this.countryList = countryList;
	}

	public ArrayList<SpotFile> getsFileList() {
		return sFileList;
	}

	public void setsFileList(ArrayList<SpotFile> sFileList) {
		this.sFileList = sFileList;
	}
	
	

}
