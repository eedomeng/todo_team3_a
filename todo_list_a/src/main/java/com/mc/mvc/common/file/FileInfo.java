package com.mc.mvc.common.file;

import java.time.LocalDateTime;

import com.mc.mvc.common.code.Code;

import lombok.Data;

@Data
public class FileInfo {
	
	private int flIdx;
	private String originFileName;
	private String renameFileName;
	private String savePath;
	private LocalDateTime regDate;
	private Boolean isDel;
	private String groupName;
	private int gnIdx;
	
	public String getFullPath() {
		return Code.STORAGE_PATH + groupName + "/" + savePath + renameFileName;
	}

	public int getFlIdx() {
		return flIdx;
	}

	public void setFlIdx(int flIdx) {
		this.flIdx = flIdx;
	}

	public String getOriginFileName() {
		return originFileName;
	}

	public void setOriginFileName(String originFileName) {
		this.originFileName = originFileName;
	}

	public String getRenameFileName() {
		return renameFileName;
	}

	public void setRenameFileName(String renameFileName) {
		this.renameFileName = renameFileName;
	}

	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public LocalDateTime getRegDate() {
		return regDate;
	}

	public void setRegDate(LocalDateTime regDate) {
		this.regDate = regDate;
	}

	public Boolean getIsDel() {
		return isDel;
	}

	public void setIsDel(Boolean isDel) {
		this.isDel = isDel;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public int getGnIdx() {
		return gnIdx;
	}

	public void setGnIdx(int gnIdx) {
		this.gnIdx = gnIdx;
	}
	
	
	
	
	
}
