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
			int seq = dao.getReadData("member.getMemberSeq");
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
			result = dao.getReadData("member.checkPwd", dto);
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
			dao.updateData("member.updateMember1", dto);
			dao.updateData("member.updateMember2", dto);
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
			result = dao.updateData("member.newLogin", m1_email);
		} catch (Exception e) {
		}
		
		return result;
	}


	//이메일 중복 체크
	@Override
	public int checkEmail(String m1_email) throws Exception {
		int result = 0;
		try {
			result = dao.getReadData("member.checkEmail", m1_email);
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
		Member1 member = dao.getReadData("member.login", mymember);
		if(member != null) {
			newLogin(member.getM1_email());
			result = 1;
		}
		
		return result;
	}

	//멤버 읽어오기
	@Override
	public Member1 getMember(String m1_email) throws Exception {
		Member1 dto = dao.getReadData("member.getMember", m1_email);
		return dto;
	}

	//비밀번호 변경 하기
		@Override
		public int changePass(Member1 dto) throws Exception {
			int result = 0;
			result=dao.updateData("member.updatePwd", dto);
			return result;
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
			result = dao.insertData("member.memberiLikegiup", giup);
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
			result = dao.insertData("member.idontlikegiup", giup);
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
			list = dao.getListData("member.listLikegiup", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	

}
