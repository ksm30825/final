package com.kh.ti.member.model.service;

import com.kh.ti.member.model.vo.Member;

public interface MemberService {

	Member loginMember(Member m);

	int insertMember(Member m);
	
}
