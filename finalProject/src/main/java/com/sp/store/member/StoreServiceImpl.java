package com.sp.store.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("store.member.storeService")
public class StoreServiceImpl implements StoreService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertStore(Store dto) throws Exception {
		int result = 0;
		try {
			if(dto.getTel1() != null && dto.getTel1().length()!=0 &&
					dto.getTel2() != null && dto.getTel2().length()!=0 &&
					dto.getTel3() != null && dto.getTel3().length()!=0)
				dto.setG2_tel(dto.getTel1() + "-" + dto.getTel2() + "-" + dto.getTel3());
			
			dao.insertData("store.insertStore", dto);
			
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

	@Override
	public void readStore(String g1_Id) throws Exception {
		try {
			
			
		} catch (Exception e) {
			throw e;
		}
	}
}
