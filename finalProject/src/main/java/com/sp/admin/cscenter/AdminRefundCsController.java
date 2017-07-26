package com.sp.admin.cscenter;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.common.MyUtil;
import com.sp.jumun.JumunService;
import com.sp.jumun.Refund;

@Controller("admin.adminRefundCsController")
public class AdminRefundCsController {
	@Autowired
	private JumunService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/admin/refund")
	public String listRefund(
			@RequestParam(value="searchKey", defaultValue="m1_Email") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam(value="refund_State", defaultValue="") String refund_State,
			@RequestParam(value="page", defaultValue="1") int current_page,
			Model model, HttpServletRequest req
			) throws Exception {
		int rows = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("refund_State", refund_State);
		dataCount = service.countRefund(map);
		
		if (dataCount != 0) 
			total_page = myUtil.pageCount(rows, dataCount);
		
		if (total_page < current_page)
			current_page = total_page;
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Refund> list = new ArrayList<>();
		list = service.listRefund(map);
		
		int listNum, n = 0;
		Iterator<Refund> it = list.iterator();
		while(it.hasNext()) {
			Refund data = it.next();
			listNum = dataCount - (start + n - 1);
			data.setListNum(listNum);
			n++;
		}
		
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "/admin/refund";
		String articleUrl = cp + "/admin/refundArticle?page="+current_page;
		if (searchValue.length() != 0) {
			query = "searchKey=" + searchKey + "&searchValue="+URLEncoder.encode(searchValue,"utf-8");
		}
		
		if (query.length() != 0) {
			listUrl = cp + "/admin/refund?" + query;
			articleUrl = cp + "/admin/refundArticle?page="+current_page + "&"+query;
		}
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list",list);
		model.addAttribute("articleUrl",articleUrl);
		model.addAttribute("page",current_page);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("total_page",total_page);
		model.addAttribute("paging",paging);
		model.addAttribute("refund_State",refund_State);
		model.addAttribute("mainMenu", "3");
		model.addAttribute("subMenu", "5");
		return ".admin4.menu4.refund.list";
	}
	
	@RequestMapping(value="/admin/refundArticle")
	public String refundArticle (int jumun_Num, Model model) throws Exception {
		
		Refund dto = new Refund();
		dto = service.readRefund(jumun_Num);
		model.addAttribute("dto",dto);
		model.addAttribute("jumun_Num",jumun_Num);
		model.addAttribute("mainMenu", "3");
		model.addAttribute("subMenu", "5");
		return ".admin4.menu4.refund.article";
	}
	
	@RequestMapping(value="/admin/refund_ok") 
	public String refund_ok (int jumun_Num) throws Exception {
		try {
			service.updateRefundJumun(jumun_Num);
			service.updateRefund(jumun_Num);
		} catch (Exception e) {
		}
		return "redirect:/admin/refund";
	}
}
