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
		return ".store4.menu1.mystore.list";
	}

}
