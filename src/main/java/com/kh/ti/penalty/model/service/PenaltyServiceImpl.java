package com.kh.ti.penalty.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.ti.penalty.model.dao.PenaltyDao;
import com.kh.ti.penalty.model.vo.Penalty;
import com.kh.ti.penalty.model.vo.PenaltyAttachment;

@Service
public class PenaltyServiceImpl implements PenaltyService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private PenaltyDao pd;
	@Autowired
	private DataSourceTransactionManager transactionManager;

	//신고하기 인서트
	@Override
	public int insertPenalty(Penalty p, ArrayList<PenaltyAttachment> attachmentFileList) {
		int result = 0;
		
		//신고글 인서트
		int result1 = pd.insertPenalty(sqlSession, p);
		
		//신고 캡쳐이미지 인서트
		int result2 = pd.insertPenaltyImg(sqlSession, attachmentFileList);
			
		if(result2 == attachmentFileList.size()) {
			result = 1;
		} else {
			result = 0;
		}
		return result;
	}
}
