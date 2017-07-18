package com.sp.store.advertise;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.common.MyUtil;
import com.sp.jumun.Jumun;
import com.sp.store.member.SessionInfo;

@Controller("advertise.advertiseController")
public class AdvertiseController {
	@Autowired
	private AdvertiseService service;
	
	@Autowired
	private MyUtil myUtil;
	
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
	public String listAdvertise(Model model, HttpSession session,
			@RequestParam(value="page", defaultValue="1") int current_page,
			HttpServletRequest req
			) throws Exception {
		List<Advertise> list = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		SessionInfo info = (SessionInfo) session.getAttribute("store");
		int g1_Num = info.getG1_Num();
		int rows = 10;
		int total_page = 0;
		int dataCount = 0;
		
		
		dataCount = service.dataCount(g1_Num);
		if (dataCount != 0)
			total_page = myUtil.pageCount(rows, dataCount);
		
		if (total_page < current_page)
			current_page = total_page;
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("g1_Num", g1_Num);
		map.put("start", start);
		map.put("end", end);
		
		list = service.listGiupAd(map);
		
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		int num = 0;
		for (int i = list.size()-1; i >= 0; i--) {
			String endAd = list.get(i).getEndAd();
			Date to = transFormat.parse(endAd);
			Date sys = cal.getTime();
			if (num == 0 && to.compareTo(sys) <= 0) {
				list.get(i).setStated("기간만료");
				continue;
			}
			num++;
			if (num == 1) {
				list.get(i).setStated("적용중");
				continue;
			}
			to = transFormat.parse(list.get(i+1).getEndAd());
			cal.setTime(to);
			cal.add(Calendar.DATE, list.get(i).getGiupAd_Term());
			list.get(i).setEndAd(transFormat.format(cal.getTime()));
			endAd = list.get(i).getEndAd();
			list.get(i).setStated("적용 대기");
		}
		
		int listNum, n = 0;
		Iterator<Advertise> it = list.iterator();
		while(it.hasNext()) {
			Advertise data = it.next();
			listNum = dataCount - (start + n - 1);
			data.setListNum(listNum);
			n++;
		}
		
		String cp = req.getContextPath();
		String paging = myUtil.paging(current_page, total_page,cp+"/store/listAdvertise");
		
		model.addAttribute("list",list);
		model.addAttribute("page",current_page);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("total_page",total_page);
		model.addAttribute("paging",paging);
		model.addAttribute("mainMenu", "1");
		model.addAttribute("subMenu", "2");
		return ".store4.menu2.listAdvertise.list";
	}
	
}
