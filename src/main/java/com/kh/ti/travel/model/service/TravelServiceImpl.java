package com.kh.ti.travel.model.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.kh.ti.member.model.vo.Member;
import com.kh.ti.travel.model.dao.TravelDao;
import com.kh.ti.travel.model.vo.City;
import com.kh.ti.travel.model.vo.Country;
import com.kh.ti.travel.model.vo.SchFile;
import com.kh.ti.travel.model.vo.Tag;
import com.kh.ti.travel.model.vo.Travel;
import com.kh.ti.travel.model.vo.TrvCity;
import com.kh.ti.travel.model.vo.TrvCost;
import com.kh.ti.travel.model.vo.TrvDay;
import com.kh.ti.travel.model.vo.TrvSchedule;
import com.kh.ti.travel.model.vo.TrvTag;

@Service
public class TravelServiceImpl implements TravelService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private TravelDao td;
	
	
	
	
//------------travel--------------------------------------------------------------------------
	@Override
	public ArrayList<Travel> selectTrvList(int memberId) {
		ArrayList<Travel> trvList = td.selectTrvList(sqlSession, memberId);
		for(int i = 0; i < trvList.size(); i++) {
			int trvId = trvList.get(i).getTrvId();
			ArrayList<TrvCity> trvCityList = td.selectTrvCityList(sqlSession, trvId);
			trvList.get(i).setTrvCityList(trvCityList);
		}
		return trvList;
	}
	
	@Override
	public int insertTravel(Travel trv) {
		int result = 0;
		int result1 = td.insertTravel(sqlSession, trv);
		int result2 = 0;
		int result3 = 0;
		int trvId = td.selectTrvId(sqlSession);
		int[] trvCities = trv.getTrvCities();
		
		for(int i = 0; i < trvCities.length; i++) { 
			int cityId = trvCities[i];
			City city = td.selectCity(sqlSession, cityId); 
			TrvCity trvCity = new TrvCity(); 
			trvCity.setCityId(city.getCityId());
			trvCity.setTrvId(trvId);
			result2 += td.insertTrvCity(sqlSession, trvCity); 
		}
		
		Date startDate = trv.getStartDate();
		Date endDate = trv.getEndDate();
		int days = (int)((endDate.getTime() - startDate.getTime()) / (1000 * 60 * 60 * 24)) + 1;
		
		for(int i = 0; i < days; i++) { 
			TrvDay trvDay = new TrvDay();
			trvDay.setTrvId(trvId); 
			trvDay.setDayNumber(i + 1); 
			Date date = new Date(startDate.getTime() + (1000 * 60 * 60 * 24) * i);
			trvDay.setDayDate(date); 
			result3 += td.insertTrvDay(sqlSession, trvDay); 
		}
		
		if(result1 > 0 && result2 == trvCities.length && result3 == days) {
			result = trvId;
		}
		return result;
	}
	
	@Override
	public HashMap selectTravel(int trvId) {
		HashMap trvMap = new HashMap();
		Travel trv = td.selectTravel(sqlSession, trvId);
		ArrayList<TrvCity> trvCityList = td.selectTrvCityList(sqlSession, trvId);
		ArrayList<TrvDay> trvDayList = td.selectTrvDayList(sqlSession, trvId);
		ArrayList<Tag> allTagList = td.selectTagList(sqlSession);
		ArrayList<TrvTag> trvTagList = td.selectTrvTagList(sqlSession, trvId);
		
		for(int i = 0; i < trvDayList.size(); i++) {
			int dayId = trvDayList.get(i).getDayId();
			ArrayList<TrvSchedule> schList = td.selectSchList(sqlSession, dayId);
			for(int j = 0; j < schList.size(); j++) {
				int schId = schList.get(j).getSchId();
				TrvCost cost = td.selectTrvCost(sqlSession, schId);
				schList.get(j).setTrvCost(cost);
			}
			trvDayList.get(i).setSchList(schList);
		}
		trvMap.put("trv", trv);
		trvMap.put("trvCityList", trvCityList);
		trvMap.put("trvDayList", trvDayList);
		trvMap.put("allTagList", allTagList);
		trvMap.put("trvTagList", trvTagList);
		return trvMap;
	}

	@Override
	public ArrayList<Country> selectCountryList() {
		return td.selectCountryList(sqlSession);
	}

	@Override
	public ArrayList<City> selectCityList(int countryId) {
		return td.selectCityList(sqlSession, countryId);
	}


	@Override
	public int updateTravel(Travel trv) {
		int result = td.updateTravel(sqlSession, trv);
		int[] trvCities = trv.getTrvCities();
		int duplicated = 0;
		ArrayList<TrvCity> trvCityList = td.selectTrvCityList(sqlSession, trv.getTrvId());
		for(int j = 0; j < trvCityList.size(); j++) {
			for(int i = 0; i < trvCities.length; i++) { 
				if(trvCityList.get(j).getCityId() == trvCities[i]) {
					duplicated++;
				}
			}
			if(duplicated == 0) {
				td.deleteTrvCity(sqlSession, trvCityList.get(j));
			}
			duplicated = 0;
		}
		duplicated = 0;
		for(int i = 0; i < trvCities.length; i++) { 
			for(int j = 0; j < trvCityList.size(); j++) {
				if(trvCities[i] == trvCityList.get(j).getCityId()) {
					duplicated++;
				};
			}
			if(duplicated == 0) {
				TrvCity trvCity = new TrvCity();
				trvCity.setTrvId(trv.getTrvId());
				trvCity.setCityId(trvCities[i]);
				td.insertTrvCity(sqlSession, trvCity);
			}
			duplicated = 0;
		}
		
		ArrayList<TrvDay> trvDayList = td.selectTrvDayList(sqlSession, trv.getTrvId());
		Date startDate = trv.getStartDate();
		Date endDate = trv.getEndDate();
		int days = (int)((endDate.getTime() - startDate.getTime()) / (1000 * 60 * 60 * 24)) + 1;
		
		if(trvDayList.get(0).getDayDate() != startDate || trvDayList.get(trvDayList.size() - 1).getDayDate() != endDate) {
			if(trvDayList.size() > days) {
				for(int i = 0; i < trvDayList.size(); i++) {
					if(i < days) {
						TrvDay trvDay = new TrvDay();
						Date date = new Date(startDate.getTime() + (1000 * 60 * 60 * 24) * i);
						trvDay.setTrvId(trv.getTrvId()); 
						trvDay.setDayNumber(i + 1);
						trvDay.setDayDate(date);
						td.updateTrvDay(sqlSession, trvDay);
					}else {
						td.deleteTrvDay(sqlSession, trvDayList.get(i));
					}
				}
			}else if (trvDayList.size() < days) {
				for(int i = 0; i < days; i++) {
					if(i < trvDayList.size()) {
						TrvDay trvDay = new TrvDay();
						Date date = new Date(startDate.getTime() + (1000 * 60 * 60 * 24) * i);
						trvDay.setTrvId(trv.getTrvId()); 
						trvDay.setDayNumber(i + 1);
						trvDay.setDayDate(date);
						td.updateTrvDay(sqlSession, trvDay);
					}else {
						TrvDay trvDay = new TrvDay();
						Date date = new Date(startDate.getTime() + (1000 * 60 * 60 * 24) * i);
						trvDay.setTrvId(trv.getTrvId()); 
						trvDay.setDayNumber(i + 1);
						trvDay.setDayDate(date);
						td.insertTrvDay(sqlSession, trvDay);
					}
				}
			}
		}
		return result;
	}
	
	@Override
	public int completeTravel(int trvId) {
		return td.completeTravel(sqlSession, trvId);
	}

	@Override
	public int deleteTravel(int trvId) {
		return td.deleteTravel(sqlSession, trvId);
	}
	
	
	
