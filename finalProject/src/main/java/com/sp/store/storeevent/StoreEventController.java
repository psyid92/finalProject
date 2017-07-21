package com.sp.store.storeevent;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("storeevent.storeEventController")
public class StoreEventController {

	//판매자화면(기업이벤트)
	@RequestMapping(value = "/store/event1", method = RequestMethod.GET)
	public String event1Form(Model model) {

		model.addAttribute("mainMenu", "2");
		model.addAttribute("subMenu", "1");
		return ".store4.menu3.event1.list";
	}
	
	//어드민화면(기업이벤트)
	@RequestMapping(value = "/admin/giupevent", method = RequestMethod.GET)
	public String giupEventList(Model model) {

		model.addAttribute("mainMenu", "2");
		model.addAttribute("subMenu", "2");
		return ".admin4.menu3.giupevent.list";
	}
	
	
}
