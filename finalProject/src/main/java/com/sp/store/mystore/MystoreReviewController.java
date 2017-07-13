package com.sp.store.mystore;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("mystore.myStoreReviewController")
public class MystoreReviewController{
	
	@RequestMapping(value = "/store/review", method = RequestMethod.GET)
	public String reviewForm(Model model, HttpSession session) {

		model.addAttribute("mainMenu", "0");
		model.addAttribute("subMenu", "2");
		return ".store4.menu1.review.list";
	}
}