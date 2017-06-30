package com.sp.admin.member;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//회원관리 컨트롤러

@Controller("admin.adminMemberController")
public class AdminMemberController {
	
	@RequestMapping(value="/admin/membercontroll", method=RequestMethod.GET)
	public String memberControllList(Model model) {
		
		model.addAttribute("mainMenu", "0");
		model.addAttribute("subMenu", "1");
		return ".admin4.menu1.membercontroll.list";
	}
	
	@RequestMapping(value="/admin/memberreviewcontroll", method=RequestMethod.GET)
	public String memberReviewControllerList(Model model) {
		model.addAttribute("mainMenu", "0");
		model.addAttribute("subMenu", "2");
		return ".admin4.menu1.memberreviewcontroll.list";
	}
	
	@RequestMapping(value="/admin/membercscentercontroller", method=RequestMethod.GET)
	public String memberCsCenterControllerList(Model model) {
		model.addAttribute("mainMenu", "0");
		model.addAttribute("subMenu", "3");
		return ".admin4.menu1.membercscentercontroller.list";
	}
}
