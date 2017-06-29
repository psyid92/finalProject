package com.sp.member;

public interface MemberDAO {
	public int insertMember(Member1 dto) throws Exception;
	public int updateMember(Member1 dto) throws Exception;
	public int deleteMember(Member1 dto) throws Exception;
	public int getLogin(String userId, String userPWd) throws Exception;
	
	public int checkEmail(String m1_email) throws Exception; 
	
	public int newLogin(String m1_email) throws Exception;
	public Member1 getMember(String m1_email)  throws Exception;

}
