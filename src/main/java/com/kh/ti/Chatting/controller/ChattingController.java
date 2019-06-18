package com.kh.ti.Chatting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChattingController {

	@RequestMapping("/openCompanion.ch")
	public String popupCompanion() {
		
		return "companion/CompanionMain";
	}
	
	//참가방 - 나의 채팅방 뷰 보여주는 페이지
	@RequestMapping("/enterChatting.ch")
	public String ShowenterChatting() {
		
		return "companion/EnterRoom";
	}
	
	@RequestMapping("/joinChatting.ch")
	public String ShowFindCompanionRoom() {
		
		return "companion/FindCompanionRoom";
	}
	
}
