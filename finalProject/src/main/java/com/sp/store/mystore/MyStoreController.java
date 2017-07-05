package com.sp.store.mystore;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("mystore.myStoreController")
public class MyStoreController {
	
	// 메뉴1
	@RequestMapping(value = "/store/mystore", method = RequestMethod.GET)
	public String mystoreForm(Model model) {

		model.addAttribute("mainMenu", "0");
		model.addAttribute("subMenu", "1");
		return ".store4.menu1.mystore.list";
	}
	@RequestMapping(value = "/store/review", method = RequestMethod.GET)
	public String reviewForm(Model model) {

		model.addAttribute("mainMenu", "0");
		model.addAttribute("subMenu", "2");
		return ".store4.menu1.review.list";
	}

	@RequestMapping(value = "/store/menu", method = RequestMethod.GET)
	public String menuForm(Model model) {

		model.addAttribute("mainMenu", "0");
		model.addAttribute("subMenu", "3");
		return ".store4.menu1.menu.list";
	}

	
}
