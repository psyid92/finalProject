package com.sp.userEvent;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
     
public class UserEvent {
    private int listNum, ev_Num, ev_Count;
    private String admin_Id, ev_Title, ev_Content;
    private String ev_StartDate, ev_EndDate, ev_Created;
    
    private int fileNum;
    private String ev_OriginalFilename, ev_SaveFilename;
    private long fileSize;
    
    private List<MultipartFile> upload;

	public int getListNum() {
		return listNum;
	}

	public void setListNum(int listNum) {
		this.listNum = listNum;
	}

	public int getEv_Num() {
		return ev_Num;
	}

	public void setEv_Num(int ev_Num) {
		this.ev_Num = ev_Num;
	}

	public int getEv_Count() {
		return ev_Count;
	}

	public void setEv_Count(int ev_Count) {
		this.ev_Count = ev_Count;
	}

	public String getAdmin_Id() {
		return admin_Id;
	}

	public void setAdmin_Id(String admin_Id) {
		this.admin_Id = admin_Id;
	}

	public String getEv_Title() {
		return ev_Title;
	}

	public void setEv_Title(String ev_Title) {
		this.ev_Title = ev_Title;
	}

	public String getEv_Content() {
		return ev_Content;
	}

	public void setEv_Content(String ev_Content) {
		this.ev_Content = ev_Content;
	}

	public String getEv_StartDate() {
		return ev_StartDate;
	}

	public void setEv_StartDate(String ev_StartDate) {
		this.ev_StartDate = ev_StartDate;
	}

	public String getEv_EndDate() {
		return ev_EndDate;
	}

	public void setEv_EndDate(String ev_EndDate) {
		this.ev_EndDate = ev_EndDate;
	}

	public String getEv_Created() {
		return ev_Created;
	}

	public void setEv_Created(String ev_Created) {
		this.ev_Created = ev_Created;
	}

	public int getFileNum() {
		return fileNum;
	}

	public void setFileNum(int fileNum) {
		this.fileNum = fileNum;
	}

	public String getEv_OriginalFilename() {
		return ev_OriginalFilename;
	}

	public void setEv_OriginalFilename(String ev_OriginalFilename) {
		this.ev_OriginalFilename = ev_OriginalFilename;
	}

	public String getEv_SaveFilename() {
		return ev_SaveFilename;
	}

	public void setEv_SaveFilename(String ev_SaveFilename) {
		this.ev_SaveFilename = ev_SaveFilename;
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
    
    
}
