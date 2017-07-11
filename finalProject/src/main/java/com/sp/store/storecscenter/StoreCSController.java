package com.sp.store.storecscenter;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("storecscenter.storeCSController")
public class StoreCSController {

	// 메뉴3
	/*@RequestMapping(value = "/store/giupNotice", method = RequestMethod.GET)
	public String cscenter1Form(Model model) {

		model.addAttribute("mainMenu", "3");
		model.addAttribute("subMenu", "1");
		return ".store4.menu4.giupNotice.list";
	}*/
	
	@RequestMapping(value = "/store/giupFaq", method = RequestMethod.GET)
	public String cscenter2Form(Model model) {

		model.addAttribute("mainMenu", "3");
		model.addAttribute("subMenu", "2");
		return ".store4.menu4.giupFAQ.list";
	}
	
	@RequestMapping(value = "/store/giupQna", method = RequestMethod.GET)
	public String cscenter3Form(Model model) {

		model.addAttribute("mainMenu", "3");
		model.addAttribute("subMenu", "3");
		return ".store4.menu4.giupQna.list";
	}
}
