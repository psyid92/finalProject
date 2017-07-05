package com.sp.store.storecscenter;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("storecscenter.storeCSController")
public class StoreCSController {

	// 메뉴3
	@RequestMapping(value = "/store/cscenter", method = RequestMethod.GET)
	public String cscenterForm(Model model) {

		model.addAttribute("mainMenu", "2");
		return ".store4.menu3.cscenter.list";
	}
}
