package com.sp.userFaq;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

@Controller("userFaq.userFaqController")
public class UserFaqController {
	
	@Autowired
	private UserFaqService service;
	
	@Autowired
	private MyUtil myUtil;
	
	
	@RequestMapping(value={"/userFaq/faq", "/auserfaq/faq"})
	public String userFaq(
			HttpSession session,
			Model model)throws Exception{
		try {
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			
			if(info.getUserId().equals("admin")){
				model.addAttribute("mainMenu", "3");
				return ".admin4.menu4.memberfaq.faq";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ".userFaq.faq";
	}
	
	
	@RequestMapping(value={"/userFaq/list", "/auserfaq/list"})
	public String list(
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
		return ".userFaq.list";
	}
	
	
	
	@RequestMapping(value="/admin/memberfaq/created", method=RequestMethod.GET)
	public String createdForm(
			Model model
			,@RequestParam(value="category", defaultValue="0")int ca_Num,
			HttpSession session
			)throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(! info.getUserId().equals("admin"))
			return "redirect:/admin/login";
		
		List<UserFaq> listCategory=service.listCategory();
		List<UserFaq> listUserFaqCategory=service.listUserFaqCategory();
		
		model.addAttribute("category", ca_Num);
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("listUserFaqCategory", listUserFaqCategory);
		model.addAttribute("mode", "created");
		
		return ".admin4.menu4.memberfaq.created";
	}
	
	@RequestMapping(value="/admin/memberfaq/created", method=RequestMethod.POST)
	public String createdSubmit(
			UserFaq dto
			){
		try {
			dto.setAdmin_Id("admin");
			service.insertUserFaq(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/auserfaq/list";
	}
		
	
	
	
	
	
}
