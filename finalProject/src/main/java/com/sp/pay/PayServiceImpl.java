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
	public List<Pay> listPay(Map<String, Object> map) throws Exception {
		List<Pay> list = new ArrayList<>();
		try {
			list = dao.getListData("pay.listPay", map);
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

}
