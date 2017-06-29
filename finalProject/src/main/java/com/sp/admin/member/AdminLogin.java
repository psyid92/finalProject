package com.sp.admin.member;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

// 어드민 페이지 컨트롤러

@Controller("adminLoginController")
public class AdminLogin {
	
	@RequestMapping(value="/admin/login", method=RequestMethod.GET)
	public String adminLoginForm(){
		return "admin/admin/login";
	}
	
	/*@RequestMapping(value="/admin/login", method=RequestMethod.POST)
	public String adminLoginSubmit(Model model){
		model.addAttribute("mainMenu", "0");
		return ".admin4.menu1.giuppage.list";
	}*/
	
	@RequestMapping("/admin/logout")
	public String adminLogoutForm(){
		return "admin/admin/login";
	}
	
	
	@RequestMapping(value="/admin/membercontroll", method=RequestMethod.GET)
	public String memberControllForm(Model model) {
		
		model.addAttribute("mainMenu", "0");
		return ".admin4.menu4.membercontroll.list";
	}
	
	@RequestMapping(value="/admin/giupcontroll", method=RequestMethod.GET)
	public String giupControllForm(Model model) {
		
		model.addAttribute("mainMenu", "1");
		return ".admin4.menu5.giupcontroll.list";
	}
	
	@RequestMapping(value="/admin/event", method=RequestMethod.GET)
	public String eventForm(Model model) {
		
		model.addAttribute("mainMenu", "2");
		return ".admin4.menu2.event.list";
	}
	
	@RequestMapping(value="/admin/cscenter", method=RequestMethod.GET)
	public String cscenterForm(Model model) {
		
		model.addAttribute("mainMenu", "3");
		return ".admin4.menu3.cscenter.list";
	}
	

}
