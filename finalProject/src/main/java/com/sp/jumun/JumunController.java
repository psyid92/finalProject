package com.sp.jumun;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.common.MyMath;
import com.sp.member.SessionInfo;

import net.sf.json.JSONObject;

@Controller("jumun.jumunController")
public class JumunController {
	@Autowired
	JumunService service;
	
	@Autowired
	MyMath myMath;

	@RequestMapping(value = "/jumun/jumunList", method = RequestMethod.GET)
	public String payList(String category,
			HttpServletRequest req, HttpServletResponse resp,
			Model model
			) throws Exception {
		List<Jumun> list = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		
		JSONObject job = myMath.getCookie(req, resp);
		double cur_lat = Double.parseDouble((String) job.get("lat"));
		double cur_lng = Double.parseDouble((String) job.get("lng"));

		map.put("category", category);
		map.put("cur_lat", cur_lat);
		map.put("cur_lng", cur_lng);
		
		list = service.listGiup(map);

		model.addAttribute("category", category);
		model.addAttribute("mode", null);
		model.addAttribute("list", list);
		return ".jumun.menu";
	}

	@RequestMapping(value = "/jumun/article", method = RequestMethod.GET)
	public String article(int g1_Num, String g1_Name, Model model) throws Exception {
		List<Jumun> cateList = new ArrayList<>();
		cateList = service.readMenuCategory(g1_Num);
		model.addAttribute("cateList", cateList);
		model.addAttribute("g1_Num", g1_Num);
		model.addAttribute("g1_Name", g1_Name);

		return ".jumun.article";
	}

	@RequestMapping(value = "/jumun/menu", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> menu(int menuct_Num) throws Exception {
		Map<String, Object> model = new HashMap<>();
		List<Jumun> menuList = new ArrayList<>();
		menuList = service.readMainMenu(menuct_Num);
		model.put("menuList", menuList);
		return model;
	}

	@RequestMapping(value = "/jumun/submenu", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sub(int mainmenu_Num) throws Exception {

		Map<String, Object> model = new HashMap<>();
		List<Jumun> subList = new ArrayList<>();
		subList = service.readSubMenu(mainmenu_Num);
		model.put("subList", subList);
		return model;
	}

	@RequestMapping(value="/jumun/totalJumun", method = RequestMethod.POST)
	public String totalJumunForm(String[] main_Num, String[] sub_Num, String g1_Name, HttpSession session, Model model)
			throws Exception {
		List<Jumun> mainList = new ArrayList<>();
		List<Jumun> subList = new ArrayList<>();
		List<Jumun> wayList = new ArrayList<>();
		int mileage = 0;
		mainList = service.mainJumunMenu(main_Num);
		subList = service.subJumunMenu(sub_Num);
		wayList = service.listPayMethod();
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		mileage = service.readMileage(info.getUserId());

		model.addAttribute("mainList", mainList);
		model.addAttribute("subList", subList);
		model.addAttribute("wayList", wayList);
		model.addAttribute("g1_Name", g1_Name);
		model.addAttribute("mileage", mileage);
		model.addAttribute("IMP_init", "imp89184049");
		return ".pay.pay";
	}

}
