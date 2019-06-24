package com.kh.ti.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ti.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao{

	//로그인용메소드 - 세령
	@Override
	public Member loginCheck(SqlSessionTemplate sqlSession, Member m) {
		Member loginUser = sqlSession.selectOne("Member.loginCheck", m);
		return loginUser;
	}

	//회원가입용메소드 - 세령
	@Override
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("Member.insertMember", m);
	}

}
