package com.kh.ti.travelBoard.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.ti.common.PageInfo;
import com.kh.ti.travel.model.vo.Tag;
import com.kh.ti.travelBoard.model.vo.TravelBoard;

@Service
public class TravelBoardDaoImpl implements TravelBoardDao {

	//페이징 처리용
	@Override
	public int getListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("TravelBoard.getListCount");
	}
	
	//여행일정 리스트 조회 - 예랑
	@Override
	public ArrayList<TravelBoard> travelList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		//페이징 관련
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		//여행일정, 해당 일정의 썸네일을 담는 해쉬맵
		/*
		 * HashMap tbList = new HashMap();
		 */
		//여행일정 리스트
		ArrayList<TravelBoard> tbList = (ArrayList) sqlSession.selectList("TravelBoard.selectTravelBoardList", null, rowBounds);
		
		for (int i = 0 ; i < tbList.size() ; i++) {
			Tag tag = (Tag) tbList.get(i).getTrvTags().get(i);
			System.out.println("trvTags :" + tag + " 크기 : " + tbList.get(i).getTrvTags().size());
			
		}
		
		/* tbList.put("tbArr", tbArr); */
		
		//여행일정 섬네일 리스트
		//ArrayList<SchFile> schArr = null;
		//tbList.put("schArr", schArr);
		
		

		
		return tbList;
	}
	

}