//----------------schedule------------------------------------------------------
	@Override
	public int selectSchNumber(ArrayList<TrvSchedule> schList, String startTime) {
		int difference = 1440;
		int number = 0;
		int hour = Integer.parseInt(startTime.substring(0, startTime.indexOf(":")));
		int minute = Integer.parseInt(startTime.substring(startTime.indexOf(":") + 1));
		
		for(int i = 0; i < schList.size(); i++) {
			String start = schList.get(i).getStartTime();
			System.out.println(start);
			if(start != null) {
				int hr = Integer.parseInt(start.substring(0, startTime.indexOf(":")));
				int min = Integer.parseInt(start.substring(startTime.indexOf(":") + 1));
				int diff = (hour * 60 + minute) - (hr * 60 + min);
				if(diff > 0 && diff < difference) {
					difference = diff;
					number = schList.get(i).getSchNumber() + 1;
				}
			}
		}
		
		if(number == 0) number = 1;
		
		for(int i = 0; i < schList.size(); i++) {
			if(schList.get(i).getSchNumber() >= number) {
				schList.get(i).setSchNumber(schList.get(i).getSchNumber() + 1);
				int result = td.updateSchNumber(sqlSession, schList.get(i));
			}
		}
		
		return number;
	}

	
	
	@Override
	public int insertTrvSchedule(TrvSchedule sch, TrvCost cost) {
		

		int count = td.selectSchCount(sqlSession, sch.getDayId());
		if(sch.getIsTimeset() != null) {
			sch.setIsTimeset("N");
			sch.setSchNumber(count + 1);
		}else {
			sch.setIsTimeset("Y");
			if(count > 0) {
				ArrayList<TrvSchedule> schList = td.selectSchList(sqlSession, sch.getDayId());
				int number = selectSchNumber(schList, sch.getStartTime());
				sch.setSchNumber(number);
				System.out.println("number : " + number);
			}else {
				sch.setSchNumber(count + 1);
			}
		}
		
		
		int result = td.insertTrvSchedule(sqlSession, sch);
		
		int schId = td.selectSchId(sqlSession);
		if(cost.getCostAmount() != 0.0) {
			cost.setSchId(schId);
			int result2 = td.insertTrvCost(sqlSession, cost);
		}
		
		/*
		 * if(plc.getPlcId() != 0) { int result3 = td.insertPlace(sqlSession, plc); int
		 * plcId = td.selectPlcId(sqlSession); sch.setPlcId(plcId); int result4 =
		 * td.updateSchPlcId(sqlSession, sch); }
		 */
		return result;
	}


	@Override
	public int updateTrvSchedule(TrvSchedule sch, TrvCost cost) {
		int result1 = 0;
		int result2 = 0;
		if(sch.getIsTimeset() != null) {
			sch.setIsTimeset("N");
		}else {
			sch.setIsTimeset("Y");
		}
		int dayId = sch.getDayId();
		String startTime = sch.getStartTime();
		System.out.println("startTime : " + startTime);
		
		int count = td.selectSchCount(sqlSession, sch.getDayId());
		TrvSchedule originSch = td.selectTrvSchedule(sqlSession, sch.getSchId());
		System.out.println("originSch : " + originSch);
		int originDayId = originSch.getDayId();
		int originSchNumber = originSch.getSchNumber();
		String originStartTime = originSch.getStartTime();
		System.out.println("originStartTime : " + originStartTime);
		ArrayList<TrvSchedule> schList = td.selectSchList(sqlSession, dayId);
		
		
		
		if(dayId != originDayId) {	//날짜가 변경됐을때
			ArrayList<TrvSchedule> originSchList = td.selectSchList(sqlSession, originDayId);
			
			//기존day의 schList에서 schNumber 재조정
			for(int i = 0; i < originSchList.size(); i++) {
				if(originSchList.get(i).getSchNumber() > originSchNumber) {
					originSchList.get(i).setSchNumber(originSchList.get(i).getSchNumber() - 1);
					td.updateSchNumber(sqlSession, originSchList.get(i));
				}
			}
			
			//새로운 day의 schList에서 들어갈 자리를 찾기
			if(schList != null) {
				
				
				if(sch.getIsTimeset() == "N") { //시간지정안했을 때
					sch.setSchNumber(count + 1);
				
				}else { //시간지정 했을때
					int number = selectSchNumber(schList, startTime);
					sch.setSchNumber(number);
				}
				
			}else {
				sch.setSchNumber(1);
			}
		
			
			
		
		}else {	//날짜가 그대로일때
			
			
			if(startTime.equals(originStartTime)) {  //startTime이 그대로일때
				System.out.println("startTime그대로");
				sch.setSchNumber(originSchNumber);
				
			}else {  //startTime이 변했을 때
				System.out.println("startTime바뀜");
				//schList에서 기존의 sch제거, 나머지 sch의 schNumber재조정
				for(int i = 0; i < schList.size(); i++) {
					if(schList.get(i).getSchNumber() == originSchNumber) {
						schList.remove(i);
						System.out.println("removed");
					}
				}
				for(int i = 0; i < schList.size(); i++) {
					if(schList.get(i).getSchNumber() > originSchNumber) {
						schList.get(i).setSchNumber(schList.get(i).getSchNumber() - 1);
						System.out.println(schList.get(i).getSchNumber());
					}
				}
				
				
				if(sch.getIsTimeset() == "N") {  //시간지정안함
					sch.setSchNumber(count);
					for(int i = 0; i < schList.size(); i++) {
						result1 += td.updateSchNumber(sqlSession, schList.get(i));
					}

				}else {  //시간지정함
					int number = selectSchNumber(schList, startTime);
					sch.setSchNumber(number);
				}
				
				
			}
		}
		
		
		
		
		int result = td.updateTrvSchedule(sqlSession, sch);

		
		TrvCost originCost = td.selectTrvCost(sqlSession, sch.getSchId());
		if(originCost == null) {
			if(cost.getCostAmount() != 0.0) {
				result2 = td.insertTrvCost(sqlSession, cost);
			}
		}else {
			cost.setCostId(originCost.getCostId());
			if(cost.getCostAmount() == 0.0) {
				result2 = td.deleteTrvCost(sqlSession, cost);
			}else {
				result2 = td.updateTrvCost(sqlSession, cost);
			}
		}
		//int result3 = td.insertPlace(sqlSession, plc);
		return result;
	}
	
	@Override
	public int updateSchNumber(int dayId, int[] sch) {
		int result = 0;
		ArrayList<TrvSchedule> schList = td.selectSchList(sqlSession, dayId);
		
		for(int i = 0; i < schList.size(); i++) {
			schList.get(i).setSchNumber(sch[i]);
			result += td.updateSchNumber(sqlSession, schList.get(i));
		}
		
		
		
		ArrayList<TrvSchedule> updList = td.selectSchList(sqlSession, dayId);
		for(int i = 0; i < updList.size(); i++) {
			System.out.println(updList.get(i));
			String startTime = updList.get(i).getStartTime();
			if(i > 0) {
				if(startTime != null) {
					int hour = Integer.parseInt(startTime.substring(0, startTime.indexOf(":")));
					int minute = Integer.parseInt(startTime.substring(startTime.indexOf(":") + 1));
					int time = hour * 60 + minute;
					String start = updList.get(i - 1).getStartTime();
					if(start != null) {
						int hr = Integer.parseInt(start.substring(0, start.indexOf(":")));
						int min = Integer.parseInt(start.substring(start.indexOf(":") + 1));
						int tm = hr * 60 + min;
						if(time < tm) {
							updList.get(i).setStartTime(null);
							updList.get(i).setEndTime(null);
							System.out.println("startTime, endtime null로 바꿈");
							int result1 = td.deleteSchTime(sqlSession, updList.get(i));
						}
					}
				}
			}
		}
		
		return result;
	}

	
	@Override
	public ArrayList<TrvSchedule> selectSchList(int dayId) {
		return td.selectSchList(sqlSession, dayId);
	}

	
	
	@Override
	public int deleteTrvSchedule(int schId) {
		
		TrvSchedule sch = td.selectTrvSchedule(sqlSession, schId);
		int schNumber = sch.getSchNumber();
		int dayId = sch.getDayId();
		int result = td.deleteTrvSchedule(sqlSession, schId);
		int result1 = 0;
		ArrayList<TrvSchedule> schList = td.selectSchList(sqlSession, dayId);
		for(int i = 0; i < schList.size(); i++) {
			if(schList.get(i).getSchNumber() > schNumber) {
				schList.get(i).setSchNumber(schList.get(i).getSchNumber() - 1);
				result1 += td.updateSchNumber(sqlSession, schList.get(i));
			}
		}
		return result;
	}

	
	
	
	@Override
	public int updateDayMemo(TrvDay trvDay) {
		return td.updateTrvDayMemo(sqlSession, trvDay);
	}

	
	
	

	
