package com.sp.userBbs;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("bbs.bbsController")
public class BbsController {
    
	@RequestMapping(value="/userBbs/list")
	public String userBbs(HttpSession session)throws Exception{
		return ".userBbs.list";
	}
}