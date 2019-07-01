package com.kh.ti.member.model.service;

import java.util.ArrayList;

import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.ti.common.PageInfo;
import com.kh.ti.common.Pagination;
import com.kh.ti.member.model.exception.LoginException;
import com.kh.ti.member.model.vo.Member;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/config/member-servlet.xml",
					  "file:src/main/resources/root-context.xml",
					  "file:src/main/webapp/WEB-INF/config/spring-security.xml"})
@WebAppConfiguration
public class MemberServiceTest {
	
	private static final Logger log = LoggerFactory.getLogger(MemberServiceTest.class);
	
	private Member m;
	@Autowired
	private MemberService ms;
	PageInfo pi;
	String status;
	
	@Before
	public void setup() {
		m = new Member();
		m.setMemberId(7);
		m.setEmail("user07@gmail.com");
		m.setPassword("0000");
		m.setUserName("박세령");
		m.setBirthday("1997-09-22");
		m.setGender("F");
		m.setPhone("010-9226-0374");
		m.setAccCode("003");
		m.setAccNumber("01092260374");
		
		int currentPage = 1;
		int listCount = 20;
		pi = Pagination.getPageInfo(currentPage, listCount);
		status = "ALL";
		
		System.out.println("셋팅 완료!");
	}
	
	@Ignore
	@Test
	public void testInsertMember() {
		ms.insertMember(m);
		log.info("회원가입 성공!");
	}
	
	@Ignore
	@Test
	public void testSelectLoginUser() throws LoginException {
		ms.loginMember(m);
		log.info("로그인 성공!");
	}
	
	@Ignore
	@Test
	public void testUpdateUserPwd() throws LoginException {
		ms.updateUserPwd(m, "0000", "1234");
		log.info("비밀번호 수정 성공!");
	}
	
	@Ignore
	@Test
	public void testDropOutUserInfo() {
		ms.dropOutUserInfo(m);
		log.info("회원 탈퇴 성공!");
	}
	
	@Ignore
	@Test
	public void testUpdateUserInfo() {
		ms.updateUserInfo(m);
		log.info("회원 정보 수정 성공!");
	}
	
	@Ignore
	@Test
	public void testUpdateUserAcc() {
		ms.updateUserAcc(m);
		log.info("계좌 정보 수정 성공!");
	}
	
	@Ignore
	@Test
	public void testGetListCount() {
		int result = ms.getListCount(status);
		System.out.println(status);
		log.info("회원 수 조회 성공! : " + result);
	}
	
	@Test
	public void testSelectAllMember() {
		ArrayList<Member> mList = ms.selectAllMember(pi, status);
		log.info("회원 전체 조회 성공!" + mList.size());
	}
}
