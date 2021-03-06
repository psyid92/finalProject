package com.sp.admin.giup;

import java.util.List;
import java.util.Map;

import com.sp.member.Member1;

public interface AdminGiupService {
	public List<AdminGiup> listAdminGiup(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public AdminGiup readAdminGiup(int num);
	
	//MemberList 가져오는 메소드
	public int getAllMemberNum(Map<String, Object> map) throws Exception;
	public List<Member1> getAllListMember(Map<String, Object> map) throws Exception;
	public Member1 getMemberDetail(Map<String, Object> map) throws Exception; 
	
	//기업리뷰 list
	public List<AdminGiup> listGiupReview(Map<String, Object> map) throws Exception;
	//기업리뷰 COUNT
	public int countGiupReview(Map<String, Object> map) throws Exception;
	
}
