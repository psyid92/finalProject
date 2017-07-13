package com.sp.store.mystore;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("store.mystore.myStoreStatServiceImpl")
public class MyStoreStatServiceImpl implements MyStoreStatService{
	@Autowired
	CommonDAO dao;
	
	@Override
	public List<MyStoreStat> paySumList(int g1_num) throws Exception {
		List<MyStoreStat> list=new ArrayList<>();
		
		try {
			list = dao.getListData("storStat.paySum", g1_num);
		} catch (Exception e) {
			throw e;
		}
		
		return list;
	}

}
