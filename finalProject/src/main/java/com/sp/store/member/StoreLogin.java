package com.sp.store.member;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("storeLoginController")
public class StoreLogin {
	
	@RequestMapping(value="/store/login", method=RequestMethod.GET)
	public String storeLoginForm(){
		return "store/store/login";
	}
	
	@RequestMapping(value="/store/login", method=RequestMethod.POST)
	public String storeLoginSubmit(Model model){
		model.addAttribute("mainMenu", "0");
		return ".store3.store.main";
	}
	
	@RequestMapping(value="/store/myStore	", method=RequestMethod.GET)
	public String myPageControllForm(Model model) {
		model.addAttribute("mainMenu", "0");
		return ".store4.menu1.myStore.myPage";
	}
	
	@RequestMapping(value="/store/giup", method=RequestMethod.GET)
	public String giupControllForm(Model model) {
		
		model.addAttribute("mainMenu", "1");
		return ".store4.menu2.giup.list";
	}
	
	@RequestMapping(value="/store/event", method=RequestMethod.GET)
	public String eventForm(Model model) {
		
		model.addAttribute("mainMenu", "2");
		return ".store4.menu3.event.list";
	}
	
	@RequestMapping(value="/store/cscenter", method=RequestMethod.GET)
	public String cscenterForm(Model model) {
		
		model.addAttribute("mainMenu", "3");
		return ".store4.menu4.cscenter.list";
	}
}
