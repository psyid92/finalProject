package com.sp.userQna;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("userQna.userQnaController")
public class UserQnaController {
    
	@RequestMapping(value="/userQna/list")
	public String userQna(HttpSession session)throws Exception{
		return ".userQna.list";
	}
}