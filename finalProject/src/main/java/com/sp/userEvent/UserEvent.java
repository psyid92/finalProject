package com.sp.userEvent;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("event.userEventController")
public class UserEvent {
	
	@RequestMapping(value="/userEvent/list")
    public String userEvent(HttpSession session)throws Exception{
    	return ".userEvent.list";
    }
}
