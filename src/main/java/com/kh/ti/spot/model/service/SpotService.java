package com.kh.ti.spot.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.ti.spot.model.vo.SpotList;

public interface SpotService {

	ArrayList<SpotList> selectCityNames();

	ArrayList<SpotList> selectCityList();

}
