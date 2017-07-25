package com.sp.store.mystoreCTR;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("store.mystore.myStoreCTRServiceImpl")
public class MyStoreCTRServiceImpl implements MyStoreCTRService {
	@Autowired
	CommonDAO dao;
	
	@Override
	public List<MyStoreCTR> jumunList(MyStoreCTR dto) throws Exception {
		List<MyStoreCTR> list=new ArrayList<>();
		
		try {
			list = dao.getListData("storeCTR.jumunList", dto);
		} catch (Exception e) {
			throw e;
		}
		
		return list;
	}

}
