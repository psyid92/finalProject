package com.sp.admin.member;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("adminLoginController")
public class AdminLogin {
	
	@RequestMapping(value="/admin/login", method=RequestMethod.GET)
	public String adminLoginForm(){
		return "admin/admin/login";
	}
	
	@RequestMapping(value="/admin/login", method=RequestMethod.POST)
	public String adminLoginSubmit(Model model){
		model.addAttribute("mainMenu", "0");
		return ".admin4.menu1.member.list";
	}
	
	@RequestMapping(value="/admin/member", method=RequestMethod.GET)
	public String memberControllForm(Model model) {
		model.addAttribute("mainMenu", "0");
		return ".admin4.menu1.member.list";
	}
	
	@RequestMapping(value="/admin/giup", method=RequestMethod.GET)
	public String giupControllForm(Model model) {
		
		model.addAttribute("mainMenu", "1");
		return ".admin4.menu2.giup.list";
	}
	
	@RequestMapping(value="/admin/event", method=RequestMethod.GET)
	public String eventForm(Model model) {
		
		model.addAttribute("mainMenu", "2");
		return ".admin4.menu3.event.list";
	}
	
	@RequestMapping(value="/admin/cscenter", method=RequestMethod.GET)
	public String cscenterForm(Model model) {
		
		model.addAttribute("mainMenu", "3");
		return ".admin4.menu4.cscenter.list";
	}
}
