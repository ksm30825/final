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
	
	//로그인용메소드
	@Override
	public Member loginMember(Member m) throws LoginException {
		Member loginUser = null;
		String encPassword = md.selectEncPassword(sqlSession, m);
		if(!passwordEncoder.matches(m.getPassword(), encPassword)) {
			throw new LoginException("로그인 실패!");
		} else {
			loginUser = md.selectMember(sqlSession, m);			
		}
		return loginUser;
	}

	//회원가입용 메소드
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


}
