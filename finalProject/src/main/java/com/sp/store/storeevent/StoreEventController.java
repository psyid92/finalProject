package com.sp.store.storeevent;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("storeevent.storeEventController")
public class StoreEventController {
	
	// 메뉴2
	@RequestMapping(value = "/store/event", method = RequestMethod.GET)
	public String eventForm(Model model) {

		model.addAttribute("mainMenu", "1");
		return ".store4.menu2.event.list";
	}
}
