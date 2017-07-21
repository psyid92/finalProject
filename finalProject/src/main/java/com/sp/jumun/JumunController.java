package com.sp.jumun;

import java.util.ArrayList;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestParam;
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

	@RequestMapping("/jumun/jumunList")
	public String payList(@RequestParam(value="category",defaultValue="") String category,
			HttpServletRequest req, HttpServletResponse resp,
			Model model,
			@RequestParam(value="searchValue", defaultValue="") String searchValue
			) throws Exception {
		List<Jumun> list = new ArrayList<>();
		List<Jumun> clist = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		for (int i = 0, n = 0; i < searchValue.length(); i++) {
			if (searchValue.charAt(i) == ' ') {
				if (i == searchValue.length()-1 && n == i) {
					searchValue = "";
				}
				n++;
				continue;
			}
			break;
		}
		JSONObject job = myMath.getCookie(req, resp);
		double cur_lat = Double.parseDouble((String) job.get("lat"));
		double cur_lng = Double.parseDouble((String) job.get("lng"));
		
		clist = service.listCategory();
		for (int i = 0; i < clist.size(); i++) {
			if (clist.get(i).getCat_Name().equals(searchValue)) {
				category = clist.get(i).getCat_Code();
				searchValue = clist.get(i).getCat_Code();
				break;
			}
		}
		map.put("searchValue", searchValue);
		map.put("category", category);
		map.put("cur_lat", cur_lat);
		map.put("cur_lng", cur_lng);
		
		list = service.listGiup(map);
		
		model.addAttribute("category", category);
		model.addAttribute("mode", null);
		model.addAttribute("list", list);
		model.addAttribute("count",list.size());
		return ".jumun.menu";
	}

	@RequestMapping(value = "/jumun/article", method = RequestMethod.GET)
	public String article(int g1_Num, String g1_Name, HttpSession session, Model model) throws Exception {
		List<Jumun> cateList = new ArrayList<>();
		List<Review> reviewList = new ArrayList<>();
		Map<Integer, Object> replyListMap = new HashMap<>();
		List<Review> replyList = new ArrayList<>();
		Map<String, Object> likeMap = new HashMap<>();
		SessionInfo info = (SessionInfo)session.getAttribute("member");
				
		int result = 0;
		cateList = service.readMenuCategory(g1_Num);
		
		reviewList = service.listReview(g1_Num);
		for (int i = 0; i < reviewList.size(); i++) {
			replyList = service.listGiupReview(reviewList.get(i).getRep_Num());
			replyListMap.put(reviewList.get(i).getRep_Num(), replyList);
		}
				
		if (info != null) {
			likeMap.put("g1_Num", g1_Num);
			likeMap.put("m1_Num", info.getM1_Num());
			result = service.likeGiup(likeMap);
		} 
		
		model.addAttribute("result",result);
		model.addAttribute("cateList", cateList);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("replyList", replyList);
		model.addAttribute("replyListMap",replyListMap);
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

	@RequestMapping(value="/jumun/likeGiup", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> likeGiup(int g1_Num, int m1_Num) throws Exception {
		Map<String, Object> map = new HashMap<>();
		int state = 0;
		map.put("g1_Num", g1_Num);
		map.put("m1_Num", m1_Num);
		
		Map<String, Object> model = new HashMap<>();
		try {
			state = service.insertLikeGiup(map);
		} catch (Exception e) {
		}
		
		model.put("state", state);
		return model;
		
	}
	
	@RequestMapping(value="/jumun/deLikeGiup", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deLikeGiup(int g1_Num, int m1_Num) throws Exception {
		Map<String, Object> map = new HashMap<>();
		int state = 0;
		map.put("g1_Num", g1_Num);
		map.put("m1_Num", m1_Num);
		
		Map<String, Object> model = new HashMap<>();
		try {
			state = service.deleteLikeGiup(map);
		} catch (Exception e) {
		}
		
		model.put("state", state);
		return model;
		
	}
}
