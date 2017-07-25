package com.sp.store.mystoreCTR;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.store.member.SessionInfo;


@Controller("mystore.myStoreCTRController")
public class MyStoreCTRController {

	@Autowired
	MyStoreCTRService service;
	
	@RequestMapping(value = "/store/jumunControllList")
	@ResponseBody
	public Map<String, Object> jumunList(
			@RequestParam(value="orders_num", defaultValue="3")int orders_num
			, HttpSession session
			) {
		List<MyStoreCTR> list=new ArrayList<>();
		SessionInfo info = (SessionInfo)session.getAttribute("store");
		MyStoreCTR dto = new MyStoreCTR();
		dto.setG1_num(info.getG1_Num());
		dto.setOrders_num(orders_num);
		try {
			list = service.jumunList(dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}	
		Map<String, Object> model = new HashMap<>();
		model.put("list", list);
		return model;
	}
	
	@RequestMapping(value = "/store/jumunControll")
	public String jumunControll(Model model){
		
		model.addAttribute("mainMenu", "0");
		model.addAttribute("subMenu", "1");
		return ".store4.menu1.mystorecontroll.list";
	}
	
	@RequestMapping(value = "/store/jumunStateUpdate")
	@ResponseBody
	public Map<String, Object> jumunUpdateList(
			@RequestParam(value="orders_num", defaultValue="3")int orders_num
			){
		
		
		List<MyStoreCTR> list=new ArrayList<>();
		MyStoreCTR dto = new MyStoreCTR();
		dto.setOrders_num(orders_num);
		try {
			//업데이트로 변경
			//list = service.jumunList(dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}	
		Map<String, Object> model = new HashMap<>();
		model.put("list", list);
		return model;
	}
}
