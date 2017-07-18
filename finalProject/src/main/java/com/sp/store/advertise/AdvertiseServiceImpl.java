package com.sp.store.advertise;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;
import com.sp.jumun.Jumun;

@Service("advertise.advertiseService")
public class AdvertiseServiceImpl implements AdvertiseService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Advertise> listAdvertise() throws Exception {
		List<Advertise> list = new ArrayList<>();
		try {
			list = dao.getListData("advertise.listAdvertise");
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

	@Override
	public List<Jumun> wayList() throws Exception {
		List<Jumun> list = new ArrayList<>();
		try {
			list = dao.getListData("jumun.listPayMethod");
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

	@Override
	public int insertGiupAd(Advertise dto) throws Exception {
		int result = 0;
		try {
			result = dao.insertData("advertise.insertGiupAd", dto);
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

	@Override
	public int readGiupAd(int g1_Num) throws Exception {
		int result = 0;
		try {
			result = dao.getReadData("advertise.readGiupAd", g1_Num);
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

	@Override
	public List<Advertise> listGiupAd(Map<String, Object> map) throws Exception {
		List<Advertise> list = new ArrayList<>();
		try {
			list = dao.getListData("advertise.listGiupAd",map);
		} catch (Exception e) {
			throw e;
 		}
		return list;
	}

	@Override
	public int dataCount(int g1_Num) throws Exception {
		int result = 0;
		try {
			result = dao.getIntValue("advertise.dataCount",g1_Num);
		} catch (Exception e) {
			throw e;
		}
		return result;
	}
}
