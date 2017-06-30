package com.sp.pay;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("pay.payService")
public class PayServiceImpl implements PayService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Pay> listGiup(Map<String, Object> map) throws Exception {
		List<Pay> list = new ArrayList<>();
		try {
			list = dao.getListData("pay.listGiup", map);
		} catch (Exception e) {
			throw e;
		}
		return list;
	}
	
	@Override
	public List<Pay> readMenuCategory(int g1_Num) throws Exception {
		List<Pay> list = new ArrayList<>();
		try {
			list = dao.getListData("pay.readMenuCategory", g1_Num);
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

	@Override
	public List<Pay> readMainMenu(int menuct_Num) throws Exception {
		List<Pay> list = new ArrayList<>();
		try {
			list = dao.getListData("pay.readMainMenu", menuct_Num);
		} catch (Exception e) {
			throw e;
		}
		return list;
	}


}
