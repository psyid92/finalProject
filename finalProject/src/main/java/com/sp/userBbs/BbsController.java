package com.sp.userBbs;

import java.io.File;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
			HttpServletRequest req,
			UserBbs dto
			){
		try {
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			if(info==null){
				return "redirect:/member/login";
			}
			
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
			map.put("userId", dto.getM1_Email());
			
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
			String articleUrl = cp+"/userBbs/article?page="+current_page;
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
	
	@RequestMapping(value="/userBbs/download")
	public void download(
			@RequestParam int bbs_Num,
			HttpServletRequest req,
			HttpServletResponse resp,
			HttpSession session
			){
		try {
			
			String cp=req.getContextPath();
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			if(info==null){
				resp.sendRedirect(cp+"/member/login");
				return;
			}
			String root=session.getServletContext().getRealPath("/");
			String pathname=root+File.separator+"uploads"+File.separator+"userBbs";
			UserBbs dto=service.readuserBbs(bbs_Num);
			boolean flag=false;
			
			if(dto!=null){
				flag=fileManager.doFileDownload(dto.getBbs_SaveFilename(), dto.getBbs_OriginalFilename(), pathname, resp);
			}
			if(! flag){
				resp.setContentType("text/html;charset=utf-8");
				PrintWriter out=resp.getWriter();
				out.print("<script>alert('파일 다운로드가 실패했습니다.');history.back();</script>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping(value="/userBbs/article")
	public String article(
			@RequestParam(value="bbs_Num") int bbs_Num,
			@RequestParam(value="page") String page,
			@RequestParam(value="searchKey", defaultValue="bbs_Subject")String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model,
			HttpSession session
			){
		try {
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			if(info==null){
				return "redirect:/member/login";
			}
			
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
			service.updateCount(bbs_Num);
			
			UserBbs dto= service.readuserBbs(bbs_Num);
			if(dto==null)
				return "redirect:/userBbs/list?page="+page;
			
			dto.setBbs_Content(dto.getBbs_Content().replaceAll("\n", "<br>"));
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("searchKey", searchKey);
			map.put("searchValue", searchValue);
			map.put("bbs_Num", bbs_Num);
			
			
			
			UserBbs preReadDto = service.preReadUserBbs(map);
			UserBbs nextReadDto = service.nextReadUserBbs(map);
			
			int countUserBbsLike=service.countUserBbsLike(bbs_Num);
			
			String query = "page="+page;
			if(searchValue.length()!=0){
				query += "&searchKey="+searchKey+"searchValue="+URLEncoder.encode(searchValue, "UTF-8");
			}
			
			model.addAttribute("dto", dto);
			model.addAttribute("preReadDto", preReadDto);
			model.addAttribute("nextReadDto", nextReadDto);
			model.addAttribute("countUserBbsLike", countUserBbsLike);
			model.addAttribute("page",page);
			model.addAttribute("query", query);
			model.addAttribute("userId",dto.getM1_Email());
			model.addAttribute("bbs_Num", bbs_Num);
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ".userBbs.article";
	}
	
	
	//게시물 공감추가
	@RequestMapping(value="/userBbs/insertUserBbsLike", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object>insertUserBbsLike(
			UserBbs dto,
			HttpSession session
			)throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="true";
		
		if(info==null){
			state="loginFail";
		}else{
			dto.setUserId(info.getUserId());
			dto.setBbs_Num(dto.getBbs_Num());
			dto.setM1_Num(info.getM1_Num());
			int result=service.insertUserBbsLike(dto);
			if(result==0)
				state="false";
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		model.put("dto", dto);
		return model;
	}
	
	@RequestMapping(value="/userBbs/countUserBbsLike", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> countUserBbsLike(
			@RequestParam(value="bbs_Num")int bbs_Num
			)throws Exception{
	        String state="true";
	        int countUserBbsLike=service.countUserBbsLike(bbs_Num);
			
			Map<String, Object> model=new HashMap<>();
		    model.put("state", state);
		    model.put("countUserBbsLike", countUserBbsLike);
		    
		    return model;
	}
	
	@RequestMapping(value="/userBbs/update", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam int bbs_Num,
			@RequestParam String page,
			Model model,
			HttpSession session
			){
		try {
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			if(info==null){
				return "redirect:/member/login";
			}
			
			UserBbs dto=service.readuserBbs(bbs_Num);
			if(dto==null){
				return "redirect:/userBbs/list?page="+page;
			}
			
			model.addAttribute("dto", dto);
			model.addAttribute("mode", "update");
			model.addAttribute("page", page);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ".userBbs.created";
	}
	
	@RequestMapping(value="/userBbs/update", method=RequestMethod.POST)
	public String updateSubmit(
			UserBbs dto,
			@RequestParam String page,
			HttpSession session
			){
		try {
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			if(info==null){
				return "redirect:/member/login";
			}
			String root=session.getServletContext().getRealPath("/");
			String pathname=root+File.separator+"uploads"+File.separator+"userBbs";
			
			service.updateUserBbs(dto, pathname);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/userBbs/list?page="+page;
	}
	
	@RequestMapping(value="/userBbs/deleteFile", method=RequestMethod.GET)
	public String deleteFile(
			@RequestParam String page,
			@RequestParam int bbs_Num,
			HttpSession session
			){
		try {
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			if(info==null) {
				return "redirect:/member/login";
			}
			
			UserBbs dto = service.readuserBbs(bbs_Num);
			if(dto==null) {
				return "redirect:/userBbs/list?page="+page;
			}
				
			
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + File.separator + "uploads" + File.separator + "bbs";		
			if(dto.getBbs_SaveFilename() != null && dto.getBbs_SaveFilename().length()!=0) {
				  fileManager.doFileDelete(dto.getBbs_SaveFilename(), pathname);
				  
				  dto.setBbs_SaveFilename("");
				  dto.setBbs_OriginalFilename("");
				  service.updateUserBbs(dto, pathname);
	       }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/userBbs/list?page="+page;
	}
	
	@RequestMapping(value="/userBbs/delete")
	public String delete(
			@RequestParam String page,
			@RequestParam int bbs_Num,
			HttpSession session
			){
		try {
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			if(info==null) {
				return "redirect:/member/login";
			}
			
			UserBbs dto = service.readuserBbs(bbs_Num);
			if(dto==null) {
				return "redirect:/userBbs/list?page="+page;
			}
			
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + File.separator + "uploads" + File.separator + "bbs";
			
			service.deleteUserBbs(bbs_Num, dto.getBbs_OriginalFilename(), pathname);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/userBbs/list?page="+page;
	}
	
	
	//댓글
	@RequestMapping(value="/userBbs/listUserReply")
	public String listUserReply(
			@RequestParam(value="bbs_Num")int bbs_Num,
			@RequestParam(value="pageNo", defaultValue="1")int current_page,
			Model model,
			HttpSession session
			){
		try {
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			UserReply dto = new UserReply();		
			int rows=5;
			int total_page=0;
			int dataCount=0;
			
			Map<String, Object>map=new HashMap<String, Object>();
			map.put("bbs_Num", bbs_Num);
			map.put("m1_Num", info.getM1_Num());
			
			
			dataCount=service.replyDataCount(map);
			total_page=myUtil.pageCount(rows, dataCount);
			if(current_page > total_page)
				current_page=total_page;
			
			int start=(current_page-1)*rows+1;
			int end=current_page*rows;
			map.put("start", start);
			map.put("end", end);
			List<UserReply> listUserReply=service.listUserReply(map);
			
			Iterator<UserReply> it=listUserReply.iterator();
			int listNum, n=0;
			while(it.hasNext()){
				UserReply dto1=new UserReply();
				dto1=it.next();
				listNum=dataCount-(start+n-1);
				dto.setListNum(listNum);
				dto.setRep_Content(dto1.getRep_Content().replaceAll("\n", "<br>"));
			}
			
			String paging=myUtil.paging(current_page, total_page);
			
			model.addAttribute("listUserReply", listUserReply);
			model.addAttribute("pageNo", current_page);
			model.addAttribute("replyDataCount", dataCount);
			model.addAttribute("total_page", total_page);
			model.addAttribute("paging", paging);
			model.addAttribute("m1_Num", info.getM1_Num());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "userBbs/listUserReply";
	}
	
	@RequestMapping(value="/userBbs/listUserReplyAnswer")
	public String listUserReplyAnswer(
			@RequestParam int rep_Answer,
			Model model,
			HttpSession session
			){
		try {
			SessionInfo info=(SessionInfo) session.getAttribute("member");
			UserReply dto=new UserReply();
			List<UserReply> listUserReplyAnswer=service.listUserReplyAnswer(rep_Answer);
			
			Iterator<UserReply> it=listUserReplyAnswer.iterator();
			while(it.hasNext()){
				UserReply dto1=new UserReply();
				dto1=it.next();
				dto1.setRep_Content(dto.getRep_Content().replaceAll("\n", "<br>"));
			}
			model.addAttribute("listUserReplyAnswer", listUserReplyAnswer);
			model.addAttribute("m1_Num", info.getM1_Num());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "userBbs/listUserReplyAnswer";
	}
	
	@RequestMapping(value="/userBbs/replyCountAnswer",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> replyCountAnswer(
			@RequestParam int rep_Answer
			){
		int count=0;
		count=service.replyCountAnswer(rep_Answer);
		
		Map<String, Object> model=new HashMap<>();
		model.put("count", count);
		return model;
	}
	
	@RequestMapping(value="/userBbs/createdReply",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createdReply(
			UserReply dto,
			HttpSession session
			){
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			
			String state="true";
			if(info==null){
				state="loginFail";
			}else{
				dto.setUserId(dto.getM1_Email());
				dto.setBbs_Num(dto.getBbs_Num());
				dto.setM1_Num(info.getM1_Num());
				int result=service.insertUserReply(dto);
				if(result==0)
					state="false";
			}				
		Map<String, Object> model =new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value="/userBbs/deleteReply",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteReply(
			@RequestParam int rep_Num,
			@RequestParam String mode,
			HttpSession session,
			UserReply dto
			){
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		String state="true";
		if(info==null){
			state="loginFail";
		}else{
			Map<String, Object>map=new HashMap<String, Object>();
			map.put("mode", mode);
			map.put("rep_Num", rep_Num);
			map.put("m1_Num", dto.getM1_Num());
			
			
			int result=service.deleteUserReply(map);
			
			if(result==0)
				state="false";
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		model.put("userId",dto.getM1_Email());
		
		return model;
	}
	
	
	
	
	
}