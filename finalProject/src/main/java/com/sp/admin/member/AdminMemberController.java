package com.sp.admin.member;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.support.RequestDataValueProcessor;

import com.sp.giupReview.giupReview;
import com.sp.giupReview.giupReviewService;

//회원관리 컨트롤러

@Controller("admin.adminMemberController")
public class AdminMemberController {
	
	@Autowired
	private giupReviewService reviewService;
	
	@RequestMapping(value="/admin/membercontroll", method=RequestMethod.GET)
	public String memberControllList(Model model) {
		
		model.addAttribute("mainMenu", "0");
		model.addAttribute("subMenu", "1");
		return ".admin4.menu1.membercontroll.list";
	}
	
	@RequestMapping(value="/admin/memberreviewcontroll", method=RequestMethod.GET)
	public String memberReviewControllerList(Model model) {
		List<giupReview> reviewList = new ArrayList<>();
		try {
			reviewList = reviewService.getListAllReview();
		} catch (Exception e) {
		}
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("mainMenu", "0");
		model.addAttribute("subMenu", "2");
		return ".admin4.menu1.memberreviewcontroll.list";
	}
	
	@RequestMapping(value="/admin/membercscentercontroll", method=RequestMethod.GET)
	public String memberCsCenterControllerList(Model model) {
		model.addAttribute("mainMenu", "0");
		model.addAttribute("subMenu", "3");
		return ".admin4.menu1.membercscentercontroll.list";
	}
	
	
	
}
