package com.sp.store.mystore;

import java.io.File;
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
		List<MyStore> menuctlist = service.readMenuCT(info.getG1_Num());
		
		model.addAttribute("menuctlist",menuctlist);
		model.addAttribute("mainMenu", "0");
		model.addAttribute("subMenu", "3");
		return ".store4.menu1.menu.list";
	}
	
	@RequestMapping(value="/store/menu/mainMenuList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> mainMenuList(int menuct_Num)throws Exception{
		List<MyStore> mainmenulist = new ArrayList<>();
		mainmenulist = service.readMainMenu(menuct_Num);
		
		Map<String, Object> model = new HashMap<>();
		model.put("mainmenulist", mainmenulist);
		return model;
	}
	
	@RequestMapping(value="/store/menu/subMenuList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> submenuList(int mainmenu_Num)throws Exception{
		List<MyStore> submenulist = service.readSubmenu(mainmenu_Num);
		Map<String, Object> model = new HashMap<>();
		
		
		
		model.put("submenulist", submenulist);
		
		return model;
	}
	
	@RequestMapping(value="store/menu/insertMenuCT", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertMenuCT(MyStore mystoreDto)throws Exception{
		String state = "true";
		int result = service.insertMenuCT(mystoreDto);
		if(result == 0)
			state = "false";
		
		Map<String , Object> model = new HashMap<>();
		model.put("menuct_Num", mystoreDto.getMenuct_Num());
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value="store/menu/insertMainMenu", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertMainMenu(MyStore mystoreDto, HttpSession session)throws Exception{
		Map<String , Object> model = new HashMap<>();
		String state = "true";
		String root = session.getServletContext().getRealPath("/");
		String path = root+"uploads"+File.separator+"photo";
		
		int result = service.insertMainMenu(mystoreDto, path);
		System.out.println(result);
		if(result == 0)
			state = "false";
		
		List<MyStore> mainmenulist = new ArrayList<>();
		mainmenulist = service.readMainMenu(mystoreDto.getMenuct_Num());
		model.put("mainmenulist", mainmenulist);
		model.put("mainmenu_Num", mystoreDto.getMainmenu_Num());
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value="store/menu/insertSubMenu", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertSubMenu(MyStore mystoreDto)throws Exception{
		String state = "true";
		int result = service.insertSubMenu(mystoreDto);
		if(result == 0)
			state = "false";
		
		List<MyStore> submenulist = new ArrayList<>();
		submenulist	= service.readSubmenu(mystoreDto.getMainmenu_Num());
		
		Map<String , Object> model = new HashMap<>();
		model.put("submenulist", submenulist);
		model.put("submenu_Num", mystoreDto.getSubmenu_Num());
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
