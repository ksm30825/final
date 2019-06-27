package com.kh.ti.member.model.service;

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
	
	@Before
	public void setup() {
		m = new Member();
		m.setEmail("user20@gmail.com");
		m.setPassword("0000");
		m.setUserName("testName");
		m.setBirthday("970922");
		m.setGender("M");
		m.setPhone("010-1234-5678");
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
	
	@Test
	public void testDropOutUserInfo() {
		ms.dropOutUserInfo(m);
		log.info("회원 탈퇴 성공!");
	}
	
}
