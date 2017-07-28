package com.sp.userQna;

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

import com.sp.common.FileManager;
import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

@Controller("userQna.userQnaController")
public class UserQnaController {
	
	@Autowired
	private UserQnaService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;
    
	
	@RequestMapping(value={"/userQna/list", "/auserQna/list"})
	public String userQna(
			@RequestParam(value="page", defaultValue="1")int current_page,
			@RequestParam(value="searchKey" ,defaultValue="uq_Title")String searchKey,
			@RequestParam(value="searchValue", defaultValue="")String searchValue,
			Model model,
			HttpSession session,
			HttpServletRequest req
			){
		try {
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			String cp=req.getContextPath();
			
			int rows=10;
			int total_page=0;
			int dataCount=0;
			
			if(req.getMethod().equalsIgnoreCase("GET")){
				searchValue = URLDecoder.decode(searchValue, "UTF-8");
			}
			
			Map<String, Object>map=new HashMap<String, Object>();
			map.put("m1_Num", info.getM1_Num());
			map.put("searchKey", searchKey);
			map.put("searchValue", searchValue);
			
			dataCount=service.dataCount(map);
			if(dataCount !=0)
				total_page=myUtil.pageCount(rows, dataCount);
			
			if(total_page < current_page)
				current_page = total_page;
			
			//리스트에 출력할 데이터 가져오기
			int start=(current_page-1)*rows+1;
			int end=current_page*rows;
			map.put("start", start);
			map.put("end", end);
			
			List<UserQna>list=service.listUserQna(map);
			
			int listNum, n=0;
			Iterator<UserQna>it=list.iterator();
			while(it.hasNext()){
				UserQna data=it.next();
				listNum=dataCount-(start+n-1);
				data.setListNum(listNum);
				n++;
			}
			
			String query="";
			String listUrl = cp+"/userQna/list";
			String articleUrl=cp+"/userQna/article?page="+current_page;
			if(searchValue.length()!=0){
				query = "searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue,"UTF-8");
			}
			
			if(query.length()!=0){
				listUrl=cp+"/userQna/list?"+query;
				articleUrl=cp+"/userQna/article?page="+current_page+"&"+query;
			}
			
			String paging=myUtil.paging(current_page, total_page, listUrl);
			
			model.addAttribute("list", list);
			model.addAttribute("articleUrl", articleUrl);
			model.addAttribute("page", current_page);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("paging", paging);
			
			if(info.getUserId().equals("admin")){
				model.addAttribute("mainMenu", "0");
				model.addAttribute("subMenu", "3");
				return ".admin4.menu1.memberqna.list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ".userQna.list";
	}
	
	
	
	@RequestMapping(value="/userQna/created", method=RequestMethod.GET)
	public String createdForm(
			HttpSession session,
			Model model
			)throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info==null){
			return "redirect:/member/login";
		}
		model.addAttribute("mode", "created");
		return ".userQna.created";
	}
	
	
	@RequestMapping(value="/userQna/created", method=RequestMethod.POST)
	public String createdSubmit(
			HttpSession session,
			UserQna dto
			)throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info==null){
			return "redirect:/member/login";
		}
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"userQna";
		
		dto.setM1_Email(info.getUserId());
		dto.setM1_Num(info.getM1_Num());
		service.insertUserQna(dto, pathname);
		
		return "redirect:/userQna/list";
	}
	
	@RequestMapping(value="/userQna/download")
	public void download(
			@RequestParam int uq_Num,
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
			String pathname=root+File.separator+"uploads"+File.separator+"userQna";
			UserQna dto=service.readUserQna(uq_Num);
			boolean flag=false;
			
			if(dto!=null){
				flag=fileManager.doFileDownload(dto.getUq_SaveFilename(), dto.getUq_OriginalFilename(), pathname, resp);
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

	
	@RequestMapping(value={"/userQna/article", "/auserQna/article"})
	public String article(
			@RequestParam(value="uq_Num") int uq_Num,
			@RequestParam(value="page")String page,
			@RequestParam(value="searchKey", defaultValue="uq_Title")String searchKey,
			@RequestParam(value="searchValue", defaultValue="")String searchValue,
			Model model,
			HttpSession session
			){
		try {
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			if(info==null){
				return "redirect:/member/login";
			}
			
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
			UserQna dto=service.readUserQna(uq_Num);
			if(dto==null && info.getUserId().equals("admin")){
				return "redirect:/auserQna/list?page="+page;
			}else if(dto==null){
				return "redirect:/userQna/list?page="+page;
			}
			dto.setUq_Content(dto.getUq_Content().replaceAll("\n", "<br>"));
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("searchKey", searchKey);
			map.put("searchValue", searchValue);
			map.put("uq_Num", uq_Num);
			
			UserQna preReadDto = service.preReadUserQna(map);
			UserQna nextReadDto = service.nextReadUserQna(map);
			
			String query = "page="+page;
			if(searchValue.length()!=0){
				query += "&searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "UTF-8");
			}
			
			model.addAttribute("dto", dto);
			model.addAttribute("preReadDto", preReadDto);
			model.addAttribute("nextReadDto", nextReadDto);
			model.addAttribute("page", page);
			model.addAttribute("query", query);
			
			if(info.getUserId().equals("admin")){
				model.addAttribute("mainMenu", "0");
				model.addAttribute("subMenu", "3");
				return ".admin4.menu1.memberqna.article";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ".userQna.article";
	}
	
	@RequestMapping(value="/userQna/update", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam(value="uq_Num")int uq_Num,
			@RequestParam(value="page")String page,
			Model model,
			HttpSession session
			){
		try {
			UserQna dto=(UserQna)service.readUserQna(uq_Num);
			if(dto==null){
				return "redirect:/userQna/list?page="+page;
			}
			
			model.addAttribute("mode", "update");
			model.addAttribute("dto", dto);
			model.addAttribute("page", page);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ".userQna.created";
	}
	
	@RequestMapping(value="/userQna/update", method=RequestMethod.POST)
	public String updateSubmit(
			@RequestParam String page,
			UserQna dto,
			HttpSession session
			){
		try {
			SessionInfo info=(SessionInfo) session.getAttribute("member");
			if(info==null){
				return "redirect:/member/login";
			}
			String root=session.getServletContext().getRealPath("/");
			String pathname = root+File.separator+"uploads"+File.separator + "userQna";
			
			service.updateUserQna(dto, pathname);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/userQna/list?page="+page;
	}
	
	@RequestMapping(value="/userQna/deleteFile", method=RequestMethod.GET)
	public String deleteFile(
			@RequestParam(value="uq_Num")int uq_Num,
			@RequestParam(value="page")String page,
			HttpSession session
			){
		try {
			UserQna dto=service.readUserQna(uq_Num);
			if(dto==null){
				return "redirect:/userQna/list?page="+page;
			}
			
			String root=session.getServletContext().getRealPath("/");
			String pathname = root+File.separator+"uploads"+File.separator + "userQna";
			if(dto.getUq_SaveFilename()!=null && dto.getUq_SaveFilename().length()!=0){
				fileManager.doFileDelete(dto.getUq_SaveFilename(), pathname);
				
				dto.setUq_SaveFilename("");
				dto.setUq_OriginalFilename("");
				service.updateUserQna(dto, pathname);
			}
			
		} catch (Exception e) {
			
		}
		return "redirect:/userQna/update?uq_Num="+uq_Num+"&page="+page;
	}
	
	@RequestMapping(value="/userQna/delete")
	public String delete(
			@RequestParam String page,
			@RequestParam int uq_Num,
			HttpSession session
			){
		try {
			UserQna dto=service.readUserQna(uq_Num);
			if(dto==null){
				return "redirect:/userQna/list?page="+page;
			}
			String root=session.getServletContext().getRealPath("/");
			String pathname = root+File.separator+"uploads"+File.separator + "userQna";
			
			service.deleteUserQna(uq_Num, dto.getUq_SaveFilename(), pathname);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/userQna/list?page="+page;
	}
	
	
	
	
	
}