package com.sp.mileage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("mileage.mileageService")
public class MileageImpl implements MileageDAO{

	@Autowired
	private CommonDAO  dao;
	
	//마일리지 포인트 가져오기
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

	//마일리지 내역 가져오기
	@Override
	public List<Mileage> getMileageList(Map<String, Object> map) throws Exception  {
		List<Mileage> list = dao.getListData("mileage.listMileage",map);
		return list;
	}

	//마일리지 등록
	@Override
	public int insertMileage(Mileage dto) throws Exception {
		int result = 0;
		try {
			result = dao.insertData("mileage.insertMileage", dto);
		} catch (Exception e) {
		}
		return result;
	}

	//마일리지 상태 변경
	/*
	 *  ---------------- Trigger : update -> "적립 취소"|"사용 취소" 변경시 마일리지 자동 변경
	 */
	@Override
	public int updateStateMileage(Mileage dto) throws Exception {
		int result = 0;
		try {
			result = dao.insertData("mileage.updateMileageState", dto);
		} catch (Exception e) {
		}
		return result;
	}

	//마일리지 내역 삭제
	@Override
	public int deleteMileage(Mileage dto) throws Exception {
		int result = 0;
		try {
			result = dao.deleteData("mileage.deleteMileage", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
