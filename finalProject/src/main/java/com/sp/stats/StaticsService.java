package com.sp.stats;

import java.util.List;

import org.springframework.stereotype.Service;


public interface StaticsService {
	
	/* 방문자 수 가져오기 */
	public List<VisitCount> getVisitCount(int num) throws Exception;
	public int getVisitCount() throws Exception;

}
