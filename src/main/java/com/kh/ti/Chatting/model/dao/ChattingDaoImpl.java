package com.kh.ti.Chatting.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ti.member.model.vo.Member;

@Repository
public class ChattingDaoImpl implements ChattingDao{

	//사용자 정보 불러오는 메소드 -- 지원 
	@Override
	public Member selectMemberInfo(SqlSessionTemplate sqlSession, int userId) {
		
		
		return sqlSession.selectOne("Chatting.selectMemberInfo", userId);
	}


	

}
