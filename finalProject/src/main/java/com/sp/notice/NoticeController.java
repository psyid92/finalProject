package com.sp.notice;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

@Controller("notice.noticeController")
public class NoticeController {
	private final Logger logger=LoggerFactory.getLogger(getClass());
	
	@Autowired
	private NoticeService service;
	
	@Autowired
	private MyUtil myUtil;
    
	@RequestMapping(value={"/notice/list", "/anotice/list"})
	public String list(
			@RequestParam(value="page", defaultValue="1")int current_page,
			@RequestParam(value="searchKey" ,defaultValue="noti_Title")String searchKey,
			@RequestParam(value="searchValue", defaultValue="")String searchValue,
			Model model,
			HttpSession session,
			HttpServletRequest req
			){
		try {
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			
			String cp= req.getContextPath();
			
			int rows = 10;
			int total_page = 0;
			int dataCount = 0;
			
			if(req.getMethod().equalsIgnoreCase("GET")){
				searchValue = URLDecoder.decode(searchValue, "UTF-8");
			}
			
			Map<String, Object>map = new HashMap<String, Object>();
			map.put("searchKey", searchKey);
			map.put("searchValue", searchValue);
			
			dataCount = service.dataCount(map);
			if(dataCount != 0)
				total_page = myUtil.pageCount(rows, dataCount);
			
			//다른 사람이 자료를 삭제하여 전체 페이지수가 변화된 경우 
			if(total_page < current_page)
				current_page = total_page;
			
			//1페이지에서 공지 띄우기(noti_Top)
			List<Notice> noticeList = null;
			if(current_page==1){
				noticeList=service.listNoticeTop();
			}
			
			int start = (current_page -1) * rows +1;
			int end = current_page * rows;
			map.put("start", start);
			map.put("end", end);
			
			List<Notice> list = service.listNotice(map);
			
			//list 번호
			Date endDate = new Date();
			long gap;
			int listNum, n=0;
			Iterator<Notice> it=list.iterator();
			while(it.hasNext()){
				Notice data=(Notice)it.next();
				listNum = dataCount - (start+n-1);
				data.setListNum(listNum);
				
				SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");
				Date beginDate = formatter.parse(data.getNoti_Created());
				
				gap=(endDate.getTime()-beginDate.getTime()) / (60*60*1000);
				data.setGap(gap);
				
				data.setNoti_Created(data.getNoti_Created().substring(0, 10));
				n++;
				
			}
			String query = "";
			
			//재영이형한테 물보자 ㅎㅎ.....
			//if(info.getUserId().equals("admin")){
				String listUrl = cp+"/notice/list";
			//}else{
			//	String listUrl = cp+"/anotice/list";
			//}
			String articleUrl = cp+"/notice/article?page=" + current_page;
			if(searchValue.length()!=0){
				query = "searchKey=" +searchKey + "&searchValue="+URLEncoder.encode(searchValue, "UTF-8");
			}
			
			if(query.length()!=0){
				listUrl = cp+"/notice/list?"+query;
				articleUrl = cp+"/notice/article?page=" + current_page + "&"+ query;
			}
			
			String paging = myUtil.paging(current_page, total_page, listUrl);
			
			model.addAttribute("noticeList", noticeList);
			model.addAttribute("list", list);
			model.addAttribute("articleUrl", articleUrl);
			model.addAttribute("page", current_page);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("paging", paging);
			
			if(info.getUserId().equals("admin")){
				model.addAttribute("mainMenu", "3");
				return ".admin4.menu4.membernotice.list";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ".notice.list";
	}
	
	@RequestMapping(value="/admin/membernotice/created", method=RequestMethod.GET)
	public String createdForm(
			Model model) throws Exception{
        model.addAttribute("mode", "created");
		
		return ".admin4.menu4.membernotice.created";
	}
	
	@RequestMapping(value="/admin/membernotice/created", method=RequestMethod.POST)
	public String createdSubmit(Notice dto){
		try {
			
			dto.setAdmin_Id("admin");
			service.insertNotice(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/anotice/list";
	}
	
}
