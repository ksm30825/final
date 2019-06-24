package com.kh.ti.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.ti.member.model.vo.Member;

public interface MemberDao {

	Member loginCheck(SqlSessionTemplate sqlSession, Member m);

}
