package com.sp.store.advertise;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.jumun.Jumun;
import com.sp.store.member.SessionInfo;

@Controller("advertise.advertiseController")
public class AdvertiseController {
	@Autowired
	private AdvertiseService service;
	
	// 기업 메뉴
	@RequestMapping(value = "/store/jumunAdvertise", method = RequestMethod.GET)
	public String jumunAdvertiseForm(HttpSession session, Model model) throws Exception {
		
		List<Advertise> listAdvertise = new ArrayList<>();
		List<Jumun> wayList = new ArrayList<>();
		int adState = 0;
		SessionInfo info = (SessionInfo)session.getAttribute("store");
		
		listAdvertise = service.listAdvertise();
		wayList = service.wayList();
		adState = service.readGiupAd(info.getG1_Num()); 
		
		model.addAttribute("adState",adState);
		model.addAttribute("mainMenu", "1");
		model.addAttribute("subMenu", "1");
		model.addAttribute("listAdvertise",listAdvertise);
		model.addAttribute("wayList",wayList);
		model.addAttribute("IMP_init", "imp89184049");
		return ".store4.menu2.jumunAdvertise.list";
	}
	
	@RequestMapping(value = "/store/jumunAdvertise", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> jumunAdvertiseSubmit(Advertise dto) {
		Map<String, Object> model = new HashMap<>();
		String state = "fail";
		try {
			service.insertGiupAd(dto);
			state = "success";
		} catch (Exception e) {
		}
		model.put("state", state);
		return model;
	}

	@RequestMapping(value = "/store/listAdvertise", method = RequestMethod.GET)
	public String listAdvertise(Model model, HttpSession session) throws Exception {
		List<Advertise> list = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		SessionInfo info = (SessionInfo) session.getAttribute("store");
		
		int start = 1;
		int end = 10;
		map.put("g1_Num", info.getG1_Num());
		map.put("start", start);
		map.put("end", end);
		
		list = service.listGiupAd(map);
		
		model.addAttribute("list",list);
		model.addAttribute("mainMenu", "1");
		model.addAttribute("subMenu", "2");
		return ".store4.menu2.listAdvertise.list";
	}
	
}
