package com.sp.giupReview;

import org.springframework.web.multipart.MultipartFile;

public class giupReview {
	private String rep_created, rep_content, myStar, g1_name, m1_email;
	private int rep_num,  rep_star, m1_num, g1_num, jumun_num;
	
	//사진
	private MultipartFile upload; // <input type='file' name='upload' ...
	private String rphoto_SaveFilename, rphoto_OriginalFilename;
	// Getter  ------ Setter
	
	
	public String getRep_created() {
		return rep_created;
	}
	public String getM1_email() {
		return m1_email;
	}
	public void setM1_email(String m1_email) {
		this.m1_email = m1_email;
	}
	public String getG1_name() {
		return g1_name;
	}
	public void setG1_name(String g1_name) {
		this.g1_name = g1_name;
	}
	public String getMyStar() {
		return myStar;
	}
	public void setMyStar(String myStar) {
		this.myStar = myStar;
	}
	public void setRep_created(String rep_created) {
		this.rep_created = rep_created;
	}
	public String getRep_content() {
		return rep_content;
	}
	public void setRep_content(String rep_content) {
		this.rep_content = rep_content;
	}
	public int getRep_num() {
		return rep_num;
	}
	public void setRep_num(int rep_num) {
		this.rep_num = rep_num;
	}
	public int getRep_star() {
		return rep_star;
	}
	public void setRep_star(int rep_star) {
		this.rep_star = rep_star;
	}
	public int getM1_num() {
		return m1_num;
	}
	public void setM1_num(int m1_num) {
		this.m1_num = m1_num;
	}
	public int getG1_num() {
		return g1_num;
	}
	public void setG1_num(int g1_num) {
		this.g1_num = g1_num;
	}
	public int getJumun_num() {
		return jumun_num;
	}
	public void setJumun_num(int jumun_num) {
		this.jumun_num = jumun_num;
	}
	//사진
	public String getRphoto_SaveFilename() {
		return rphoto_SaveFilename;
	}
	public void setRphoto_SaveFilename(String rphoto_SaveFilename) {
		this.rphoto_SaveFilename = rphoto_SaveFilename;
	}
	public String getRphoto_OriginalFilename() {
		return rphoto_OriginalFilename;
	}
	public void setRphoto_OriginalFilename(String rphoto_OriginalFilename) {
		this.rphoto_OriginalFilename = rphoto_OriginalFilename;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	
	
	
	
	

}
