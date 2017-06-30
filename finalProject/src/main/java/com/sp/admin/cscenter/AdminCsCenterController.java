package com.sp.admin.cscenter;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

// 고객센터 컨트롤러

@Controller("admin.adminCsCenterController")
public class AdminCsCenterController {
	@RequestMapping(value="/admin/notice", method=RequestMethod.GET)
	public String noticeList(Model model) {
		
		model.addAttribute("mainMenu", "3");
		model.addAttribute("subMenu", "1");
		return ".admin4.menu4.notice.list";
	}
	
	@RequestMapping(value="/admin/qna", method=RequestMethod.GET)
	public String cscenterList(Model model) {
		
		model.addAttribute("mainMenu", "3");
		model.addAttribute("subMenu", "2");
		return ".admin4.menu4.qna.list";
	}
}
