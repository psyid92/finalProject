package com.sp.mileage;

import java.util.List;
import java.util.Map;

public interface MileageDAO {
	public int insertMileage(Mileage dto) throws Exception;
	public int updateStateMileage(Mileage dto) throws Exception;
	public int deleteMileage(Mileage dto) throws Exception;
	
	public int getMemberMileage(String m1_email) throws Exception;
	public List<Mileage> getMileageList(Map<String, Object> map) throws Exception;
	

}
