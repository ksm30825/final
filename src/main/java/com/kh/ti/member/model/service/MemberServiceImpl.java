package com.kh.ti.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.kh.ti.member.model.dao.MemberDao;
import com.kh.ti.member.model.exception.LoginException;
import com.kh.ti.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MemberDao md;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	//로그인용메소드 - 세령
	@Override
	public Member loginMember(Member m) throws LoginException {
		Member loginUser = null;
		String encPassword = md.selectEncPassword(sqlSession, m);
		if(!passwordEncoder.matches(m.getPassword(), encPassword)) {
			throw new LoginException("비밀번호가 일치하지 않습니다!");
		} else {
			loginUser = md.selectMember(sqlSession, m);			
		}
		return loginUser;
	}

	//회원가입용 메소드 - 세령
	@Override
	public int insertMember(Member m) {
		int result = 0;
		int resultInsertMember = md.insertMember(sqlSession, m);
		int resultInsertReservePoint = md.insertReservePoint(sqlSession, m.getEmail());
		if(resultInsertMember > 0 && resultInsertReservePoint > 0) {
			result = 1;
		} else {
			result = 0;
		}
		return result;
	}

	//비밀번호 수정용 메소드 - 세령
	@Override
	public int updateUserPwd(Member loginUser, String oldPassword, String newPassword) throws LoginException {
		String encPassword = md.selectEncPassword(sqlSession, loginUser);
		int result = 0;
		if(!passwordEncoder.matches(oldPassword, encPassword)) {
			System.out.println("비밀번호 일치 안함");
			throw new LoginException("비밀번호가 일치하지 않습니다!");
		} else {
			String encPassword2 = passwordEncoder.encode(newPassword);
			loginUser.setPassword(encPassword2);
			result = md.updateUserPwd(sqlSession, loginUser);
		}
		return result;
	}

	//회원탈퇴용 메소드 - 세령
	@Override
	public int dropOutUserInfo(Member loginUser) {
		int result = md.dropOutUserInfo(sqlSession, loginUser);
		return result;
	}


}
