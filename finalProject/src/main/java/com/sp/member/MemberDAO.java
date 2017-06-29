package com.sp.member;

import java.util.List;

public interface MemberDAO {
	
//	회원
	public int insertMember(Member1 dto) throws Exception;
	public int deleteMember(Member1 dto) throws Exception;
	public int updateMember(Member1 dto) throws Exception;
	public int getLogin(String userId, String userPWd) throws Exception;
	
	public int checkEmail(String m1_email) throws Exception; 
	
	public int newLogin(String m1_email) throws Exception;
	public Member1 getMember(String m1_email)  throws Exception;
	public int passCheck(Member1 dto) throws Exception;
	
	
//	찜한 기업
	public int insertLikeGiup(LikeGiup giup) throws Exception;
	public int deleteLikeGiup(LikeGiup giup) throws Exception;
	public List<LikeGiup> listLikeGiup(String m1_email) throws Exception;

}
