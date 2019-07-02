package com.kh.ti.member.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.ti.common.PageInfo;
import com.kh.ti.common.Pagination;
import com.kh.ti.member.model.exception.LoginException;
import com.kh.ti.member.model.service.MemberService;
import com.kh.ti.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService ms;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	//로그인화면 보여주기 전용(forward loginForm.jsp)--세령
	@RequestMapping("loginForm.me")
	public String showLoginForm() {
		return "member/loginForm";
	}
	
	//회원정보수정화면 보여주기 전용(forward updateMemberInfo.jsp)--세령
	@RequestMapping("updateMemberForm.me")
	public String showMemberInfo(Model model, HttpServletRequest request) {
		return "member/updateMemberInfo";
	}
	
	//관리자회원관리화면 보여주기 전용(forward adminMemberList.jsp)--세령
	@RequestMapping("adminMemberListForm.me")
	public String showAdminMemberList(Model model, @RequestParam("currentPage") int currentPage, 
									  @RequestParam("status") String status) {
		//조회 기능 추가
		int listCount = ms.getListCount(status);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Member> mList = ms.selectAllMember(pi, status);
		model.addAttribute("mList", mList);
		model.addAttribute("listCount", listCount);
		model.addAttribute("pi", pi);
		model.addAttribute("status", status);
		return "admin/member/adminMemberList";
	}
	
	//계좌정보변경 창 띄우기용 메소드(forward confirmAccountPopup.jsp) --세령
	@RequestMapping("showConfirmAcc.me")
	public String showConfirmAccPopup() {
		return "member/confirmAccount";
	}
	
	//로그인용메소드--세령--세령
	@RequestMapping("login.me")
	public String loginCheck(@ModelAttribute Member m, Model model) {
		Member loginUser;
		try {
			loginUser = ms.loginMember(m);
			model.addAttribute("loginUser", loginUser);
			return "redirect:index.jsp";
		} catch (LoginException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	//로그아웃용메소드--세령--세령
	@RequestMapping("logout.me")
	public String logoutMember(SessionStatus status) {
		status.setComplete();
		return "redirect:index.jsp";
	}
	
	//회원가입용메소드--세령
	@RequestMapping("insert.me")
	public String insertMember(@ModelAttribute Member m, Model model) {
		//비밀번호 암호화
		String encPassword = passwordEncoder.encode(m.getPassword());
		m.setPassword(encPassword);
		
		int result = ms.insertMember(m);
		if(result > 0) {
			return "redirect:index.jsp";
		} else {
			model.addAttribute("msg", "회원가입 실패!");
			return "common/errorPage";
		}
	}
	
	//비밀번호수정용메소드--세령
	@RequestMapping("updateUserPwd.me")
	public String updateUserPwd(@RequestParam("oldPassword") String oldPassword, 
							  @RequestParam("newPassword") String newPassword,
							  HttpServletRequest request, SessionStatus status,
							  Model model) {
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		
		try {
			int result = ms.updateUserPwd(loginUser, oldPassword, newPassword);
			status.setComplete();
			return "redirect:index.jsp";
		} catch (LoginException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	//계좌정보수정용메소드--세령
	@RequestMapping("updateUserAcc.me")
	public String updateUserAcc(@RequestParam("bankcode") String accCode, @RequestParam("accnum") String accNumber,
							  Model model, HttpServletRequest request) {
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		loginUser.setAccCode(accCode);
		loginUser.setAccNumber(accNumber);
		int result = ms.updateUserAcc(loginUser);
		if(result > 0) {
			model.addAttribute("loginUser", loginUser);
			model.addAttribute("success", "success");
			return "member/confirmAccount";
		} else {
			model.addAttribute("msg", "계좌정보수정 실패!");
			return "common/erroPage";
		}
	}
	
	//회원정보수정용메소드--세령
	@RequestMapping("updateUserInfo.me")
	public String updateUserInfo(@ModelAttribute Member m, Model model, HttpServletRequest request) {
		int result = ms.updateUserInfo(m);
		if(result > 0) {
			//세션 정보 업데이트
			Member loginUser = (Member) request.getSession().getAttribute("loginUser");
			loginUser.setUserName(m.getUserName());
			loginUser.setEmail(m.getEmail());
			loginUser.setGender(m.getGender());
			loginUser.setBirthday(m.getBirthday());
			model.addAttribute("loginUser", loginUser);			
			return "member/updateMemberInfo";
		} else {
			model.addAttribute("msg", "회원정보수정 실패!");
			return "common/errorPage";
		}
	}
	
	//회원탈퇴용메소드--세령
	@RequestMapping("dropOutUser.me")
	public String dropOutUserInfo(HttpServletRequest request, SessionStatus status, Model model) {
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		int result = ms.dropOutUserInfo(loginUser);
		if(result > 0) {
			status.setComplete();
			return "redirect:index.jsp";
		} else {
			model.addAttribute("msg", "회원탈퇴 실패!");
			return "common/errorPage";
		}
	}
	
	//회원조건조회용메소드--세령
	@RequestMapping("selectCondition.me")
	public String selectConditionMemberList(@RequestParam("condition") String condition, 
											@RequestParam("conditionValue") String conditionValue,
											Model model) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("condition", condition);
		map.put("conditionValue", conditionValue);
		
		ArrayList<Member> mList = ms.selectConditionMember(map);
		model.addAttribute("mList", mList);
		return "admin/member/adminMemberList";
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
	
	//이메일발송용 메소드 -- 세령
	@RequestMapping("mailSend.me")
	public String mailSend(HttpServletRequest request,
						ModelMap mo) throws AddressException, MessagingException, UnsupportedEncodingException {
		String host = "smtp.naver.com";
		final String username = "tpfud0922";
		final String password = "mashimaro0*22";
		int port = 465;
		
		String recipient = "tpfud092256@gmail.com";
		String subject = "Travel Interface 에서 발송한 메일입니다.";
		String body = "";
		String targetPath = "http://127.0.0.1:8001/ti/loginForm.me";
		
		//임시 비밀번호 생성
		String[] chars = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "N", "M", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
				"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "n", "m", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", 
				"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"};
		String tempPassword = "1234";
		
		body += "<form action='" + targetPath + "' method='post'>";
		body += "<div style='border: 1px solid gray; background-color: #e6eeff; padding: 20px;'>";
		body += "<h1><strong>Travel Interface</strong> 에서 발송된 메일입니다. </h1>";
		body += "<hr style='border: 1px solid #003399;'>";
		body += "<div>";
		body += "<h4> 안녕하세요. Travel Interface 고객님! <br> 요청하신 임시 비밀번호는 다음과 같습니다.</h4>";
		body += "<br>";
		body += "<h4><strong>임시 비밀번호 : </strong>" + tempPassword + "</h4>";
		body += "<button type='submit' target='_blank' style='background-color: #8a00e6; padding: 10px; border: 0px;"
				+ "color: white; cursor: pointer;'>비밀번호 바로 재설정 </button>";
		body += "<br>";
		body += "<p style='color: red;'>임시 비밀번호를 사용해서 로그인 하신 후 바로 비밀번호를 변경하셔야 정삭적으로 로그인이 가능합니다.</p><br>";
		body += "<p><strong>감사합니다.</strong></p>";
		body += "</div>";
		body += "</form>";
		
		Properties props = System.getProperties();
		
		props.put("mail.smtp.host", host); 
		props.put("mail.smtp.port", port); 
		props.put("mail.smtp.auth", "true"); 
		props.put("mail.smtp.ssl.enable", "true"); 
		props.put("mail.smtp.ssl.trust", host);
		
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
			String un = username; 
			String pw = password; 
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() { 
				return new javax.mail.PasswordAuthentication(un, pw); 
			} 
		}); 
		session.setDebug(true); //for debug 
		Message mimeMessage = new MimeMessage(session); //MimeMessage 생성
		mimeMessage.setFrom(new InternetAddress("tpfud0922@naver.com")); //발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다. 이때는 이메일 풀 주소를 다 작성해주세요.
		
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); //수신자셋팅 //.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음
		
		mimeMessage.setSubject(MimeUtility.encodeText(subject, "UTF-8", "B")); //제목셋팅 
		mimeMessage.setText(body); //내용셋팅 
		mimeMessage.setContent(body, "text/html; charset=UTF-8");
		Transport.send(mimeMessage); //javax.mail.Transport.send() 이용
			
		return null;
	}
	
} //end class
