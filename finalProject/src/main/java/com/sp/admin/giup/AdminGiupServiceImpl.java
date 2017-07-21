package com.sp.admin.giup;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;
import com.sp.member.Member1;

@Service("admin.adminGiupService")
public class AdminGiupServiceImpl implements AdminGiupService{
	@Autowired
	private CommonDAO dao;
	
	
	@Override
	public List<AdminGiup> listAdminGiup(Map<String, Object> map) {
		List<AdminGiup> list = null;
		
		try {
			list=dao.getListData("admingiup.listGiup", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.getIntValue("admingiup.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public AdminGiup readAdminGiup(int num) {
		AdminGiup dto=null;
		
		try {
			dto=dao.getReadData("admingiup.readGiup", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}

	//MemberList 가져오기
	@Override
	public List<Member1> getAllListMember(Map<String, Object> map) throws Exception {
		List<Member1> list = new ArrayList<>();
		try {
			list = dao.getListData("member.getAllListMember",map);
		} catch (Exception e) {
		}
		return list;
	}

	//멤버 총 수 세기
	@Override
	public int getAllMemberNum(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result = dao.getReadData("member.getAllMemberNum", map);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public List<AdminGiup> listGiupReview(Map<String, Object> map) throws Exception {
		List<AdminGiup> list = new ArrayList<>();
		try {
			list = dao.getListData("admingiup.listGiupReview", map);
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

	@Override
	public int countGiupReview(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result = dao.getIntValue("admingiup.countGiupReview", map);
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

}
