package com.sp.admin.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

// 어드민 로그인 컨트롤러

@Controller("admin.adminLoginController")
public class AdminLoginController {
	
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
	
	

}
