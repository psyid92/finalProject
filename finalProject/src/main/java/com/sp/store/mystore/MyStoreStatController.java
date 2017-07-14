package com.sp.store.mystore;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.store.member.SessionInfo;

@Controller("mystore.myStoreStatController")
public class MyStoreStatController {
	@Autowired
	MyStoreStatService service;
	
	// 메뉴1(통계)
	@RequestMapping(value = "/store/mystore", method = RequestMethod.GET)
	public String mystoreForm(Model model, HttpSession session) {
		SessionInfo info = (SessionInfo)session.getAttribute("store");
		List<MyStoreStat> list=new ArrayList<>();
		try {
			list = service.paySumList(info.getG1_Num());
		} catch (Exception e) { 
			System.out.println(e.toString());
		}
		model.addAttribute("list", list);
		
		model.addAttribute("mainMenu", "0");
		model.addAttribute("subMenu", "1");
		return ".store4.menu1.mystore.list";
	}
	
	
}
