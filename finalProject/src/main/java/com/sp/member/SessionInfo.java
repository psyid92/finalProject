package com.sp.member;

public class SessionInfo {
	private String userId;
	private String userName;
	private int memberLevel;
	private int m1_Num;
	private String check_visit;
	
	
	
	
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
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getMemberLevel() {
		return memberLevel;
	}
	public void setMemberLevel(int memberLevel) {
		this.memberLevel = memberLevel;
	}
	public String getCheck_visit() {
		return check_visit;
	}
	public void setCheck_visit(String check_visit) {
		this.check_visit = check_visit;
	}
	
}
