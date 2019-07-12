package com.kh.ti.spot.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.ti.spot.model.vo.Likey;
import com.kh.ti.spot.model.vo.SpotCityList;
import com.kh.ti.spot.model.vo.SpotFile;
import com.kh.ti.spot.model.vo.SpotList;
import com.kh.ti.spot.model.vo.SpotReviews;
import com.kh.ti.travel.model.vo.City;
import com.kh.ti.travel.model.vo.Country;

public interface SpotService {

	ArrayList<HashMap> selectSpotList(int cityId);

	int insertSpotLikey(Likey likey);

	ArrayList<SpotList> selectMyLikeySpotList(int memberId);

	ArrayList<Country> selectCountryList();

	ArrayList<HashMap> selectCityMap();

	Country selectCountryOneInfo(int cityId);

	ArrayList<SpotFile> selectCityFile(int cityId);

	City selectCityOne(int spotId);

	SpotList selectSpotListOne(int spotId);

	int insertSpotReviews(SpotReviews spotReviews);

	ArrayList<HashMap> selectSpotReviews(int spotId);

	ArrayList<SpotFile> selectSpotFile(int spotId);


}
