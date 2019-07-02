package com.kh.ti.Chatting.model.service;

import org.springframework.stereotype.Service;

import com.kh.ti.member.model.vo.Member;

@Service
public interface ChattingService {

	//사용자 정보 불러오기 - 지원
	public Member selectMemberInfo(int userId);
}
