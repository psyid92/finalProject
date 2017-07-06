package com.sp.pay;

public interface PayService {
	public void insertJumun(Pay dto) throws Exception;
	public void insertMainGoods(Pay dto) throws Exception;
	public void insertSubGoods(Pay dto) throws Exception;
	public void insertPay(Pay dto) throws Exception;
}
