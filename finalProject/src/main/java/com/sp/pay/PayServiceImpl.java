package com.sp.pay;

import java.util.Map;

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
	
	@Override
	public void insertMileage(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("pay.insertMileage", map);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public void useMemberMileage(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("pay.useMemberMileage", map);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public void earnMemberMileage(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("pay.earnMemberMileage", map);
		} catch (Exception e) {
			throw e;
		}

	}
}
