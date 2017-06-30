package com.sp.member;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
			int seq = dao.getReadData("getMemberSeq");
			dto.setM1_num(seq);
			dao.insertData("insertMember1", dto);
			dao.insertData("insertMember2", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	//비밀번호 체크
	@Override
	public int passCheck(Member1 dto) throws Exception {
		int result = 0;
		try {
			result = dao.getReadData("checkPwd", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

		
	//회원정보 수정
	@Override
	public int updateMember(Member1 dto) throws Exception {
		int result = 0;
		try {
			dao.updateData("updateMember1", dto);
			dao.updateData("updateMember2", dto);
		} catch (Exception e) {
		}
		return result;
	}

	//회원 삭제
	@Override
	public int deleteMember(Member1 dto) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	//lastlongin 수정
	@Override
	public int newLogin(String m1_email) throws Exception {
		int result = 0;
		try {
			result = dao.updateData("newLogin", m1_email);
		} catch (Exception e) {
		}
		
		return result;
	}


	//이메일 중복 체크
	@Override
	public int checkEmail(String m1_email) throws Exception {
		int result = 0;
		try {
			result = dao.getReadData("checkEmail", m1_email);
		} catch (Exception e) {
		}
		return result;
	}

	//로그인 하기
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

	//멤버 읽어오기
	@Override
	public Member1 getMember(String m1_email) throws Exception {
		Member1 dto = dao.getReadData("getMember", m1_email);
		return dto;
	}

	
	
	
	
	/*
	 * ----------------------------------------------------------------------------------------
	 * -----------------------------------------------------------------------------------------
	 * 							기업 좋아요 버튼 / 찜하기 버튼
	 */
	
	//좋아요 버튼
	@Override
	public int insertLikeGiup(LikeGiup giup) throws Exception {
		int result = 0;
		try {
			result = dao.insertData("iLikegiup", giup);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	
	//좋아요 취소
	@Override
	public int deleteLikeGiup(LikeGiup giup) throws Exception {
		int result = 0;
		try {
			result = dao.insertData("idontlikegiup", giup);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	//좋아요 리스트
	@Override
	public List<LikeGiup> listLikeGiup(Map<String, Object> map) throws Exception {
		List<LikeGiup> list = null;
		
		try {
			list = dao.getListData("listLikegiup", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	

	

}
