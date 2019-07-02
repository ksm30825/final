package com.kh.ti.Chatting.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.ti.member.model.vo.Member;

public interface ChattingDao {


	//사용자 정보 불러오는 메소드 -- 지원
	public Member selectMemberInfo(SqlSessionTemplate sqlSession, int userId);
	
}
