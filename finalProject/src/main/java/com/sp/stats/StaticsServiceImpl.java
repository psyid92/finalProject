package com.sp.stats;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.sp.common.dao.CommonDAO;

public class StaticsServiceImpl implements StaticsService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<VisitCount> getVisitCount(int num) throws Exception {
		List<VisitCount> list = new ArrayList<>();
		try {
			list = dao.getListData("stats.visitCounter", num);
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public int getVisitCount() throws Exception {
		int result = 0;
		try {
			result = dao.getReadData("stats.allVisitCounter");
		} catch (Exception e) {
		}
		return result;
	}


}
