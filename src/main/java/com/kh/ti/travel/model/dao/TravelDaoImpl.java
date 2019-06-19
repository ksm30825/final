package com.kh.ti.travel.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ti.member.model.vo.Member;
import com.kh.ti.travel.model.vo.Place;
import com.kh.ti.travel.model.vo.SchFile;
import com.kh.ti.travel.model.vo.Tag;
import com.kh.ti.travel.model.vo.Travel;
import com.kh.ti.travel.model.vo.TrvCost;
import com.kh.ti.travel.model.vo.TrvSchedule;

@Repository
public class TravelDaoImpl implements TravelDao {

	
	@Override
	public int insertTravel(SqlSessionTemplate sqlSession, Travel trv) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertTrvCity(SqlSessionTemplate sqlSession, Travel trv) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertTrvDay(SqlSessionTemplate sqlSession, Travel trv) {
		// TODO Auto-generated method stub
		return 0;
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
	public int updateTravel(SqlSessionTemplate sqlSession, Travel trv) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int completeTravel(SqlSessionTemplate sqlSession, Travel trv) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteTravel(SqlSessionTemplate sqlSession, Travel trv) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteTrvCity(SqlSessionTemplate sqlSession, Travel trv, int cityId) {
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
