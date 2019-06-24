package com.kh.ti.travelBoard.model.service;

import java.util.ArrayList;

import com.kh.ti.common.PageInfo;
import com.kh.ti.travelBoard.model.vo.TravelBoard;

public interface TravelBoardService {

	int getListCount();
	
	ArrayList<TravelBoard> travelList(PageInfo pi);


}
