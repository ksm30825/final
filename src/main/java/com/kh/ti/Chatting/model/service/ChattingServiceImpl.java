package com.kh.ti.Chatting.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ti.Chatting.model.dao.ChattingDao;
import com.kh.ti.member.model.vo.Member;

@Service
public class ChattingServiceImpl implements ChattingService{

	@Autowired
	private ChattingDao cd;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Member selectMemberInfo(int userId) {
		
		return cd.selectMemberInfo(sqlSession,userId);
	}
	
	
	
}
