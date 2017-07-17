package com.sp.giupQna;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.aop.ThrowsAdvice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.common.FileManager;
import com.sp.common.MyUtil;

@Controller("giupQna.qnaController")
public class QnaController {
	@Autowired
	private QnaService service;
	
	@Autowired
	private FileManager fileManager; 
	
	@Autowired
	private MyUtil myUtil; 
	
	
	// 리스트 보기 
	@RequestMapping(value="/giupQna/list")
	public String list(
			@RequestParam(value="page", defaultValue = "1") int current_page, 
			@RequestParam(value="searchkey", defaultValue="q_Title") String searchkey, 
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model, HttpServletRequest req
			) throws Exception {
		String cp = req.getContextPath();
		
		int rows =10; 
		int total_page = 0;
		int dataCount = 0; 
		
		if(req.getMethod().equalsIgnoreCase("GET")) // Get방식인 경우 
			searchValue = URLDecoder.decode(searchValue,"utf-8");
		
		//전체 페이지 수 
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchkey", searchkey);
		map.put("searchValue", searchValue);
		
		dataCount=service.dataCount(map);
		if(dataCount !=0)
			total_page=myUtil.pageCount(rows, dataCount);
		
		// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
		if(total_page <current_page) 
			current_page=total_page;
		
		// 리스트에 출력할 데이터를 가져오기
		int start = (current_page-1) * rows +1; 
		int end = current_page *rows; 
		map.put("start", start);
		map.put("end", end);
		
		// 글 리스트
		List<Qna> list = service.ListQna(map);
				
		// 리스트의 번호
		int listNum, n=0;
		Iterator<Qna> it = list.iterator();
		while(it.hasNext()) {
			Qna data = it.next();
			listNum = dataCount - (start + n-1);
			data.setListNum(listNum);
			n++;
		}
		
		String query ="";
		String listUrl = cp+"/giupQna/list";
		String articleUrl = cp+"giupQna/article?page="+current_page;
		if(searchValue.length() !=0) {
			query = "searchkey="+searchkey+"&searchValue="
					+URLEncoder.encode(searchValue, "utf-8");
		}
		
		if(query.length() !=0) {
			listUrl = cp+"/giupQna/list"+query;
			articleUrl=cp+"/giupQna/article?page="+current_page+"&"+query;
		}
		
		String paging = myUtil.paging(current_page,total_page,listUrl);
		
		model.addAttribute("subMenu", "3");
		
		model.addAttribute("", list);
		model.addAttribute("", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("", dataCount);
		model.addAttribute("", total_page);
		model.addAttribute("", paging);
		model.addAttribute("mainMenu", "3");
		
		return ".store4.menu4.giupQna.list";
	}
	
	
	// 신규작성 
	@RequestMapping(value="/giupQna/created", method=RequestMethod.GET)
	public String createForm(
			Model model, HttpSession session) throws Exception {
		
		return ".store4.menu4.giupQna.created";
	}
	
	
	@RequestMapping(value="/giupQna/created", method=RequestMethod.POST)
	public String createdSubmit(
			Qna dto, HttpSession session) throws Exception {
		
		return "redirect:/giupQna/list";
	}
	
	
	// 상세보기
	@RequestMapping(value="/giupQna/article", method=RequestMethod.GET)
	public String article(
			@RequestParam(value="q_Num") int q_Num,
			@RequestParam(value="page") int page,
			@RequestParam(value="searchKey", defaultValue="q_Title") String searchKey, 
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model) throws Exception {
		
		return ".store4.menu4.giupQna.article";
	}
	
	
	// 수정 
	@RequestMapping(value="/giupQna/update", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam(value="q_Num") int q_Num,
			@RequestParam(value="page") String page,
			Model model, HttpSession session) throws Exception {
		
		
		return ".store4.menu4.giupQna.created";		
	}
	
	
	@RequestMapping(value="/giupQna/update", method=RequestMethod.POST)
	public String updateSubmit(
			Qna dto, 
			@RequestParam String page, HttpSession session) throws Exception {
		
		return "redirect:/giupQna/list?page="+page;
	}
	
	
	// 삭제 
	@RequestMapping(value="/giupQna/delete")
	public String delete(
			int q_Num, String page, HttpSession session) throws Exception {
		
		return "redirect:/giupQna/list?page="+page;
		
	}
	
	// 파일 다운로드 
	@RequestMapping(value="/giupQna/download")
	public void download(
			@RequestParam(value="q_Num") int q_Num, 
			HttpServletRequest req,
			HttpServletResponse resp,  
			HttpSession session) throws Exception {
		

	}
	
	// 파일 삭제
	@RequestMapping(value="/giupQna/deleteFile")
	public String deleteFile(
			@RequestParam int q_Num, 
			@RequestParam String page, 
			HttpSession session) throws Exception {
		
		return "redirect:/giupQna/update?q_Num="+q_Num+"&page="+page;
	}
	
	
	// 댓글 달기
	@RequestMapping(value="/giupQna/reply", method=RequestMethod.GET)
	public String replyForm(
			@RequestParam int q_Num, 
			@RequestParam String page,
			Model model, 
			HttpSession session
			) throws Exception {
		
		return ".store4.menu4.giupQna.created";
	}
	
	@RequestMapping(value="giupQna/reply", method=RequestMethod.POST)
	public String replySubmit(
			Qna dto, 
			@RequestParam String page, 
			HttpSession session) throws Exception {
		
		return "redirect:/giupQna/list?page="+page;
	}
	
	// 타일즈의 각 메뉴로 이동
	@RequestMapping(value="/giupNotice/list", method=RequestMethod.GET)
	public String giupNoticeList(Model model) {
		model.addAttribute("mainMenu", "3");
		model.addAttribute("subMenu", "1");
		
		return ".store4.menu4.giupNotice.list";
	}
	
	@RequestMapping(value="/giupFaq/list", method=RequestMethod.GET)
	public String giupFaqList(Model model) {
		model.addAttribute("mainMenu", "3");
		model.addAttribute("subMenu", "2");
		
		return ".store4.menu4.giupFaq.list";
	}
	
}
