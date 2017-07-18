package com.sp.store.advertise;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.jumun.Jumun;

@Controller("advertise.advertiseController")
public class AdvertiseController {
	@Autowired
	private AdvertiseService service;
	
	// admin 메뉴
	@RequestMapping(value = "/store/insertAdvertise", method = RequestMethod.GET)
	public String insertAdvertise(Model model) throws Exception {
		
		List<Advertise> listAdvertise = new ArrayList<>();
		listAdvertise = service.listAdvertise();
		
		model.addAttribute("mainMenu", "1");
		model.addAttribute("subMenu", "1");
		model.addAttribute("listAdvertise",listAdvertise);
		return ".store4.menu2.insertAdvertise.list";
		
	}
	
	// 기업 메뉴
	@RequestMapping(value = "/store/jumunAdvertise", method = RequestMethod.GET)
	public String jumunAdvertiseForm(Model model) throws Exception {
		
		List<Advertise> listAdvertise = new ArrayList<>();
		List<Jumun> wayList = new ArrayList<>();
		listAdvertise = service.listAdvertise();
		wayList = service.wayList();
		
		model.addAttribute("mainMenu", "1");
		model.addAttribute("subMenu", "1");
		model.addAttribute("listAdvertise",listAdvertise);
		model.addAttribute("wayList",wayList);
		model.addAttribute("IMP_init", "imp89184049");
		return ".store4.menu2.jumunAdvertise.list";
	}
	
	@RequestMapping(value = "/store/jumunAdvertise", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> jumunAdvertiseSubmit(Advertise dto) throws Exception {
		Map<String, Object> model = new HashMap<>();
		service.insertGiupAd(dto);
		return model;
	}

	@RequestMapping(value = "/store/listAdvertise", method = RequestMethod.GET)
	public String coupon2Form(Model model) {

		model.addAttribute("mainMenu", "1");
		model.addAttribute("subMenu", "2");
		return ".store4.menu2.listAdvertise.list";
	}
	
}
