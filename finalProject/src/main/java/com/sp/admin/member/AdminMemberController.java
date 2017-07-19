package com.sp.admin.member;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.admin.giup.AdminGiup;
import com.sp.common.MyUtil;
import com.sp.giupReview.giupReview;
import com.sp.giupReview.giupReviewService;

//회원관리 컨트롤러

@Controller("admin.adminMemberController")
public class AdminMemberController {
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private giupReviewService reviewService;
	
	@RequestMapping(value="/admin/membercontroll", method=RequestMethod.GET)
	public String memberControllList(Model model) {
		
		model.addAttribute("mainMenu", "0");
		model.addAttribute("subMenu", "1");
		return ".admin4.menu1.membercontroll.list";
	}
	
	@RequestMapping("/admin/memberreviewcontroll")
	public String memberReviewControllerList(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="giupName") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model,
			HttpServletRequest req
			) {
		
		List<giupReview> reviewList = new ArrayList<>();
		String cp = req.getContextPath();
		int rows = 10;
		int total_page = 0;
		int dataCount = 0;
		
		try {
			if(req.getMethod().equalsIgnoreCase("GET")) {
				searchValue =URLDecoder.decode(searchValue, "utf-8"); 
			}
			
			//전체 페이지 수
			Map<String, Object> map = new HashMap<>();
			map.put("searchKey", searchKey);
			map.put("searchValue", searchValue);
			
			dataCount = reviewService.dataCount(map);
			if(dataCount != 0)
				total_page = myUtil.pageCount(rows, dataCount);
			
			if(total_page < current_page)
				current_page = total_page;
			
			int start = (current_page - 1) * rows + 1;
			int end = current_page * rows;
			map.put("start", start);
			map.put("end", end); 
			
			//리스트 가져오기
			reviewList = reviewService.getListAllReview(map);
			
			int listNum, n = 0;
			Iterator<giupReview> it=reviewList.iterator();
			while(it.hasNext()) {
				giupReview data = it.next();
				listNum = dataCount - (start + n - 1);
				data.setListNum(listNum);
				n++;
			}
			
			String query = "";
			String listUrl = cp+"/admin/memberreviewcontroll";
			if(searchValue.length()!=0) {
				query = "searchKey=" + searchKey +
						"&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
			}
			
			if(query.length()!=0) {
				listUrl = cp+"/admin/memberreviewcontroll?" + query;
			}
			
			String paging = myUtil.paging(current_page, total_page, listUrl);
			
			model.addAttribute("total_page", total_page);
			model.addAttribute("page", current_page);
			model.addAttribute("reviewList", reviewList);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("paging", paging);
			model.addAttribute("mainMenu", "0");
			model.addAttribute("subMenu", "2");
		} catch (Exception e) {
		}
		return ".admin4.menu1.memberreviewcontroll.list";
	}
	
	@RequestMapping(value="/admin/membercscentercontroll", method=RequestMethod.GET)
	public String memberCsCenterControllerList(Model model) {
		model.addAttribute("mainMenu", "0");
		model.addAttribute("subMenu", "3");
		return ".admin4.menu1.membercscentercontroll.list";
	}
	
	
	
}
