package com.sp.notice;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

@Controller("notice.noticeController")
public class NoticeController {
	private final Logger logger=LoggerFactory.getLogger(getClass());
	
	@Autowired
	private NoticeService service;
	
	@Autowired
	private MyUtil myUtil;
    
	@RequestMapping(value="/notice/list")
	public String list(HttpSession session){
		try {
			
		} catch (Exception e) {
			
		}
		return ".notice.list";
	}
	
	@RequestMapping(value="/notice/created", method=RequestMethod.GET)
	public String createdForm(
			Model model) throws Exception{
        model.addAttribute("mode", "created");
		
		return ".notice.created";
	}
	
	@RequestMapping(value="/notice/created", method=RequestMethod.POST)
	public String createdSubmit(Notice dto, HttpSession session){
		try {
			SessionInfo info=(SessionInfo)session.getAttribute("member1");
			
			dto.setAdmin_Id(info.getUserId());
			service.insertNotice(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/notice/list";
	}
	
}
