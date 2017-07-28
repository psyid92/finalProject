package com.sp.userEvent;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.common.FileManager;
import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

@Controller("event.userEventController")
public class UserEventController {
	
	@Autowired
	private UserEventService service;
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private FileManager filManager;
	
	@RequestMapping(value={"/userEvent/list", "/memberevent/list"})
    public String userEvent(HttpSession session)throws Exception{
    	return ".userEvent.list";
    }

	@RequestMapping(value="/memberevent/created",method=RequestMethod.GET)
	public String createdForm(Model model)throws Exception{
		
		model.addAttribute("mode", "created");
		return ".admin4.menu3.memberevent.created";
	}
	
	@RequestMapping(value="/memberevent/created",method=RequestMethod.POST)
	public String createdSubmit(UserEvent dto,HttpSession session)throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"userEvent";
		
		dto.setAdmin_Id("admin");
		dto.setEv_StartDate(dto.getEv_StartDate());
		dto.setEv_EndDate(dto.getEv_EndDate());
		service.insertUserEvent(dto, pathname);
		
		return "redirect:/memberevent/list";
	}
	
	
	
	
	
	
}
