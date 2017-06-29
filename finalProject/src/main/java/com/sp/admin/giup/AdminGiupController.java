package com.sp.admin.giup;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("adminGiupController")
public class AdminGiupController {
	@RequestMapping(value="/admin/giupcontroll", method=RequestMethod.GET)
	public String giupControllForm(Model model) {
		
		model.addAttribute("mainMenu", "1");
		return ".admin4.menu2.giupcontroll.list";
	}
}
