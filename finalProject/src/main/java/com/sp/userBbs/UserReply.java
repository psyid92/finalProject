package com.sp.userBbs;

public class UserReply {
	private int rep_Num, bbs_Num, m1_Num, listNum, rep_Answer;
	private String userId, m1_nickname, m1_Email;
	private String rep_Content, rep_Created;
	
	private int answerCount,likeCount, disLikeCount;

	public int getRep_Num() {
		return rep_Num;
	}

	public void setRep_Num(int rep_Num) {
		this.rep_Num = rep_Num;
	}

	public int getBbs_Num() {
		return bbs_Num;
	}

	public void setBbs_Num(int bbs_Num) {
		this.bbs_Num = bbs_Num;
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

	public int getRep_Answer() {
		return rep_Answer;
	}

	public void setRep_Answer(int rep_Answer) {
		this.rep_Answer = rep_Answer;
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

	public String getRep_Content() {
		return rep_Content;
	}

	public void setRep_Content(String rep_Content) {
		this.rep_Content = rep_Content;
	}

	public String getRep_Created() {
		return rep_Created;
	}

	public void setRep_Created(String rep_Created) {
		this.rep_Created = rep_Created;
	}

	public int getAnswerCount() {
		return answerCount;
	}

	public void setAnswerCount(int answerCount) {
		this.answerCount = answerCount;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public int getDisLikeCount() {
		return disLikeCount;
	}

	public void setDisLikeCount(int disLikeCount) {
		this.disLikeCount = disLikeCount;
	}
	
	
}