//----------------tag---------------------------------------------------------------	
	@Override
	public int insertTrvTag(TrvTag trvTag) {
		return td.insertTag(sqlSession, trvTag);
	}	

	@Override
	public int deleteTrvTag(TrvTag trvTag) {
		int result = td.deleteTrvTag(sqlSession, trvTag);
		return 0;
	}	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public TrvCost selectTrvCost(int schId) {
		return td.selectTrvCost(sqlSession, schId);
	}
	
	
	@Override
	public int insertTrvCompany(Travel trv, Member m) {
		return td.insertTrvCompany(sqlSession, trv, m);
	}



	@Override
	public int insertTrvCost(TrvDay day, TrvCost cost) {
		return td.insertTrvCost(sqlSession, cost);
	}

	@Override
	public int insertTrvCost(TrvSchedule sch, TrvCost cost) {
		return td.insertTrvCost(sqlSession, cost);
	}

	
	@Override
	public int insertSchFile(SchFile schFile) {
		int result = td.insertSchFile(sqlSession, schFile);
		return 0;
	}

	@Override
	public HashMap selectSpotList(Travel trv) {
		HashMap spotMap = null;
		int cityId = 0;
		HashMap hmap = td.selectSpotList(sqlSession, trv, cityId);
		return spotMap;
	}


	@Override
	public int deleteTrvComp(Travel trv, int memberId) {
		int result = td.deleteTrvComp(sqlSession, trv, memberId);
		return 0;
	}

	
	@Override
	public int updateTrvCost(TrvCost cost) {
		int result = td.updateTrvCost(sqlSession, cost);
		return 0;
	}

	@Override
	public int deleteTrvCost(TrvCost cost) {
		int result = td.deleteTrvCost(sqlSession, cost);
		return 0;
	}

	@Override
	public int deleteSchFile(SchFile file) {
		int result = td.deleteSchFile(sqlSession, file);
		return 0;
	}
















	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
