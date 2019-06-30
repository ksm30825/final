package com.kh.ti.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ti.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao{

	//비밀번호 확인용메소드 - 세령
	@Override
	public String selectEncPassword(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("Member.selectPwd", m.getEmail());
	}
	
	//로그인용메소드 - 세령
	@Override
	public Member selectMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("Member.selectLoginUser", m);
	}

	//회원가입용메소드 - 세령
	@Override
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("Member.insertMember", m);
	}

	//가입 포인트 적립용 메소드 - 세령
	@Override
	public int insertReservePoint(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.insert("Member.insertReservePoint", email);
	}

	//비밀번호 변경용 메소드 -- 세령
	@Override
	public int updateUserPwd(SqlSessionTemplate sqlSession, Member loginUser) {
		return sqlSession.update("Member.updatePwd", loginUser);
	}

	//회원탈퇴용 메소드 - 세령
	@Override
	public int dropOutUserInfo(SqlSessionTemplate sqlSession, Member loginUser) {
		return sqlSession.update("Member.updateEnrollStatus", loginUser);
	}

	//회원수정용 메소드 - 세령
	@Override
	public int updateUserInfo(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("Member.updateUserInfo", m);
	}

	//계좌정보수정용 메소드 - 세령
	@Override
	public int updateUserAcc(SqlSessionTemplate sqlSession, Member loginUser) {
		return sqlSession.update("Member.updateAcc", loginUser);
	}


}
