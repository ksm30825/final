package com.kh.ti.penalty.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ti.penalty.model.vo.Penalty;
import com.kh.ti.penalty.model.vo.PenaltyAttachment;

@Repository
public class PenaltyDaoImpl implements PenaltyDao{

	//신고글 인서트
	@Override
	public int insertPenalty(SqlSessionTemplate sqlSession, Penalty p) {
		return sqlSession.insert("Penalty.insertPenalty", p);
	}

	//신고글 이미지 인서트
	@Override
	public int insertPenaltyImg(SqlSessionTemplate sqlSession, ArrayList<PenaltyAttachment> attachmentFileList) {
		int result = 0;
		for(int i = 0; i < attachmentFileList.size(); i++) {
			sqlSession.insert("Penalty.insertPenaltyImg", attachmentFileList.get(i));
			result++;
		}
		
		return result;
	}

}
