package com.sp.userFaq;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.member.SessionInfo;

@Controller("userFaq.userFaqController")
public class UserFaqController {
	
	@RequestMapping(value={"/userFaq/main", "/auserfaq/list"})
	public String userFaq(
			HttpSession session,
			Model model)throws Exception{
		try {
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			
			if(info.getUserId().equals("admin")){
				model.addAttribute("mainMenu", "3");
				return ".admin4.menu4.memberfaq.list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ".userFaq.main";
	}
	
	@RequestMapping(value="/userFaq/list")
	public String list(HttpSession session)throws Exception{
		return ".userFaq.list";
	}
}
