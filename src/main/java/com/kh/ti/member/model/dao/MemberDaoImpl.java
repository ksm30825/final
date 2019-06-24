package com.kh.ti.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ti.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao{

	@Override
	public Member loginCheck(SqlSessionTemplate sqlSession, Member m) {
		Member loginUser = sqlSession.selectOne("Member.loginCheck", m);
		return loginUser;
	}

}
