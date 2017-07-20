package com.sp.admin.giup;

import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.common.MyUtil;

import net.sf.json.JSONObject;

//기업관리 컨트롤러

@Controller("admin.adminGiupController")
public class AdminGiupController {
	@Autowired
	private AdminGiupService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("/admin/giupcontroll/list")
	public String giupControllList(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="giupName") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model,
			HttpServletRequest req
			) throws Exception {
		
		String cp = req.getContextPath();
		
		int rows = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
		//전체 페이지 수
		Map<String, Object> map = new HashMap<>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		dataCount = service.dataCount(map);
		if(dataCount != 0)
			total_page = myUtil.pageCount(rows, dataCount);
		
		if(total_page < current_page)
			current_page = total_page;
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end); 
		
		List<AdminGiup> list = service.listAdminGiup(map);
		
		int listNum, n = 0;
		Iterator<AdminGiup> it=list.iterator();
		while(it.hasNext()) {
			AdminGiup data = it.next();
			listNum = dataCount - (start + n - 1);
			data.setListNum(listNum);
			n++;
		}
		
		String query = "";
		String listUrl = cp+"/admin/giupcontroll/list";
		String articleUrl = cp+"/admin/giupcontroll/article?page=" + current_page;
		if(searchValue.length()!=0) {
			query = "searchKey=" + searchKey +
					"&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
		}
		
		if(query.length()!=0) {
			listUrl = cp+"/admin/giupcontroll/list?" + query;
			articleUrl = cp+"/admin/giupcontroll/article?page=" + current_page + "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("mainMenu", "1");
		model.addAttribute("subMenu", "1");
		return ".admin4.menu2.giupcontroll.list";
	}
	
	@RequestMapping(value="/admin/giupcontroll/article")
	public void giupControllArticle (
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="giupName") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam(value="num") int num,
			Model model,
			HttpServletResponse resp
			) throws Exception {
		AdminGiup adminGiup = service.readAdminGiup(num);
		
		JSONObject job=new JSONObject();
		
		job.put("dto", adminGiup);
		
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		out.print(job.toString());
	}
	
	@RequestMapping("/admin/giupreviewcontroll/list")
	public String giupReviewList(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="giupName") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model,
			HttpServletRequest req
			) throws Exception {
		
		String cp = req.getContextPath();
		
		int rows = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
		//전체 페이지 수
		Map<String, Object> map = new HashMap<>();
		System.out.println(searchValue);
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		dataCount = service.dataCount(map);
		if(dataCount != 0)
			total_page = myUtil.pageCount(rows, dataCount);
		
		if(total_page < current_page)
			current_page = total_page;
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end); 
		
		List<AdminGiup> list = service.listAdminGiup(map);
		
		int listNum, n = 0;
		Iterator<AdminGiup> it=list.iterator();
		while(it.hasNext()) {
			AdminGiup data = it.next();
			listNum = dataCount - (start + n - 1);
			data.setListNum(listNum);
			n++;
		}
		
		String query = "";
		String listUrl = cp+"/admin/giupreviewcontroll/list";
		String articleUrl = cp+"/admin/giupreviewcontroll/article?page=" + current_page;
		if(searchValue.length()!=0) {
			query = "searchKey=" + searchKey +
					"&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
		}
		
		if(query.length()!=0) {
			listUrl = cp+"/admin/giupreviewcontroll/list?" + query;
			articleUrl = cp+"/admin/giupreviewcontroll/article?page=" + current_page + "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("mainMenu", "1");
		model.addAttribute("subMenu", "2");
		return ".admin4.menu2.giupreviewcontroll.list";
	}
	
	@RequestMapping(value="/admin/giupreviewcontroll/article")
	public void giupControllArticle () throws Exception {
		
	}
			
	
	@RequestMapping(value="/admin/giupcscentercontroll", method=RequestMethod.GET)
	public String giupcscenterList(Model model) {
		
		model.addAttribute("mainMenu", "1");
		model.addAttribute("subMenu", "3");
		return ".admin4.menu2.giupcscentercontroll.list";
	}
	
	@RequestMapping(value="/admin/giupmenucontroll", method=RequestMethod.GET)
	public String giupmenuList(Model model) {
		
		model.addAttribute("mainMenu", "1");
		model.addAttribute("subMenu", "4");
		return ".admin4.menu2.giupmenucontroll.list";
	}
	
}
