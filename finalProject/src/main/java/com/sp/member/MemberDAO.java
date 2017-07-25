package com.sp.member;

import java.util.List;
import java.util.Map;

import com.sp.giupReview.giupReview;
import com.sp.jumun.JumunMember;
import com.sp.mileage.Mileage;
import com.sp.userQna.UserQna;

public interface MemberDAO {
	
//	회원
	public int insertMember(Member1 dto) throws Exception;
	public int deleteMember(Member1 dto) throws Exception;
	public int updateMember(Member1 dto) throws Exception;
	public int getLogin(String userId, String userPWd) throws Exception;
	public String getMyEmail(Map<String, Object> map) throws Exception;
	public int getMyPassword(Map<String, Object> map) throws Exception;
	
	public int checkEmail(String m1_email) throws Exception; 
	
	public int newLogin(String m1_email) throws Exception;
	public Member1 getMember(String m1_email)  throws Exception;
	public int passCheck(Member1 dto) throws Exception;
	public int changePass(Member1 dto) throws Exception;
	public int removeAccount(Member1 dto)throws Exception;
	public int deleteAccount(Member1 dto) throws Exception;
	
	
//	찜한 기업
	public int insertLikeGiup(LikeGiup giup) throws Exception;
	public int deleteLikeGiup(LikeGiup giup) throws Exception;
	public List<LikeGiup> listLikeGiup(Map<String, Object> map) throws Exception;
	
	
//	리뷰
	public int getNumReview(Map<String, Object> map) throws Exception;
	public List<giupReview> getReviewList(int m1_num) throws Exception;
	
//	QNA
	public List<UserQna> memberQNAList(int m1_num) throws Exception;

//	주문
	public List<JumunMember> getMemberOneList(int m1_num) throws Exception;
	
//	마일리지
	public List<Mileage> getMileageOneList(int m1_num) throws Exception;
}
