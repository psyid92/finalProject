package com.sp.pay;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("pay.payController")
public class PayController {
	@Autowired
	private PayService service;
	
	@RequestMapping(value="/pay/success", method=RequestMethod.POST)
	public String paySuccess(Pay dto, String main_Nums, String sub_Nums) throws Exception {
		String []main_Num = main_Nums.split(",");
		String []sub_Num = sub_Nums.split(",");
		service.insertJumun(dto);
		System.out.println(dto.getJumun_Pay());
		return ".pay.success";
	}
}