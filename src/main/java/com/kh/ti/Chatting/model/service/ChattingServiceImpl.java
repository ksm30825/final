package com.kh.ti.Chatting.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ti.Chatting.model.dao.ChattingDao;

@Service
public class ChattingServiceImpl implements ChattingService{

	@Autowired
	private ChattingDao cd;
	
	
	//채팅방 만들기 - 지원 
	@Override
	public int insertChatting() {
		return 0;
	}

}
