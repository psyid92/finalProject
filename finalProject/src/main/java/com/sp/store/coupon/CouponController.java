package com.sp.store.coupon;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("coupon.couponController")
public class CouponController {
	
	// 메뉴2
	@RequestMapping(value = "/store/insertAdvertise", method = RequestMethod.GET)
	public String insertAdvertise(Model model) {
		
		model.addAttribute("mainMenu", "1");
		model.addAttribute("subMenu", "1");
		return ".store4.menu2.insertAdvertise.list";
		
	}
	
	@RequestMapping(value = "/store/jumunAdvertise", method = RequestMethod.GET)
	public String jumunAdvertise(Model model) {

		model.addAttribute("mainMenu", "1");
		model.addAttribute("subMenu", "1");
		return ".store4.menu2.jumunAdvertise.list";
	}
	
	@RequestMapping(value = "/store/listAdvertise", method = RequestMethod.GET)
	public String coupon2Form(Model model) {

		model.addAttribute("mainMenu", "1");
		model.addAttribute("subMenu", "2");
		return ".store4.menu2.listAdvertise.list";
	}
	
}
