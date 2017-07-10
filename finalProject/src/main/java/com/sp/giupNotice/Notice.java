package com.sp.giupNotice;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Notice {
	private int listNum, num, noti_Top; 
	private String title, content, created;
	private int hidden, hitCount;
	private String admin_Id;
	
	private int fileNum;
	private String originalFileName, saveFileName; 
	private long fileSize;
	
	//스프링에서 파일 받기
	private List<MultipartFile> upload;
	
	private long gap; 	
	
	
	public int getFileNum() {
		return fileNum;
	}
	public void setFileNum(int fileNum) {
		this.fileNum = fileNum;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public String getSaveFileName() {
		return saveFileName;
	}
	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public List<MultipartFile> getUpload() {
		return upload;
	}
	public void setUpload(List<MultipartFile> upload) {
		this.upload = upload;
	}
	public long getGap() {
		return gap;
	}
	public void setGap(long gap) {
		this.gap = gap;
	}
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num =num;
	}
	public int getNoti_Top() {
		return noti_Top;
	}
	public void setNoti_Top(int noti_Top) {
		this.noti_Top = noti_Top;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public int getHidden() {
		return hidden;
	}
	public void setHidden(int hidden) {
		this.hidden = hidden;
	}
	public int getHitCount() {
		return hitCount;
	}
	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}
	public String getAdmin_Id() {
		return admin_Id;
	}
	public void setAdmin_Id(String admin_Id) {
		this.admin_Id = admin_Id;
	}
	
	
}
