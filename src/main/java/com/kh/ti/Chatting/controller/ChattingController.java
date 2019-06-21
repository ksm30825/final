package com.kh.ti.Chatting.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ti.Chatting.model.service.ChattingService;

@Controller
public class ChattingController {
	
	@Autowired
	private ChattingService cs;
	

	//채팅방 로딩창으로 팝업 띄워주는 메소드 - 지원 
	@RequestMapping("/openCompanion.ch")
	public String popupCompanion() {
		
		return "companion/CompanionMain";
	}
	
	//참가방 - 나의 채팅방 뷰 보여주는 페이지 -지원
	@RequestMapping("/enterRoom.ch")
	public String ShowenterChatting() {
		
		return "companion/EnterRoomList";
	}
	
	//참여방 - 동행찾기를 할수 있는 뷰를 보여주는 페이지  - 지원 
	@RequestMapping("/joinRoom.ch")
	public String ShowFindCompanionRoom() {
		
		return "companion/FindCompanionRoom";
	}
	
	//채팅방 들어가는 메소드 - 지원
	@RequestMapping("/enterChatting.ch")
	public String showChattingRoom() {
		
		
		return "companion/ChattingRoom";
	}
	
	
}
