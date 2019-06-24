package com.kh.ti.travelBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.ti.travelBoard.model.vo.PageInfo;
import com.kh.ti.travelBoard.model.vo.TravelBoard;

public interface TravelBoardService {

	int getListCount();
	
	ArrayList<TravelBoard> travelList(PageInfo pi);


}
