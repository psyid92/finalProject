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
	
	//전체리스트
	@RequestMapping(value="/store/review/reviewlistAll", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> reviewlistAll(
			MyStoreReview reviewDto, int g1_Num,
			 @RequestParam(value="pageNo", defaultValue="1")int current_page
			)throws Exception{
		
		int rows = 3;
		int total_page = 0;
		int dataCount = 0;
		
		dataCount = service.dataCount(g1_Num);
		total_page = myUtil.pageCount(rows, dataCount);
		
		if(current_page>total_page)
			current_page=total_page; 
		
		int start = (current_page-1)*rows+1;
		int end = current_page*rows;

		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("g1_Num", g1_Num);
		int listNum, n=0;
		List<MyStoreReview> reviewlistAll = service.reviewList(map);
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
		
		model.put("total_page", total_page);
		model.put("dataCount", dataCount);
		model.put("pageNo", current_page);
		model.put("paging", paging);
		model.put("reviewlistAll", reviewlistAll);
		return model;
	}
	
	//답변 추가하기
	@RequestMapping(value="/store/review/insertReviewReply", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertReviewReply(MyStoreReview reviewDto)throws Exception{
		String state = "true";
		int result = service.insertReviewReply(reviewDto);
		if(result==0)
			state = "false";
		
		List<MyStoreReview> reviewReplyList = new ArrayList<>();
		reviewReplyList = service.reviewReplyList(reviewDto.getRep_Num());
		Iterator<MyStoreReview> it = reviewReplyList.iterator();
		
		while(it.hasNext()){
			MyStoreReview mDto = it.next();
			mDto.setRrep_Content(mDto.getRrep_Content().replaceAll("\n", "<br>"));
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("rrep_Num", reviewDto.getRrep_Num());
		model.put("state", state);
		model.put("reviewReplyList", reviewReplyList);
		
		return model;
	}
	
	//답변 리스트
	@RequestMapping(value="/store/review/reviewReplyList", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> reviewReplyList(int rep_Num) throws Exception{
		List<MyStoreReview> reviewReplyList = new ArrayList<>();
		reviewReplyList = service.reviewReplyList(rep_Num);
		Iterator<MyStoreReview> it = reviewReplyList.iterator();
		
		while(it.hasNext()){
			MyStoreReview mDto = it.next();
			mDto.setRrep_Content(mDto.getRrep_Content().replaceAll("\n", "<br>"));
		}
		Map<String, Object> model = new HashMap<>();
		model.put("reviewReplyList", reviewReplyList);
		return model;
	}
	
	//답변삭제
	@RequestMapping(value="/store/review/deleteReply", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteReply(
			@RequestParam(value="rrep_Num") int rrep_Num,
			@RequestParam(value="pageNo") int pageNo,
			MyStoreReview reviewDto,
			int g1_Num
			)throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("rrep_Num", rrep_Num);
		map.put("pageNo", pageNo);
		service.deleteReviewReply(map);
		
		return reviewlistAll(reviewDto, g1_Num, pageNo);
	}
		
	
	//미답변 리뷰
	@RequestMapping(value = "/store/review/reviewYet", method = RequestMethod.GET)
	public String reviewYetForm(Model model, HttpSession session) {

		model.addAttribute("mainMenu", "0");
		model.addAttribute("subMenu", "2");
		return ".store4.menu1.review.reviewYet";
	}
	
	//미답변 리뷰 리스트
	@RequestMapping(value="/store/review/reviewlistYet", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> reviewlistYet(
			int g1_Num,
			@RequestParam(value="pageNo", defaultValue="1")int current_page
			)throws Exception{
		int rows = 3;
		int dataCount = service.dataCountYet(g1_Num);
		int total_page = myUtil.pageCount(rows, dataCount);
		if(current_page>total_page)
			current_page=total_page;
		
		int start = (current_page-1)*rows+1;
		int end = current_page*rows;

		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("g1_Num", g1_Num);
		
		int listNum, n=0;
		
		List<MyStoreReview> reviewlistYet = service.reviewListYet( map);
		
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