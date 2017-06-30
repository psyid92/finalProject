package com.sp.admin.event;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

// 이벤트 컨트롤러

@Controller("admin.adminEventController")
public class AdminEventController {
	@RequestMapping(value="/admin/event", method=RequestMethod.GET)
	public String eventList(Model model) {
		
		model.addAttribute("mainMenu", "2");
		return ".admin4.menu3.event.list";
	}
}
