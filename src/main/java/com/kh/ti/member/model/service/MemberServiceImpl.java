package com.kh.ti.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ti.member.model.dao.MemberDao;
import com.kh.ti.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MemberDao md;
	
	//로그인용메소드
	@Override
	public Member loginMember(Member m) {
		Member loginUser = md.loginCheck(sqlSession, m);
		return loginUser;
	}

	//회원가입용 메소드
	@Override
	public int insertMember(Member m) {
		return md.insertMember(sqlSession, m);
	}


}
