package com.sp.userQna;

import org.springframework.web.multipart.MultipartFile;

public class UserQna {
    private int uq_Num, m1_Num, listNum;
    private String uq_Title, uq_Content, uq_Created;
    private String userId, m1_nickname, m1_Email, uq_SaveFilename, uq_OriginalFilename;
    private MultipartFile upload;
    
    
	public String getM1_nickname() {
		return m1_nickname;
	}
	public void setM1_nickname(String m1_nickname) {
		this.m1_nickname = m1_nickname;
	}
	public int getUq_Num() {
		return uq_Num;
	}
	public void setUq_Num(int uq_Num) {
		this.uq_Num = uq_Num;
	}
	public int getM1_Num() {
		return m1_Num;
	}
	public void setM1_Num(int m1_Num) {
		this.m1_Num = m1_Num;
	}
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public String getUq_Title() {
		return uq_Title;
	}
	public void setUq_Title(String uq_Title) {
		this.uq_Title = uq_Title;
	}
	public String getUq_Content() {
		return uq_Content;
	}
	public void setUq_Content(String uq_Content) {
		this.uq_Content = uq_Content;
	}
	public String getUq_Created() {
		return uq_Created;
	}
	public void setUq_Created(String uq_Created) {
		this.uq_Created = uq_Created;
	}
	public String getM1_Email() {
		return m1_Email;
	}
	public void setM1_Email(String m1_Email) {
		this.m1_Email = m1_Email;
	}
	public String getUq_SaveFilename() {
		return uq_SaveFilename;
	}
	public void setUq_SaveFilename(String uq_SaveFilename) {
		this.uq_SaveFilename = uq_SaveFilename;
	}
	public String getUq_OriginalFilename() {
		return uq_OriginalFilename;
	}
	public void setUq_OriginalFilename(String uq_OriginalFilename) {
		this.uq_OriginalFilename = uq_OriginalFilename;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
    
    
   
}
