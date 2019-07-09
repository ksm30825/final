package com.kh.ti.Chatting.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ti.member.model.vo.Member;
import com.kh.ti.travel.model.vo.Country;
import com.kh.ti.travel.model.vo.Tag;

@Repository
public class ChattingDaoImpl implements ChattingDao{

	//사용자 정보 불러오는 메소드 -- 지원 
	@Override
	public Member selectMemberInfo(SqlSessionTemplate sqlSession, int userId) {
		
		
		return sqlSession.selectOne("Chatting.selectMemberInfo", userId);
	}

	@Override
	public ArrayList<Country> selectContryList(SqlSessionTemplate sqlSession) {
	
		return (ArrayList)sqlSession.selectList("Chatting.selectContryList");
	}

	@Override
	public ArrayList<Tag> selectTagList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("Chatting.selectTagList");
	}


	

}
