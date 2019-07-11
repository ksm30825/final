package com.kh.ti.spot.model.service;

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

import com.kh.ti.member.model.service.MemberServiceTest;
import com.kh.ti.spot.model.vo.Likey;
import com.kh.ti.spot.model.vo.SpotCityList;
import com.kh.ti.spot.model.vo.SpotList;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/config/spot-servlet.xml",
					  "file:src/main/resources/root-context.xml",
					  "file:src/main/webapp/WEB-INF/config/spring-security.xml"})
@WebAppConfiguration
public class TestSpotService {

	private static final Logger log = LoggerFactory.getLogger(MemberServiceTest.class);
	
	@Autowired
	private SpotService ss;
	
	Likey likey;
	
	@Before
	public void setup() {
		likey = new Likey();
		likey.setMemberId(1);
		likey.setSpotId(2);
		System.out.println("셋팅 완료!");
	}
	
	@Ignore
	@Test
	public void selectCityNamesTest() {
		ArrayList<SpotCityList> spotList = ss.selectCityNames();
		log.info("여행지-주요도시를 위한 도시명 조회 성공! size : " + spotList.size());
		log.info(spotList.toString());
	}
	
	@Ignore
	@Test
	public void selectCityListTest() {
		ArrayList<SpotCityList> spotList = ss.selectCityList();
		log.info("여행지-주요도시를 위한 도시 전체 조회 성공! size : " + spotList.get(0).getsFileList().size());
		log.info(spotList.toString());
	}
	
	@Ignore
	@Test
	public void selectSpotListTest() {
		ArrayList<SpotList> spotList = ss.selectSpotList(11);
		log.info("여행시 - 도시 상세보기를 위한 명소 조회 성공! size : " + spotList.size());
		for(int i = 0; i < spotList.size(); i++) {
			log.info(spotList.get(i).toString());
		}
	}
	
	@Ignore
	@Test
	public void insertSpotLikey() {
		ss.insertSpotLikey(likey);
		log.info("명소 종아요를 추가 성공!");
	}
	
	@Test
	public void selectMyLikeySpotListTest() {
		ArrayList<SpotList> spotList = ss.selectMyLikeySpotList(7);
		log.info("마이페이지 좋아요 명소 조회 성공!" + spotList.size());
		log.info(spotList.toString());
	}
}
