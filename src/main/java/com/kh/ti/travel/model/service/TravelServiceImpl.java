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
import com.kh.ti.travel.model.vo.Place;
import com.kh.ti.travel.model.vo.SchFile;
import com.kh.ti.travel.model.vo.Tag;
import com.kh.ti.travel.model.vo.Travel;
import com.kh.ti.travel.model.vo.TrvCity;
import com.kh.ti.travel.model.vo.TrvCost;
import com.kh.ti.travel.model.vo.TrvDay;
import com.kh.ti.travel.model.vo.TrvSchedule;

@Service
public class TravelServiceImpl implements TravelService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private TravelDao td;
	
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
		ArrayList<TrvCity> trvCityList = td.selectTrvCity(sqlSession, trvId);
		ArrayList<TrvDay> trvDayList = td.selectTrvDay(sqlSession, trvId);
		ArrayList<Tag> allTagList = td.selectTagList(sqlSession);
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
		ArrayList<TrvCity> trvCityList = td.selectTrvCity(sqlSession, trv.getTrvId());
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
		
		ArrayList<TrvDay> trvDayList = td.selectTrvDay(sqlSession, trv.getTrvId());
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
	public int selectSchCount(int dayId) {
		return td.selectSchCount(sqlSession, dayId);
	}
	@Override
	public int selectSchNumber(int dayId, String startTime) {
		int difference = 1440;
		int number = 0;
		int hour = Integer.parseInt(startTime.substring(0, startTime.indexOf(":")));
		int minute = Integer.parseInt(startTime.substring(startTime.indexOf(":") + 1));
		ArrayList<TrvSchedule> schList = td.selectSchList(sqlSession, dayId);
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
		
		if(number == 0) {
			number = 1;
			for(int i = 0; i < schList.size(); i++) {
				schList.get(i).setSchNumber(schList.get(i).getSchNumber() + 1);
				int result = td.updateSchNumber(sqlSession, schList.get(i));
			}
		}else {
			for(int i = 0; i < schList.size(); i++) {
				if(schList.get(i).getSchNumber() >= number) {
					schList.get(i).setSchNumber(schList.get(i).getSchNumber() + 1);
					int result = td.updateSchNumber(sqlSession, schList.get(i));
				}
			}
		}
		
		return number;
	}

	@Override
	public int insertTrvSchedule(TrvSchedule sch, TrvCost cost, Place plc) {
		int result2 = 0;
		int result3 = 0;
		int result4 = 0;
		
		int result = td.insertTrvSchedule(sqlSession, sch);
		
		int schId = td.selectSchId(sqlSession);
		if(cost.getCostAmount() != 0.0) {
			cost.setSchId(schId);
			result2 += td.insertTrvCost(sqlSession, cost);
		}
		
		if(plc.getPlcId() != 0) {
			result3 += td.insertPlace(sqlSession, plc);
			int plcId = td.selectPlcId(sqlSession);
			sch.setPlcId(plcId);
			result4 += td.updateSchPlcId(sqlSession, sch);
		}
		return result;
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
	public int insertTrvCompany(Travel trv, Member m) {
		return td.insertTrvCompany(sqlSession, trv, m);
	}

	@Override
	public int insertTrvTag(Travel trv, Tag tag) {
		return td.insertTag(sqlSession, trv, tag);
	}

	@Override
	public int insertTrvPlace(Travel trv, Place plc) {
		TrvSchedule sch = null;
		int result2 = td.insertTrvSchedule(sqlSession, sch);
		return 0;
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
	public int updateTrvSchedule(TrvSchedule sch, Place plc) {
		int result1 = td.updateTrvSchedule(sqlSession, sch);
		int result2 = td.insertPlace(sqlSession, plc);
		return 0;
	}
	
	@Override
	public int insertSchFile(SchFile schFile) {
		int result = td.insertSchFile(sqlSession, schFile);
		return 0;
	}

	@Override
	public HashMap selectAllSchList(Travel trv) {
		HashMap schMap = null;
		int day = 0;
		ArrayList schList = td.selectAllSchList(sqlSession, trv, day);
		return schMap;
	}

	@Override
	public HashMap selectSpotList(Travel trv) {
		HashMap spotMap = null;
		int cityId = 0;
		HashMap hmap = td.selectSpotList(sqlSession, trv, cityId);
		return spotMap;
	}


	@Override
	public int deleteTravel(Travel trv) {
		int result = td.deleteTravel(sqlSession, trv);
		return 0;
	}

	@Override
	public int deleteTrvCity(Travel trv, int cityId) {
		//int result = td.deleteTrvCity(sqlSession, trv, cityId);
		return 0;
	}

	@Override
	public int deleteTrvComp(Travel trv, int memberId) {
		int result = td.deleteTrvComp(sqlSession, trv, memberId);
		return 0;
	}

	@Override
	public int deleteTrvTag(Travel trv, int tagId) {
		int result = td.deleteTrvTag(sqlSession, trv, tagId);
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
