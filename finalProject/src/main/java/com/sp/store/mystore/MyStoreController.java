package com.sp.store.mystore;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.store.member.SessionInfo;

@Controller("mystore.myStoreController")
public class MyStoreController {
	@Autowired
	private MyStoreService service;
	
	// 메뉴1
	@RequestMapping(value = "/store/mystore", method = RequestMethod.GET)
	public String mystoreForm(Model model, HttpSession session) {

		model.addAttribute("mainMenu", "0");
		model.addAttribute("subMenu", "1");
		return ".store4.menu1.mystore.list";
	}
	@RequestMapping(value = "/store/review", method = RequestMethod.GET)
	public String reviewForm(Model model, HttpSession session) {

		model.addAttribute("mainMenu", "0");
		model.addAttribute("subMenu", "2");
		return ".store4.menu1.review.list";
	}

	@RequestMapping(value = "/store/menu", method = RequestMethod.GET)
	public String menuForm(Model model, HttpSession session) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("store");
		List<MyStore> list = service.readMenuCT(info.getG1_Num());
		
		model.addAttribute("list",list);
		model.addAttribute("mainMenu", "0");
		model.addAttribute("subMenu", "3");
		return ".store4.menu1.menu.list";
	}
	
	@RequestMapping(value="/store/menu/mainMenuList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> mainMenuList(int menuct_Num)throws Exception{
		List<MyStore> list = service.readMainMenu(menuct_Num);
		
		Map<String, Object> model = new HashMap<>();
		model.put("list", list);
		return model;
	}
	
	@RequestMapping(value="/store/menu/subMenuList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> submenuList(int mainmenu_Num)throws Exception{
		List<MyStore> list = service.readSubmenu(mainmenu_Num);
		
		Map<String, Object> model = new HashMap<>();
		model.put("list", list);
		return model;
	}
	
	@RequestMapping(value="store/menu/insertMenuCT", method=RequestMethod.POST)
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
	
	@RequestMapping(value="store/menu/insertMainMenu", method=RequestMethod.POST)
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
	
	@RequestMapping(value="store/menu/insertsubMenu", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> store(MyStore dto)throws Exception{
		String state = "true";
		int result = service.insertSubMenu(dto);
		if(result == 0)
			state = "false";
		
		Map<String , Object> model = new HashMap<>();
		model.put("submenu_Num", result);
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value="store/menu/deleteMenuCT", method=RequestMethod.POST)
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
	
	@RequestMapping(value="store/menu/deleteMainMenu", method=RequestMethod.POST)
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
	
	@RequestMapping(value="store/menu/deleteSubMenu", method=RequestMethod.POST)
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
