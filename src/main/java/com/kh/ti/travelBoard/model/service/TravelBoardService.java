package com.kh.ti.travelBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.ti.common.PageInfo;
import com.kh.ti.travelBoard.model.vo.Likey;
import com.kh.ti.travelBoard.model.vo.TravelBoard;
import com.kh.ti.travelBoard.model.vo.TrvDaySchedule;

public interface TravelBoardService {

	int getListCount(TravelBoard tb);
	
	HashMap travelList(PageInfo pi, TravelBoard tb);

	HashMap travelDetailForm(TravelBoard tb);

	int travelDelete(int trvId);

	int travelLikeyInsert(Likey likey);

	int travelLikeyDelete(Likey likey);

	TrvDaySchedule selectTravelDetailDays(TrvDaySchedule tds);


}
