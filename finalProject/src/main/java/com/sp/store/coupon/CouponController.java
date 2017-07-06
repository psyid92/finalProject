package com.sp.store.coupon;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("coupon.couponController")
public class CouponController {
	
	// 메뉴2
	@RequestMapping(value = "/store/coupon1", method = RequestMethod.GET)
	public String coupon1Form(Model model) {

		model.addAttribute("mainMenu", "1");
		model.addAttribute("subMenu", "1");
		return ".store4.menu2.coupon1.list";
	}
	
	@RequestMapping(value = "/store/coupon2", method = RequestMethod.GET)
	public String coupon2Form(Model model) {

		model.addAttribute("mainMenu", "1");
		model.addAttribute("subMenu", "2");
		return ".store4.menu2.coupon2.list";
	}
	
	@RequestMapping(value = "/store/coupon3", method = RequestMethod.GET)
	public String coupon3Form(Model model) {

		model.addAttribute("mainMenu", "1");
		model.addAttribute("subMenu", "3");
		return ".store4.menu2.coupon3.list";
	}
}
