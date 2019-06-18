package com.kh.ti.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	//로그인화면 보여주기 전용(forward loginForm.jsp)
	@RequestMapping("loginForm.me")
	public String showLoginForm() {
		return "member/loginForm";
	}
	
	//회원정보수정화면 보여주기 전용(forward updateMemberInfo.jsp)
	@RequestMapping("updateMemberForm.me")
	public String showMemberInfo() {
		return "member/updateMemberInfo";
	}
}
