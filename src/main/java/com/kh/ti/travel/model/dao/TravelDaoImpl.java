package com.kh.ti.travel.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ti.member.model.vo.Member;
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

@Repository
public class TravelDaoImpl implements TravelDao {

	
	@Override
	public int insertTravel(SqlSessionTemplate sqlSession, Travel trv) {
		return sqlSession.insert("Travel.insertTravel", trv);
	}
	@Override
	public int selectTrvId(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Travel.selectTrvId");
	}
	@Override
	public City selectCity(SqlSessionTemplate sqlSession, int cityId) {
		return sqlSession.selectOne("Travel.selectCity", cityId);
	}	
	@Override
	public int insertTrvCity(SqlSessionTemplate sqlSession, TrvCity trvCity) {
		return sqlSession.insert("Travel.insertTrvCity", trvCity);
	}
	@Override
	public int insertTrvDay(SqlSessionTemplate sqlSession, TrvDay trvDay) {
		return sqlSession.insert("Travel.insertTrvDay", trvDay);
	}
	@Override
	public Travel selectTravel(SqlSessionTemplate sqlSession, int trvId) {
		return sqlSession.selectOne("Travel.selectTravel", trvId);
	}
	@Override
	public ArrayList<TrvCity> selectTrvCity(SqlSessionTemplate sqlSession, int trvId) {
		return (ArrayList)sqlSession.selectList("Travel.selectTrvCityList", trvId);
	}
	@Override
	public ArrayList<TrvDay> selectTrvDay(SqlSessionTemplate sqlSession, int trvId) {
		return (ArrayList)sqlSession.selectList("Travel.selectTrvDayList", trvId);
	}

	@Override
	public ArrayList<Country> selectCountryList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("Travel.selectCountryList");
	}
	@Override
	public ArrayList<City> selectCityList(SqlSessionTemplate sqlSession, int countryId) {
		return (ArrayList)sqlSession.selectList("Travel.selectCityList", countryId);
	}
	@Override
	public ArrayList<Tag> selectTagList(SqlSessionTemplate sqlSession) {
		return(ArrayList)sqlSession.selectList("Travel.selectAllTagList");
	}
	
	@Override
	public int updateTravel(SqlSessionTemplate sqlSession, Travel trv) {
		return sqlSession.update("Travel.updateTravel", trv);
	}
	@Override
	public int deleteTrvCity(SqlSessionTemplate sqlSession, TrvCity trvCity) {
		return sqlSession.delete("Travel.deleteTrvCity", trvCity);
	}
	@Override
	public int updateTrvDay(SqlSessionTemplate sqlSession, TrvDay trvDay) {
		return sqlSession.update("Travel.updateTrvDay", trvDay);
	}
	@Override
	public int deleteTrvDay(SqlSessionTemplate sqlSession, TrvDay trvDay) {
		return sqlSession.delete("Travel.deleteTrvDay", trvDay);
	}
	

	@Override
	public int completeTravel(SqlSessionTemplate sqlSession, int trvId) {
		return sqlSession.update("Travel.completeTravel", trvId);
	}	
	
	
	

	@Override
	public int insertTrvCompany(SqlSessionTemplate sqlSession, Travel trv, Member m) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertTag(SqlSessionTemplate sqlSession, Travel trv, Tag tag) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int insertTrvSchedule(SqlSessionTemplate sqlSession, TrvSchedule sch) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertTrvCost(SqlSessionTemplate sqlSession, TrvCost cost) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertTrvPlace(SqlSessionTemplate sqlSession, Place plc) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertTrvCost(SqlSessionTemplate sqlSession, Travel trv, TrvCost cost) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSchFile(SqlSessionTemplate sqlSession, SchFile schFile) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateTrvSchedule(SqlSessionTemplate sqlSession, TrvSchedule sch) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList selectAllSchList(SqlSessionTemplate sqlSession, Travel trv, int day) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HashMap selectSpotList(SqlSessionTemplate sqlSession, Travel trv, int cityId) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public int deleteTravel(SqlSessionTemplate sqlSession, Travel trv) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int deleteTrvComp(SqlSessionTemplate sqlSession, Travel trv, int memberId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteTrvTag(SqlSessionTemplate sqlSession, Travel trv, int tagId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateTrvCost(SqlSessionTemplate sqlSession, TrvCost cost) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteTrvCost(SqlSessionTemplate sqlSession, TrvCost cost) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteSchFile(SqlSessionTemplate sqlSession, SchFile file) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteTrvSchedule(SqlSessionTemplate sqlSession, TrvSchedule sch) {
		// TODO Auto-generated method stub
		return 0;
	}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
