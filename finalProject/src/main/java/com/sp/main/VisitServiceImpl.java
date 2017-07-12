package com.sp.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("visitService")
public class VisitServiceImpl implements VisitService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public int getVisit() throws Exception {
		int result = 0;
		try {
			result = dao.getReadData("visit.getTodayVisit");
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public int insertVisit() throws Exception {
		int result = 0;
		try {
			result = dao.insertData("visit.insertTodayVisit", null);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public int updateVisit() throws Exception {
		int result = 0;
		try {
			result = dao.updateData("visit.updateTodayVisit", null);
		} catch (Exception e) {
		}
		return result;
	}

	/* -------------------------------------------------------
	 * 여기가 메인 메소드
	 */
	@Override
	public int checkVisit() throws Exception {
		int result=0, method = 0;
		
		try {
			method = getVisit();
			if (method < 1){
				insertVisit();
			}
			result = updateVisit();
			
		} catch (Exception e) {
		}
		
		return result;
	}

}
