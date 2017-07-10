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
			Model model) throws Exception {
		List<Jumun> list = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		int start = 1;
		int end = 10;

		map.put("category", category);
		map.put("start", start);
		map.put("end", end);

		list = service.listGiup(map);

		// 쿠키에서 현재 위치 받아오기
		System.out.println("삭제전 : " + list.size()); // 카테고리 전체 기업
		JSONObject job = myMath.getCookie(req, resp);

		double cur_lat = Double.parseDouble((String) job.get("lat"));
		double cur_lng = Double.parseDouble((String) job.get("lng"));

		Iterator<Jumun> it = list.iterator();
		while (it.hasNext()) {
			Jumun jumun = it.next();

			double dist = myMath.calculateDistance(cur_lat, cur_lng, jumun.getG3_lati(), jumun.getG3_longti());
			// 5km이상이면 해당기업은 리스트에서 삭제
			if (dist >= 5) {
				it.remove();
			}
		}
		System.out.println("삭제후 : " + list.size());

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

		menuList.get(1).getMainmenu_Title();

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

	@RequestMapping(value = "/jumun/totalJumun", method = RequestMethod.POST)
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
