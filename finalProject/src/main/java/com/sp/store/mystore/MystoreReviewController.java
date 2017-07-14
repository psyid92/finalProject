package com.sp.store.mystore;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
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

import com.sp.common.MyUtil;

@Controller("mystore.myStoreReviewController")
public class MystoreReviewController{
	@Autowired
	private MystoreReivewService service;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "/store/review", method = RequestMethod.GET)
	public String reviewForm(Model model, HttpSession session) throws Exception {
		
		model.addAttribute("mainMenu", "0");
		model.addAttribute("subMenu", "2");
		return ".store4.menu1.review.review";
	}
	
	@RequestMapping(value="/store/reivew/reviewlistAll", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> reviewlistAll(
			int g1_Num, @RequestParam(value="pageNo", defaultValue="1")int current_page
			)throws Exception{
		int rows = 5;
		int dataCount = service.dataCount(g1_Num);
		int total_page = myUtil.pageCount(rows, dataCount);
		if(current_page>total_page)
			current_page=total_page;
		
		int start = (current_page-1)*rows+1;
		int end = current_page*rows;

		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		
		int listNum, n=0;
		List<MyStoreReview> reviewlistAll = new ArrayList<>();
		Iterator<MyStoreReview> it = reviewlistAll.iterator();
		while(it.hasNext()){
			MyStoreReview mDto = it.next();
			mDto.setRep_Content(mDto.getRep_Content().replaceAll("\n", "<br>"));
			
			listNum = dataCount - (start + n -1);
			mDto.setList_Num(listNum);
			n++;
		}
		String paging = myUtil.paging(current_page, total_page);
		
		Map<String, Object> model = new HashMap<>();
		
		reviewlistAll = service.reviewList(g1_Num);
		model.put("total_page", total_page);
		model.put("dataCount", dataCount);
		model.put("pageNo", current_page);
		model.put("paging", paging);
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
	public Map<String, Object> reviewlistYet(
			int g1_Num,
			@RequestParam(value="pageNo", defaultValue="1")int current_page
			)throws Exception{
		int rows = 5;
		int dataCount = service.dataCount(g1_Num);
		int total_page = myUtil.pageCount(rows, dataCount);
		if(current_page>total_page)
			current_page=total_page;
		
		int start = (current_page-1)*rows+1;
		int end = current_page*rows;

		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		
		int listNum, n=0;
		
		List<MyStoreReview> reviewlistYet = new ArrayList<>();
		
		Iterator<MyStoreReview> it = reviewlistYet.iterator();
		while(it.hasNext()){
			MyStoreReview mDto = it.next();
			mDto.setRep_Content(mDto.getRep_Content().replaceAll("\n", "<br>"));
			
			listNum = dataCount - (start + n -1);
			mDto.setList_Num(listNum);
			n++;
		}
		String paging = myUtil.paging(current_page, total_page);
		
		Map<String, Object> model = new HashMap<>();
		reviewlistYet = service.reviewListYed(g1_Num);
		
		model.put("total_page", total_page);
		model.put("dataCount", dataCount);
		model.put("pageNo", current_page);
		model.put("paging", paging);
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