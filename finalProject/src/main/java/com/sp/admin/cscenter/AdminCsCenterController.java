package com.sp.admin.cscenter;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("adminCsCenterController")
public class AdminCsCenterController {
	@RequestMapping(value="/admin/cscenter", method=RequestMethod.GET)
	public String cscenterForm(Model model) {
		
		model.addAttribute("mainMenu", "3");
		return ".admin4.menu4.cscenter.list";
	}
}
