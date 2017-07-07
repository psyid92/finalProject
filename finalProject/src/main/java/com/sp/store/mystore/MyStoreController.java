package com.sp.store.mystore;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("mystore.myStoreController")
public class MyStoreController {
	@Autowired
	private MyStoreService service;
	
	// 메뉴1
	@RequestMapping(value = "/store/mystore", method = RequestMethod.GET)
	public String mystoreForm(Model model) {

		model.addAttribute("mainMenu", "0");
		model.addAttribute("subMenu", "1");
		return ".store4.menu1.mystore.list";
	}
	@RequestMapping(value = "/store/review", method = RequestMethod.GET)
	public String reviewForm(Model model) {

		model.addAttribute("mainMenu", "0");
		model.addAttribute("subMenu", "2");
		return ".store4.menu1.review.list";
	}

	@RequestMapping(value = "/store/menu", method = RequestMethod.GET)
	public String menuForm(Model model) {

		model.addAttribute("mainMenu", "0");
		model.addAttribute("subMenu", "3");
		return ".store4.menu1.menu.list";
	}
	
	@RequestMapping(value="/store/insertMenuCT", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertMenuCT(MyStore dto)throws Exception{
		String state = "true";
		int result = service.insertMenuCT(dto);
		if(result == 0)
			state = "false";
		
		Map<String , Object> model = new HashMap<>();
		model.put("menuct_Num", result);
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value="/store/insertMainMenu", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertMainMenu(MyStore dto)throws Exception{
		String state = "true";
		int result = service.insertMainMenu(dto);
		if(result == 0)
			state = "false";
		
		Map<String , Object> model = new HashMap<>();
		model.put("mainmenu_Num", result);
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value="/store/insertsubMenu", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertsubMenu(MyStore dto)throws Exception{
		String state = "true";
		int result = service.insertSubMenu(dto);
		if(result == 0)
			state = "false";
		
		Map<String , Object> model = new HashMap<>();
		model.put("submenu_Num", result);
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value="/store/deleteMenuCT", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteMenuCT(@RequestParam int menuct_Num)throws Exception{
		String state = "true";
		int result = service.deleteMenuCT(menuct_Num);
		if(result == 0)
			state = "false";
		
		Map<String , Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value="/store/deleteMainMenu", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteMainMenu(@RequestParam int mainmenu_Num)throws Exception{
		String state = "true";
		int result = service.deleteMainMenu(mainmenu_Num);
		if(result == 0)
			state = "false";
		
		Map<String , Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value="/store/deleteSubMenu", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteSubMenu(@RequestParam int submenu_Num)throws Exception{
		String state = "true";
		int result = service.deleteSubMenu(submenu_Num);
		if(result == 0)
			state = "false";
		
		Map<String , Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
}
