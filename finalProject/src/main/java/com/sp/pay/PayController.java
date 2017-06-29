package com.sp.pay;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("pay.payController")
public class PayController {
	@Autowired PayService service;
	
	@RequestMapping(value="/pay/payList", method=RequestMethod.GET)
	public String payList(String category, Model model) throws Exception {
		List<Pay> list = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		int start = 1;
		int end = 10;
		
		map.put("category", category);
		map.put("start", start);
		map.put("end", end);
		
		list = service.listPay(map);
		model.addAttribute("category", category);
		model.addAttribute("mode", null);
		model.addAttribute("list", list);
		return ".jumun.menu";
	}
	
	@RequestMapping(value="/pay/article", method=RequestMethod.GET)
	public String article(int g1_Num, Model model) throws Exception {
		model.addAttribute("g1_Num", g1_Num);
		return ".jumun.article";
	}
	
}
