package com.kh.ti.spot.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.ti.spot.model.vo.Likey;
import com.kh.ti.spot.model.vo.SpotCityList;
import com.kh.ti.spot.model.vo.SpotList;

public interface SpotService {

	ArrayList<SpotCityList> selectCityNames();

	ArrayList<SpotCityList> selectCityList();

	ArrayList<SpotList> selectSpotList(int cityId);

	int insertSpotLikey(Likey likey);

	ArrayList<SpotList> selectMyLikeySpotList(int memberId);

}
