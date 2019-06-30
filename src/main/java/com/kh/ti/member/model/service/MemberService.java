package com.kh.ti.member.model.service;

import com.kh.ti.member.model.exception.LoginException;
import com.kh.ti.member.model.vo.Member;

public interface MemberService {

	Member loginMember(Member m) throws LoginException;

	int insertMember(Member m);

	int updateUserPwd(Member loginUser, String oldPassword, String newPassword) throws LoginException;

	int dropOutUserInfo(Member loginUser);

	int updateUserInfo(Member m);

	int updateUserAcc(Member loginUser);
	
}
