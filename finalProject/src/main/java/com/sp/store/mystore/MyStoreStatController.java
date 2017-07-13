package com.sp.store.mystore;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("mystore.myStoreStatController")
public class MyStoreStatController {
	
	// 메뉴1
		@RequestMapping(value = "/store/mystore", method = RequestMethod.GET)
		public String mystoreForm(Model model, HttpSession session) {

			model.addAttribute("mainMenu", "0");
			model.addAttribute("subMenu", "1");
			return ".store4.menu1.mystore.list";
		}
}
