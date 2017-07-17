package com.sp.userFaq;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

@Controller("userFaq.userFaqController")
public class UserFaqController {
	
	@Autowired
	private UserFaqService service;
	
	@Autowired
	private MyUtil myUtil;
	
	
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
	
	@RequestMapping(value="/admin/memberfaq/created", method=RequestMethod.GET)
	public String createdForm(Model model)throws Exception{
		model.addAttribute("mode", "created");
		
		return ".admin4.menu4.memberfaq.created";
	}
	
	@RequestMapping(value="/admin/memberfaq/created", method=RequestMethod.POST)
	public String createdSubmit(UserFaq dto){
		try {
			dto.setAdmin_Id("admin");
			service.insertUserFaq(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/auserfaq/list";
	}
		
	
	
	
	
	
}
