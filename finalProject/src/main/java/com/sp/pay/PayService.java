package com.sp.pay;

import java.util.Map;

public interface PayService {
	public void insertJumun(Pay dto) throws Exception;
	public void insertMainGoods(Pay dto) throws Exception;
	public void insertSubGoods(Pay dto) throws Exception;
	public void insertPay(Pay dto) throws Exception;
	public void insertMileage(Map<String, Object> map) throws Exception; 
	public void useMemberMileage(Map<String, Object> map) throws Exception;
	public void earnMemberMileage(Map<String, Object> map) throws Exception;
}
