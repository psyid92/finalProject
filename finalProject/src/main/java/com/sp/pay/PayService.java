package com.sp.pay;

import java.util.List;
import java.util.Map;

public interface PayService {
	public List<Pay> listPay (Map<String, Object> map) throws Exception;
}
