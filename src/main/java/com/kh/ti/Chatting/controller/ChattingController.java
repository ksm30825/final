package com.kh.ti.Chatting.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ti.Chatting.model.service.ChattingService;
import com.kh.ti.member.model.vo.Member;

@Controller
public class ChattingController {
	
	@Autowired
	private ChattingService cs;
	

	//채팅방 로딩창으로 팝업 띄워주는 메소드 - 지원 
	@RequestMapping("/openCompanion.ch")
	public String popupCompanion() {
		
		return "companion/EnterRoomList";
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
	public String showChattingRoom(HttpServletRequest request) {
		String chatid = (String)request.getParameter("num");
		
		//System.out.println("chatId :" + chatid);
		
		request.setAttribute("chatId", chatid);
		
		return "companion/ChattingRoom";
		
	}
	
	//사용자 정보 창으로 이동 메소드 - 지원
	@RequestMapping("/userInfo.ch")
	public String showUserInfo() {
		
		
		return "companion/UserInfo";
	}
	
	//채팅방 설정  화면으로  - 지원
	@RequestMapping("/showchange.ch")
	public String showChangChattingRoom() {
		
		
		return "companion/ChangeChattingRoom";
	}
	
	
	//신고 화면으로 - 지원
	@RequestMapping("/declaration.ch")
	public String showDeclarationChatting() {
		
		return "companion/DeclarationChatting";
	}
	
	//사용자 정보 불러오기
	//여행일정 일자별 스케쥴 조회용
	@RequestMapping("/memberInfo.ch")
	public ResponseEntity<Member> selectMemberInfo(int userId) {
	      
	     System.out.println("userId : " + userId);
	     
	     Member userInfo = cs.selectMemberInfo(userId);
	     
	     String birthStr = userInfo.getBirthday();
	     
	     if (birthStr != null) {
	    	 int century = Integer.parseInt(birthStr.substring(0, 1));
	    	 
		     if(century == 0) {
		      birthStr = "20" + birthStr;
		     } else {
		      birthStr = "19" + birthStr;
		     }
		     
		     System.out.println("birthdAy :" + birthStr);
		     
		     SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd", Locale.KOREAN);
		     Date birthDay;
			try {
				birthDay = sdf.parse(birthStr);
				
				GregorianCalendar today = new GregorianCalendar();
			    GregorianCalendar birth = new GregorianCalendar();
			     birth.setTime(birthDay);
			     
			     int factor = 0;
			     if(today.get(Calendar.DAY_OF_YEAR)<birth.get(Calendar.DAY_OF_YEAR)) {
			      factor = -1;
			     }
			     
			     int age =   today.get(Calendar.YEAR) - birth.get(Calendar.YEAR) + factor;
			     
			     userInfo.setAge(age);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		     
		     
		     
		    
	     }
	    


	     
	     System.out.println("detailDay : " + userInfo);
	      
	     return new ResponseEntity<Member>(userInfo, HttpStatus.OK);
	   }
	
	
	
}
