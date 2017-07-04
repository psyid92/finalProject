package com.sp.userQna;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.common.FileManager;
import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

@Controller("userQna.userQnaController")
public class UserQnaController {
	
	@Autowired
	private UserQnaService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;
    
	@RequestMapping(value="/userQna/list")
	public String userQna(HttpSession session)throws Exception{
		return ".userQna.list";
	}
	
	@RequestMapping(value="/userQna/created", method=RequestMethod.GET)
	public String createdForm(
			HttpSession session,
			Model model
			)throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info==null){
			return "redirect:/member/login";
		}
		model.addAttribute("mode", "created");
		return ".userQna.created";
	}
	
	
	@RequestMapping(value="/userQna/created", method=RequestMethod.POST)
	public String createdSubmit(
			HttpSession session,
			UserQna dto
			)throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info==null){
			return "redirect:/member/login";
		}
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"userQna";
		
		dto.setM1_Email(info.getUserId());
		dto.setUq_Num(info.getM1_Num());
		service.insertUserQna(dto, pathname);
		
		return "redirect:/userQna/list";
	}
	
}