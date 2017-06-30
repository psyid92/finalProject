package com.sp.pay;

import java.util.List;
import java.util.Map;

public interface PayService {
	public List<Pay> listGiup (Map<String, Object> map) throws Exception;
	public List<Pay> readMenuCategory (int g1_Num) throws Exception;
	public List<Pay> readMainMenu (int menuct_Num) throws Exception;
	
}
