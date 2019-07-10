package com.kh.ti.penalty.model.vo;

import java.io.Serializable;

public class PenalityAttachment implements Serializable{
	private int fileId;	//파일번호
	
	public PenalityAttachment() {}

	public PenalityAttachment(int fileId) {
		super();
		this.fileId = fileId;
	}

	public int getFileId() {
		return fileId;
	}

	public void setFileId(int fileId) {
		this.fileId = fileId;
	}

	@Override
	public String toString() {
		return "PenalityAttachment [fileId=" + fileId + "]";
	}
}
