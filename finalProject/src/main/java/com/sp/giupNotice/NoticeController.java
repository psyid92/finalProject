package com.sp.giupNotice;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.List;

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

@Controller("giupNotice.noticeController")
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileMangaer; 
	
	//list 
	@RequestMapping(value="/giupNotice/list")
	public String List(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="title") String searchKey, 
			@RequestParam(value="searchhValue", defaultValue="") String searchValue, 
			Model model, HttpServletRequest req ) throws Exception {
		
		String cp = req.getContextPath();
		
		int rows = 10;
		int total_page=0;
		int dataCount=0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) { // Get방식인 경우 
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
		//전체 페이지 수 
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		dataCount=service.dataCount(map);
		if(dataCount !=0)
			total_page = myUtil.pageCount(rows, dataCount);
		
		// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
		if(total_page <current_page)
			current_page=total_page;		
		
		// 1페이지인 경우 공지리스트 가져오기
		List<Notice> noticeList = null;
		if(current_page==1) {
			noticeList=service.listNoticeTop();
		}		
		
		// 리스트에 출력할 데이터를 가져오기
		int start = (current_page -1) *rows +1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);		
		
		// 글 리스트
		List<Notice> list = service.listNotice(map);
		System.out.println(list.size());
		// 리스트의 번호
		Date endDate = new Date();
		long gap; 
		int listNum, n =0;
		Iterator<Notice> it = list.iterator();
		/*while(it.hasNext()) {
			Notice data =(Notice)it.next();
			listNum =dataCount -(start +n -1);
			data.setListNum(listNum);
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date beginDate = formatter.parse(data.getCreated());
			
			//날짜차이(시간)
			gap=(endDate.getTime() - beginDate.getTime()) /(60*60*1000);
			data.setGap(gap);
			
			data.setCreated(data.getCreated().substring(0, 10));
			
			n++;
		}*/
		
		String query = "";
		String listUrl = cp+"/giupNotice/list";
		String articleUrl = cp+"/giupNotice/article?page="+current_page;
		if(searchValue.length()!=0) {
			query ="searchKey="+searchKey+"&searchValule="+URLEncoder.encode(searchValue,"utf-8");
		}
		
		if(query.length() !=0) {
			listUrl = cp+"/giupNotice/list?"+query;
			articleUrl=cp+"/giupNotice/article?page="+current_page+"&"+query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl); 
		
		model.addAttribute("subMenu","1");
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("list", list);
		model.addAttribute("articleUrl",articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("paging", paging);
		model.addAttribute("mainMenu", "3");
		model.addAttribute("subMenu", "1");
		System.out.println(dataCount);
		return ".store4.menu4.giupNotice.list";
	}
	
	
	//신규 작성 
	public String createdForm() throws Exception {
		
		return ".store4.menu4.giupNotice.created";
	}
	
	public String createdSubmit() throws Exception {
		
		return "redirect:/giupNotice/list";
	}
	
	
	//상세 보기 
	public String article() throws Exception {
		
		return ".store4.menu4.giupNotice.article";
	}
	
	
	//수정 
	@RequestMapping(value="/giupNotice/update", method=RequestMethod.GET)
	public String updateNotice(
			@RequestParam(value="num") int num,
			@RequestParam(value="page") int page, 
			Model model, HttpSession session) throws Exception {
		
		return ".store4.menu4.giupNotice.created";
	}
	
	@RequestMapping(value="/giupNotice/update", method=RequestMethod.POST)
	@ResponseBody
	public String updateSubmit(
			Notice dto, 
			@RequestParam int page,
			HttpSession session
			) throws Exception {
		
		return "redirect:/giupNotice/list?page="+page;
	}
	
	// 삭제 
	@RequestMapping(value="/giupNotice/delete", method=RequestMethod.GET)
	public String delete(
			Notice dto, 
			@RequestParam int num, 
			@RequestParam int page, 
			HttpSession session) throws Exception {
		
		return "rediect:/giupNotice/list?page "+page;
	}
	
	//다운로드 
	@RequestMapping(value="giupNotice/download")
	public void download() throws Exception {
		
	}
	
	public Map<String, Object> deleteFile(
			@RequestParam int fileNum,
			HttpServletResponse resp, HttpSession session
			) throws Exception {
		
		
		
		
		// 작업결과를 json으로 전송 
		Map<String, Object> model = new HashMap<>();
		model.put("state", "true");
		
		return model; 
	}
	
	@RequestMapping(value = "/giupFaq/list", method = RequestMethod.GET)
	public String faqList(Model model) {

		model.addAttribute("mainMenu", "3");
		model.addAttribute("subMenu", "2");
		return ".store4.menu4.giupFAQ.list";
	}
	
	@RequestMapping(value = "/giupQna/list", method = RequestMethod.GET)
	public String qnaList(Model model) {

		model.addAttribute("mainMenu", "3");
		model.addAttribute("subMenu", "3");
		return ".store4.menu4.giupQna.list";
	}
	
}
