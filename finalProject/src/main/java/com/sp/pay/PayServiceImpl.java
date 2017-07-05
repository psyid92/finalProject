package com.sp.pay;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("pay.payService")
public class PayServiceImpl implements PayService {
	@Autowired
	private CommonDAO dao;

	@Override
	public void insertJumun(Pay dto) throws Exception {
		try {
			dao.insertData("pay.insertJumun", dto);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public void insertMainGoods(Pay dto) throws Exception {
		try {
			dao.insertData("pay.insertMainGoods", dto);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public void insertSubGoods(Pay dto) throws Exception {
		try {
			dao.insertData("pay.insertSubGoods", dto);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public void insertPay(Pay dto) throws Exception {
		try {
			dao.insertData("pay.insertPay", dto);
		} catch (Exception e) {
			throw e;
		}
	}
}
