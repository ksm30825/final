package com.kh.ti.penalty.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;


import com.kh.ti.penalty.model.vo.Penalty;
import com.kh.ti.penalty.model.vo.PenaltyAttachment;

public interface PenaltyDao {

	int insertPenalty(SqlSessionTemplate sqlSession, Penalty p);

	int insertPenaltyImg(SqlSessionTemplate sqlSession, ArrayList<PenaltyAttachment> attachmentFileList);

}
