package com.kh.ti.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.ti.member.model.service.MemberService;
import com.kh.ti.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService ms;

	//로그인화면 보여주기 전용(forward loginForm.jsp)--세령
	@RequestMapping("loginForm.me")
	public String showLoginForm() {
		return "member/loginForm";
	}
	
	//회원정보수정화면 보여주기 전용(forward updateMemberInfo.jsp)--세령
	@RequestMapping("updateMemberForm.me")
	public String showMemberInfo() {
		return "member/updateMemberInfo";
	}
	
	//관리자회원관리화면 보여주기 전용(forward adminMemberList.jsp)--세령
	@RequestMapping("adminMemberListForm.me")
	public String showAdminMemberList() {
		return "admin/member/adminMemberList";
	}
	
	//로그인용메소드--세령--세령
	@RequestMapping("login.me")
	public String loginCheck(@ModelAttribute Member m, Model model) {
		Member loginUser = ms.loginMember(m);
		model.addAttribute("loginUSer", loginUser);
		System.out.println(loginUser);
		return "member/loginForm";
	}
	
	//로그아웃용메소드--세령--세령
	@RequestMapping("logout.me")
	public String logoutMember() {
		return null;
	}
	
	//회원가입용메소드--세령--세령
	@RequestMapping("insert.me")
	public String insertMember() {
		return null;
	}
	
	//비밀번호수정용메소드--세령
	@RequestMapping("updateUserPwd.me")
	public void updateUserPwd() {
		
	}
	
	//계좌정보수정용메소드--세령
	@RequestMapping("updateUserAcc.me")
	public void updateUserAcc() {
		
	}
	
	//회원정보수정용메소드--세령
	@RequestMapping("updateUserInfo.me")
	public String updateUserInfo() {
		return null;
	}
	
	//회원탈퇴용메소드--세령
	@RequestMapping("dropOutUser.me")
	public String dropOutUserInfo() {
		return null;
	}
	
	//회원전체조회용메소드--세령
	@RequestMapping("selectAll.me")
	public String selectAllMemberList() {
		return null;
	}
	
	//회원조건조회용메소드--세령
	@RequestMapping("selectCondition.me")
	public String selectConditionMemberList() {
		return null;
	}
	
	//회원게시글내역화면전환용메소드--세령
	@RequestMapping("selectUserBoard.me")
	public String selectUserBoardList() {
		return null;
	}
	
	//회원신고내역화면전환용메소드--세령
	@RequestMapping("selectUserNotify.me")
	public String selectUserNotifyList() {
		return null;
	}
	
	//회원결제내역화면전환용메소드--세령
	@RequestMapping("selectUserPay.me")
	public String selectUserPayList() {
		return null;
	}
	
	//회원문의내역화면전환용메소드--세령
	@RequestMapping("selectUserInquiry.me")
	public String selectUserInquiryList() {
		return null;
	}
	
} //end class
