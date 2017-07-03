package com.sp.admin.cscenter;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


// 기업 고객센터 컨트롤러

@Controller("admin.adminGiupCsController")
public class AdminGiupCsController {
	
	
	@RequestMapping(value="/admin/giupnotice", method=RequestMethod.GET)
	public String giupNoticeList(Model model) {
		
		model.addAttribute("mainMenu", "3");
		model.addAttribute("subMenu", "2");
		return ".admin4.menu4.giupnotice.list";
	}
	
	@RequestMapping(value="/admin/giupqna", method=RequestMethod.GET)
	public String gidupQnaList(Model model) {
		
		model.addAttribute("mainMenu", "3");
		model.addAttribute("subMenu", "4");
		return ".admin4.menu4.giupqna.list";
	}
}
