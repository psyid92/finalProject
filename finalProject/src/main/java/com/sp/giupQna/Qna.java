package com.sp.giupQna;

import org.springframework.web.multipart.MultipartFile;

public class Qna {
	private int listNum, q_Num;
	private String q_Title, q_Content; 

	private int q_HitCount; 
	private int admin_Id, g1_Num; 
	private int q_GroupNum, q_Depth, q_OrderNo, q_Parent;
	private String g1_Name; 
	private String q_Created;

	private String q_OriginalFileName, q_SaveFileName; 
	private MultipartFile upload;
	
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public int getQ_Num() {
		return q_Num;
	}
	public void setQ_Num(int q_Num) {
		this.q_Num = q_Num;
	}
	public String getQ_Title() {
		return q_Title;
	}
	public void setQ_Title(String q_Title) {
		this.q_Title = q_Title;
	}
	public String getQ_Content() {
		return q_Content;
	}
	public void setQ_Content(String q_Content) {
		this.q_Content = q_Content;
	}
	public int getQ_HitCount() {
		return q_HitCount;
	}
	public void setQ_HitCount(int q_HitCount) {
		this.q_HitCount = q_HitCount;
	}
	public int getAdmin_Id() {
		return admin_Id;
	}
	public void setAdmin_Id(int admin_Id) {
		this.admin_Id = admin_Id;
	}
	public int getG1_Num() {
		return g1_Num;
	}
	public void setG1_Num(int g1_Num) {
		this.g1_Num = g1_Num;
	}
	public int getQ_GroupNum() {
		return q_GroupNum;
	}
	public void setQ_GroupNum(int q_GroupNum) {
		this.q_GroupNum = q_GroupNum;
	}
	public int getQ_Depth() {
		return q_Depth;
	}
	public void setQ_Depth(int q_Depth) {
		this.q_Depth = q_Depth;
	}
	public int getQ_OrderNo() {
		return q_OrderNo;
	}
	public void setQ_OrderNo(int q_OrderNo) {
		this.q_OrderNo = q_OrderNo;
	}
	public int getQ_Parent() {
		return q_Parent;
	}
	public void setQ_Parent(int q_Parent) {
		this.q_Parent = q_Parent;
	}
	public String getG1_Name() {
		return g1_Name;
	}
	public void setG1_Name(String g1_Name) {
		this.g1_Name = g1_Name;
	}
	public String getQ_Created() {
		return q_Created;
	}
	public void setQ_Created(String q_Created) {
		this.q_Created = q_Created;
	}
	public String getQ_OriginalFileName() {
		return q_OriginalFileName;
	}
	public void setQ_OriginalFileName(String q_OriginalFileName) {
		this.q_OriginalFileName = q_OriginalFileName;
	}
	public String getQ_SaveFileName() {
		return q_SaveFileName;
	}
	public void setQ_SaveFileName(String q_SaveFileName) {
		this.q_SaveFileName = q_SaveFileName;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	
	
}
