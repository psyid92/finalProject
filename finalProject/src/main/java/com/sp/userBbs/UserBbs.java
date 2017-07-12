package com.sp.userBbs;

import org.springframework.web.multipart.MultipartFile;

public class UserBbs {
    private int bbs_Num, listNum, m1_Num;
    private String userId, m1_nickname, m1_Email;
    private String bbs_Subject, bbs_Content, bbs_Created;
    private int bbs_Count;
    private String bbs_SaveFilename, bbs_OriginalFilename;
    private MultipartFile upload;
    
    
    
	public int getBbs_Num() {
		return bbs_Num;
	}
	public void setBbs_Num(int bbs_Num) {
		this.bbs_Num = bbs_Num;
	}
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public int getM1_Num() {
		return m1_Num;
	}
	public void setM1_Num(int m1_Num) {
		this.m1_Num = m1_Num;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getM1_nickname() {
		return m1_nickname;
	}
	public void setM1_nickname(String m1_nickname) {
		this.m1_nickname = m1_nickname;
	}
	public String getM1_Email() {
		return m1_Email;
	}
	public void setM1_Email(String m1_Email) {
		this.m1_Email = m1_Email;
	}
	public String getBbs_Subject() {
		return bbs_Subject;
	}
	public void setBbs_Subject(String bbs_Subject) {
		this.bbs_Subject = bbs_Subject;
	}
	public String getBbs_Content() {
		return bbs_Content;
	}
	public void setBbs_Content(String bbs_Content) {
		this.bbs_Content = bbs_Content;
	}
	public String getBbs_Created() {
		return bbs_Created;
	}
	public void setBbs_Created(String bbs_Created) {
		this.bbs_Created = bbs_Created;
	}
	public int getBbs_Count() {
		return bbs_Count;
	}
	public void setBbs_Count(int bbs_Count) {
		this.bbs_Count = bbs_Count;
	}
	public String getBbs_SaveFilename() {
		return bbs_SaveFilename;
	}
	public void setBbs_SaveFilename(String bbs_SaveFilename) {
		this.bbs_SaveFilename = bbs_SaveFilename;
	}
	public String getBbs_OriginalFilename() {
		return bbs_OriginalFilename;
	}
	public void setBbs_OriginalFilename(String bbs_OriginalFilename) {
		this.bbs_OriginalFilename = bbs_OriginalFilename;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
    
    
}
