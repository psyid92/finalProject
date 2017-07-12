package com.sp.admin.giup;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

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

}
