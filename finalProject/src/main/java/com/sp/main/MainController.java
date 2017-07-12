package com.sp.main;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.sf.json.JSONObject;

@Controller("mainController")
public class MainController {
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String goMain(Model model, HttpSession session){
		
		session.removeAttribute("preLoginURI");
		model.addAttribute("mode", "mainPage");
		return ".mainLayout";
	}
	
	
	@RequestMapping(value="/getcookie")
	public void getCookie(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException  {
		Cookie[] cc = req.getCookies();
		JSONObject job=new JSONObject();
		
		if (cc != null) {
			for (Cookie c : cc) {
				String name = c.getName();
				String value = c.getValue();

				if (name.equals("cur_Loc")) {
					value = URLDecoder.decode(value, "UTF-8");
				}
				job.put(name, value);
			}
		}
		
	      resp.setContentType("text/html;charset=utf-8");
	      PrintWriter out=resp.getWriter();
	      out.print(job.toString());
	}
}
