package com.sp.store.mystore;

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

import com.sp.store.member.SessionInfo;

@Controller("mystore.myStoreReviewController")
public class MystoreReviewController{
	@Autowired
	private MystoreReivewService service;
	
	@RequestMapping(value = "/store/review", method = RequestMethod.GET)
	public String reviewForm(Model model, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("store");
		List<MyStoreReview> reviewlistAll = new ArrayList<>();
		reviewlistAll = service.reviewList(info.getG1_Num());
		
		model.addAttribute("reviewlistAll", reviewlistAll);
		model.addAttribute("mainMenu", "0");
		model.addAttribute("subMenu", "2");
		return ".store4.menu1.review.review";
	}
	
	@RequestMapping(value="/store/reivew/reviewlistAll", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> reviewlistAll(int g1_Num)throws Exception{
		List<MyStoreReview> reviewlistAll = new ArrayList<>();
		Map<String, Object> model = new HashMap<>();
		reviewlistAll = service.reviewList(g1_Num);
		model.put("reviewlistAll", reviewlistAll);
		return model;
	}
	
	@RequestMapping(value="/store/review/insertReviewReply", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertReviewReply(MyStoreReview reviewDto)throws Exception{
		String state = "true";
		int result = service.insertReviewReply(reviewDto);
		if(result==0)
			state = "false";
		
		Map<String, Object> model = new HashMap<>();
		model.put("rrep_Num", reviewDto.getRrep_Num());
		model.put("state", state);
		
		return model;
	}
	
	
	
	
	@RequestMapping(value = "/store/review/reviewYet", method = RequestMethod.GET)
	public String reviewYetForm(Model model, HttpSession session) {

		model.addAttribute("mainMenu", "0");
		model.addAttribute("subMenu", "2");
		return ".store4.menu1.review.reviewYet";
	}
	
	@RequestMapping(value="/store/reivew/reviewlistYet", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> reviewlistYet(int g1_Num)throws Exception{
		List<MyStoreReview> reviewlistYet = new ArrayList<>();
		Map<String, Object> model = new HashMap<>();
		reviewlistYet = service.reviewListYed(g1_Num);
		model.put("reviewlistYet", reviewlistYet);
		return model;
	}
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/store/review/reviewTalk", method = RequestMethod.GET)
	public String reviewTalkForm(Model model, HttpSession session) {

		model.addAttribute("mainMenu", "0");
		model.addAttribute("subMenu", "2");
		return ".store4.menu1.review.reviewTalk";
	}
}