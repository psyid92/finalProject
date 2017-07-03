package com.sp.admin.giup;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//기업관리 컨트롤러

@Controller("admin.adminGiupController")
public class AdminGiupController {
	@RequestMapping(value="/admin/giupcontroll", method=RequestMethod.GET)
	public String giupControllList(Model model) {
		
		model.addAttribute("mainMenu", "1");
		model.addAttribute("subMenu", "1");
		return ".admin4.menu2.giupcontroll.list";
	}
	
	@RequestMapping(value="/admin/giupreviewcontroll", method=RequestMethod.GET)
	public String giupReviewList(Model model) {
		
		model.addAttribute("mainMenu", "1");
		model.addAttribute("subMenu", "2");
		return ".admin4.menu2.giupreviewcontroll.list";
	}
	
	@RequestMapping(value="/admin/giupcscentercontroll", method=RequestMethod.GET)
	public String giupcscenterList(Model model) {
		
		model.addAttribute("mainMenu", "1");
		model.addAttribute("subMenu", "3");
		return ".admin4.menu2.giupcscentercontroll.list";
	}
	
	@RequestMapping(value="/admin/giupmenucontroll", method=RequestMethod.GET)
	public String giupmenuList(Model model) {
		
		model.addAttribute("mainMenu", "1");
		model.addAttribute("subMenu", "4");
		return ".admin4.menu2.giupmenucontroll.list";
	}
	
}
