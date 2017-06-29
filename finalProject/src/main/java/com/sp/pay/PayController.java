package com.sp.pay;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("pay.payController")
public class PayController {
	
	@RequestMapping("/pay/pay")
	public String menuList(String menu, Model model) throws Exception {
		model.addAttribute("menu", menu);
		model.addAttribute("mode", null);
		return ".jumun.menu";
	}
}
