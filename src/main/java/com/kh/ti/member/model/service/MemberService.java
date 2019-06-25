package com.kh.ti.member.model.service;

import com.kh.ti.member.model.exception.LoginException;
import com.kh.ti.member.model.vo.Member;

public interface MemberService {

	Member loginMember(Member m) throws LoginException;

	int insertMember(Member m);
	
}
