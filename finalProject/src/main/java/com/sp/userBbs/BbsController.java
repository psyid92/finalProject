package com.sp.userBbs;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
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

import com.sp.common.FileManager;
import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

@Controller("bbs.bbsController")
public class BbsController {
    
	@Autowired
	private UserBbsService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value="/userBbs/list")
	public String userBbs(
			@RequestParam(value="page", defaultValue="1")int current_page,
			@RequestParam(value="searchKey", defaultValue="bbs_Subject")String searchKey,
			@RequestParam(value="searchValue", defaultValue="")String searchValue,
			HttpSession session,
			Model model,
			HttpServletRequest req
			){
		try {
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			String cp=req.getContextPath();
			
			int rows=5;
			int total_page =0;
			int dataCount=0;
			
			if(req.getMethod().equalsIgnoreCase("GET")){
				searchValue=URLDecoder.decode(searchValue, "UTF-8");
			}
			
			Map<String, Object>map =new HashMap<String, Object>();
			map.put("searchKey", searchKey);
			map.put("searchValue", searchValue);
			map.put("m1_Num", info.getM1_Num());
			
			dataCount=service.dataCount(map);
			if(dataCount !=0)
				total_page = myUtil.pageCount(rows, dataCount);
			
			if(total_page < current_page)
				current_page = total_page;
			
			int start = (current_page-1)* rows+1;
			int end = (current_page * rows);
			map.put("start", start);
			map.put("end", end);
			
			List<UserBbs> list=service.listUserBbs(map);
			
			int listNum, n=0;
			Iterator<UserBbs> it=list.iterator();
			while(it.hasNext()){
				UserBbs data=it.next();
				listNum = dataCount-(start+n-1);
				data.setListNum(listNum);
				n++;
			}
			
			String query="";
			String listUrl=cp+"/userBbs/list";
			String articleUrl = cp+"userBbs/article?page="+current_page;
			if(searchValue.length()!=0){
				query = "searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue,"UTF-8");
			}
			
			if(query.length()!=0){
				listUrl=cp+"/userBbs/list?"+query;
				articleUrl=cp+"/userBbs/article?page="+current_page+"&"+query;
			}
			String paging=myUtil.paging(current_page, total_page, listUrl);
			
			model.addAttribute("list", list);
			model.addAttribute("articleUrl", articleUrl);
			model.addAttribute("page", current_page);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("total_page", total_page);
			model.addAttribute("paging", paging);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ".userBbs.list";
		
	}
	
	@RequestMapping(value="/userBbs/created",method=RequestMethod.GET)
	public String createdForm(HttpSession session, Model model){
		try {
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			if(info==null){
				return "redirect:/member/login";
			}
			model.addAttribute("mode", "created");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ".userBbs.created";
	}
	
	@RequestMapping(value="/userBbs/created", method=RequestMethod.POST)
	public String createdSubmit(
			UserBbs dto,
			HttpSession session
			){
		try {
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			if(info==null){
				return "redirect:/member/login";
			}
			String root=session.getServletContext().getRealPath("/");
			String pathname=root+File.separator+"uploads"+File.separator+"userBbs";
			
			dto.setM1_Email(info.getUserId());
			dto.setM1_Num(info.getM1_Num());
			
			service.insertUserBbs(dto, pathname);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/userBbs/list"; 
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}