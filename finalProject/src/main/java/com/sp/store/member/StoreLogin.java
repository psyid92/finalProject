package com.sp.store.member;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//사장님 페이지 컨트롤러

@Controller("storeLoginController")
public class StoreLogin {
	//로그인창으로 이동
	@RequestMapping(value="/store/login", method=RequestMethod.GET)
	public String storeLoginForm(){
		return "store/store/login";
	}
	//로그인시 
	@RequestMapping(value="/store/login", method=RequestMethod.POST)
	public String storeLoginSubmit(Model model){
		
		model.addAttribute("mainMenu", "0");
		return ".store4.menu1.mystore.list";
	}
	//회원가입 폼
	@RequestMapping(value="/store/member", method=RequestMethod.GET)
	public String memberForm(Model model){
		
		model.addAttribute("mode", "created");
		return ".store.store.member";
	}
	//메뉴1
	@RequestMapping(value="/store/mystore", method=RequestMethod.GET)
	public String mystoreForm(Model model) {
		
		model.addAttribute("mainMenu", "0");
		return ".store4.menu1.mystore.list";
	}
	//메뉴2
	@RequestMapping(value="/store/event", method=RequestMethod.GET)
	public String eventForm(Model model) {
		
		model.addAttribute("mainMenu", "1");
		return ".store4.menu2.event.list";
	}
	//메뉴3
	@RequestMapping(value="/store/cscenter", method=RequestMethod.GET)
	public String cscenterForm(Model model) {
		
		model.addAttribute("mainMenu", "2");
		return ".store4.menu3.cscenter.list";
	}
}
