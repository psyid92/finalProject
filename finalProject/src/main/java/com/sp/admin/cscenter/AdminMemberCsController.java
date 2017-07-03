package com.sp.admin.cscenter;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


// 회원 고객센터 컨트롤러

@Controller("admin.adminMemberCsController")
public class AdminMemberCsController {
	
	
	@RequestMapping(value="/admin/membernotice", method=RequestMethod.GET)
	public String memberNoticeList(Model model) {
		
		model.addAttribute("mainMenu", "3");
		model.addAttribute("subMenu", "1");
		return ".admin4.menu4.membernotice.list";
	}
	

	@RequestMapping(value="/admin/memberqna", method=RequestMethod.GET)
	public String memberQnaList(Model model) {
		
		model.addAttribute("mainMenu", "3");
		model.addAttribute("subMenu", "3");
		return ".admin4.menu4.memberqna.list";
	}
	
	
	
}
