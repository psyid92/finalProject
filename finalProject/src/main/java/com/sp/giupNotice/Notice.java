package com.sp.giupNotice;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Notice {
	private int listNum, noti_Num, noti_Top; 
	private String noti_Title, noti_Content, noti_Created;
	private int noti_hidden, noti_HItCount;
	private String admin_Id;
	
	private int noti_FileNum;
	private String noti_OrigianlFileName, noti_SaveFileName; 
	private long noti_FileSize;
	
	
	//스프링에서 파일 받기
	private List<MultipartFile> upload;
	
	private long gap; 	
	
	
	public int getNoti_FileNum() {
		return noti_FileNum;
	}
	public void setNoti_FileNum(int noti_FileNum) {
		this.noti_FileNum = noti_FileNum;
	}
	public String getNoti_OrigianlFileName() {
		return noti_OrigianlFileName;
	}
	public void setNoti_OrigianlFileName(String noti_OrigianlFileName) {
		this.noti_OrigianlFileName = noti_OrigianlFileName;
	}
	public String getNoti_SaveFileName() {
		return noti_SaveFileName;
	}
	public void setNoti_SaveFileName(String noti_SaveFileName) {
		this.noti_SaveFileName = noti_SaveFileName;
	}
	public long getNoti_FileSize() {
		return noti_FileSize;
	}
	public void setNoti_FileSize(long noti_FileSize) {
		this.noti_FileSize = noti_FileSize;
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
	public int getNoti_Num() {
		return noti_Num;
	}
	public void setNoti_Num(int noti_Num) {
		this.noti_Num =noti_Num;
	}
	public int getNoti_Top() {
		return noti_Top;
	}
	public void setNoti_Top(int noti_Top) {
		this.noti_Top = noti_Top;
	}
	public String getNoti_Title() {
		return noti_Title;
	}
	public void setNoti_Title(String noti_Title) {
		this.noti_Title = noti_Title;
	}
	public String getNoti_Content() {
		return noti_Content;
	}
	public void setNoti_Content(String noti_Content) {
		this.noti_Content = noti_Content;
	}
	public String getNoti_Created() {
		return noti_Created;
	}
	public void setNoti_Created(String noti_Created) {
		this.noti_Created = noti_Created;
	}
	public int getNoti_hidden() {
		return noti_hidden;
	}
	public void setNoti_hidden(int noti_hidden) {
		this.noti_hidden = noti_hidden;
	}
	public int getNoti_HItCount() {
		return noti_HItCount;
	}
	public void setNoti_HItCount(int noti_HItCount) {
		this.noti_HItCount = noti_HItCount;
	}
	public String getAdmin_Id() {
		return admin_Id;
	}
	public void setAdmin_Id(String admin_Id) {
		this.admin_Id = admin_Id;
	}
	
	
}
