package com.sp.stats;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("statsController")
public class StatsController {
	
	@Autowired
	private StaticsService service;
	
	@RequestMapping("/stats/visitCounter")
	@ResponseBody
	public Map<String, Object> visitCounter(@RequestParam int mydata){
		Map<String, Object> map = new Hashtable<>();
		try {
			List<VisitCount> list = service.getVisitCount(mydata);
			int totalCount = 0;
			if(! list.isEmpty()){
				for (VisitCount listcount : list) {
					totalCount += listcount.getVisit_count();
				}
				
			}
			
			map.put("visitList", list);
			map.put("totalCount", totalCount);
			
		} catch (Exception e) {
		}
		
		return map;
	}

	
	
	@RequestMapping("/stats/visitMain")
	public String visitMain(Model model){
		try {
			List<VisitCount> list = service.getVisitCount(7);
			model.addAttribute("visitList", list);
			int totalCount = 0;
			if(! list.isEmpty()){
				for (VisitCount count : list) {
					totalCount += count.getVisit_count();
				}
			}
			model.addAttribute("totalCount", totalCount);
			
		} catch (Exception e) {
		}
		
		return "";
	}
	
	
	
}
