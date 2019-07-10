package com.kh.ti.penalty.model.service;

import java.util.ArrayList;

import com.kh.ti.penalty.model.vo.PenaltyAttachment;
import com.kh.ti.penalty.model.vo.Penalty;

public interface PenaltyService {

	int insertPenalty(Penalty p, ArrayList<PenaltyAttachment> attachmentFileList);

}
