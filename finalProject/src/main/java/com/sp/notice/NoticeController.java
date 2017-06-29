package com.sp.notice;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("notice.noticeController")
public class NoticeController {
    
	@RequestMapping(value="/notice/list")
	public String notice(HttpSession session)throws Exception{
		return ".notice.list";
	}
}
