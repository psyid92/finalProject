package com.sp.member;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("member.memberService")
public class MemberImpl implements MemberDAO{
	
	@Autowired
	private CommonDAO  dao;
	
	//회원가입
	@Override
	public int insertMember(Member1 dto) throws Exception {
		int result = 0;
		
		try {
			dao.insertData("insertMember1", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	//회원정보 수정
	@Override
	public int updateMember(Member1 dto) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	//회원 삭제
	@Override
	public int deleteMember(Member1 dto) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
	@Override
	public int newLogin(String m1_email) throws Exception {
		int result = 0;
		try {
			result = dao.updateData("newLogin", m1_email);
		} catch (Exception e) {
		}
		
		return result;
	}


	@Override
	public int checkEmail(String m1_email) throws Exception {
		int result = 0;
		try {
			result = dao.getReadData("checkEmail", m1_email);
			System.out.println(result);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public int getLogin(String userId, String userPWd) throws Exception {
		int result = 0;
		
		Member1 mymember = new Member1();
		mymember.setM1_email(userId);
		mymember.setM1_pwd(userPWd);
		Member1 member = dao.getReadData("login", mymember);
		if(member != null) {
			newLogin(member.getM1_email());
			result = 1;
		}
		
		return result;
	}


}
