package com.sp.userFaq;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("userFaq.userFaqController")
public class UserFaqController {
	
	@RequestMapping(value="/userFap/list")
	public String userFaq(HttpSession session)throws Exception{
		return ".userFaq.list";
	}
}
