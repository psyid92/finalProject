package com.sp.store.storeevent;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("storeevent.storeEventController")
public class StoreEventController {
	
	// 메뉴2
	@RequestMapping(value = "/store/event1", method = RequestMethod.GET)
	public String event1Form(Model model) {

		model.addAttribute("mainMenu", "2");
		model.addAttribute("subMenu", "1");
		return ".store4.menu3.event1.list";
	}
	
	@RequestMapping(value = "/store/event2", method = RequestMethod.GET)
	public String event2Form(Model model) {

		model.addAttribute("mainMenu", "2");
		model.addAttribute("subMenu", "2");
		return ".store4.menu3.event2.list";
	}
	
	@RequestMapping(value = "/store/event3", method = RequestMethod.GET)
	public String event3Form(Model model) {

		model.addAttribute("mainMenu", "2");
		model.addAttribute("subMenu", "3");
		return ".store4.menu3.event3.list";
	}
}
