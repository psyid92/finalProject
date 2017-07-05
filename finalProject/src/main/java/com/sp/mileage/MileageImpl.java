package com.sp.mileage;

import org.springframework.beans.factory.annotation.Autowired;

import com.sp.common.dao.CommonDAO;

public class MileageImpl implements MileageDAO{

	@Autowired
	private CommonDAO  dao;
	
	
	@Override
	public int getMemberMileage(String m1_email) throws Exception {
		int result = 0;
		try {
			result = dao.getReadData("mileage.getMemberMileage", m1_email);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}

}
