package com.sp.admin.cscenter;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

// 고객센터 컨트롤러

@Controller("admin.adminCsCenterController")
public class AdminCsCenterController {
	@RequestMapping(value="/admin/membernotice", method=RequestMethod.GET)
	public String memberNoticeList(Model model) {
		
		model.addAttribute("mainMenu", "3");
		model.addAttribute("subMenu", "1");
		return ".admin4.menu4.membernotice.list";
	}
	
	@RequestMapping(value="/admin/giupnotice", method=RequestMethod.GET)
	public String giupNoticeList(Model model) {
		
		model.addAttribute("mainMenu", "3");
		model.addAttribute("subMenu", "2");
		return ".admin4.menu4.giupnotice.list";
	}
	
	
	@RequestMapping(value="/admin/memberqna", method=RequestMethod.GET)
	public String memberQnaList(Model model) {
		
		model.addAttribute("mainMenu", "3");
		model.addAttribute("subMenu", "3");
		return ".admin4.menu4.memberqna.list";
	}
	
	@RequestMapping(value="/admin/giupqna", method=RequestMethod.GET)
	public String gidupQnaList(Model model) {
		
		model.addAttribute("mainMenu", "3");
		model.addAttribute("subMenu", "4");
		return ".admin4.menu4.giupqna.list";
	}
	
	
}
