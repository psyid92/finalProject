package com.sp.pay;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("pay.payController")
public class PayController {
	@Autowired
	private PayService service;
	
	@RequestMapping(value="/pay/pay", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> paySuccess(Pay dto, String main_Nums, String sub_Nums) throws Exception {
		Map<String, Object> model = new HashMap<>();
		String []main_Num = main_Nums.split(",");
		String []sub_Num = sub_Nums.split(",");
		dto.setOrders_Num(3);
		
		service.insertJumun(dto);
		for (int i = 0; i < main_Num.length; i++) {
			dto.setMainmenu_Num(Integer.parseInt(main_Num[i]));
			dto.setMainGoods_Count(1);
			service.insertMainGoods(dto);
			if (sub_Num != null && sub_Num.length > 0 && sub_Num[i] != null && sub_Num[i].length() > 0) {
				dto.setSubmenu_Num(Integer.parseInt(sub_Num[i]));
				service.insertSubGoods(dto);
			}
		}
		dto.setPay_Pay(dto.getJumun_Pay());
		dto.setPayMethod_Num(1);
		service.insertPay(dto);
		
		return model;
	}
}
