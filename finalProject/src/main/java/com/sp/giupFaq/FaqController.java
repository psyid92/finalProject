package com.sp.giupFaq;

import java.net.URLDecoder;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.common.MyUtil;
import com.sp.store.member.SessionInfo;




@Controller("giupFaq.faqController")
public class FaqController {
		
	@Autowired
	private FaqService service;
	
	@Autowired
	private MyUtil myUtil;
	
	//faq
	@RequestMapping(value="/giupFaq/faq")
	public String faq(
			@RequestParam(value ="fCate_Num", defaultValue="0") int fCate_Num,
			@RequestParam(value ="pageNo", defaultValue="1") int current_page,
			Model model
			) throws Exception {
		
		List<Faq> listedFCate = service.listedFCate();
		
		model.addAttribute("subMenu", "2");
		model.addAttribute("fCate_Num", fCate_Num);  
		model.addAttribute("pageNo", current_page); 
		model.addAttribute("listedFCate", listedFCate);  //attributeName=jsp의 이름, attributeValue dto 이름(or 넘길이름, 사용할 이름)
		
		model.addAttribute("mainMenu", "3");
		
		return ".store4.menu4.giupFaq.faq";
	}
	
	//List
	@RequestMapping(value="/giupFaq/list")
	public String list(
			@RequestParam(value="fCate_Num", defaultValue="0") int fCate_Num, 
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model,
			HttpServletRequest req			
			) throws Exception {
		
		int rows = 10;
		int total_page=0, dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET"))
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		
		//전체 페이지 수 
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fCate_Num", fCate_Num);
		map.put("searchValue", searchValue);
		
		dataCount =service.dataCount(map);
		if(dataCount !=0)
			total_page = myUtil.pageCount(rows, dataCount);
		
		// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
		if(total_page < current_page)
			current_page=total_page;
		
		// 리스트에 출력할 데이터를 가져오기
		int start = (current_page-1)*rows+1;
		int end = current_page * rows; 
		map.put("start", start);
		map.put("end", end);
		
		List<Faq> list = service.listFaq(map);
		Iterator<Faq> it = list.iterator();
		while(it.hasNext()) {
			Faq dto=it.next();
			dto.setF_Content(dto.getF_Content().replaceAll("\n", "<br>"));
		}
		
		String paging= myUtil.paging(current_page, total_page);
		
		model.addAttribute("subMenu", "2");
		model.addAttribute("list", list);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("fCate_Num", fCate_Num);
		model.addAttribute("paging", paging);
		
		model.addAttribute("mainMenu", "3");
		
		return "store/menu4/giupFaq/list";
	}
	
	
	//신규작성
	@RequestMapping(value="/giupFaq/created", method=RequestMethod.GET)
	public String createdForm(
			@RequestParam(value="fCate_Num", defaultValue="0") int fCate_Num,
			Model model, HttpSession session
			) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("store");
		
		if(info ==null) 
			return "redirect:/store/login ";
		
		if(! info.getG1_Id().equals("admin"))
			return "redircect:/giupFaq/list?fCate_Num="+fCate_Num;
		
		List<Faq> listFCate = service.listFCate();
		List<Faq> listedFCate = service.listedFCate();
		
		model.addAttribute("subMenu", "2");
		model.addAttribute("fCate_Num", fCate_Num);
		model.addAttribute("listFCate", listFCate);
		model.addAttribute("listedFCate", listedFCate);
		model.addAttribute("mode", "created");		
		
		// model.addAttribute("mainMenu", "3");
		
		return ".store4.menu4.giupFaq.created";
	}
	
	@RequestMapping(value="/giupFaq/created", method=RequestMethod.POST)
	public String createdSubmit(
			Faq dto, HttpSession session
			) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("store");
		
		if(info==null) 
			return "redirect:/store/login";
		
		int fCate_Num = dto.getfCate_Num();	
		
		if(! info.getG1_Id().equals("admin"))
			return "redirect:/giupFaq/faq?fCate_Num="+fCate_Num;		
			
		dto.setAdmin_Id(info.getG1_Id());
		service.insertFaq(dto);
		
		return "redirect:/giupFaq/faq?fCate_Num="+fCate_Num;
	}
	
	//상세 ---> 없음. 	
	
	//수정 
	@RequestMapping(value="/giupFaq/update", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam(value="fCate_Num", defaultValue="0") int fCate_Num,
			@RequestParam(value="pageNo") int pageNo,
			@RequestParam(value="f_Num") int f_Num,
			Model model, HttpSession session
			) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("store");
		
		if(info==null)
			return "redirect:/store/login";
		
		if(! info.getG1_Id().equals("admin"))
			return "redirect:/giupFaq/faq?fCate_Num="+fCate_Num;
		
		Faq dto = service.readFaq(f_Num);
		if(dto==null)
			return "redirect:/giupFaq/faq?fCate_Num="+fCate_Num;
		
		List<Faq> listFCate = service.listFCate();
		List<Faq> listedFCate = service.listedFCate();
		
		model.addAttribute("subMenu", "2");
		model.addAttribute("fCate_Num", fCate_Num);
		model.addAttribute("listFCate", listFCate);
		model.addAttribute("listedFCate", listedFCate);
		model.addAttribute("mode", "update");
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("dto", dto);
		
		return ".store4.menu4.giupFaq.created";
	}
	
	@RequestMapping(value="/giupFaq/update", method=RequestMethod.POST)
	public String updateSubmit(
			Faq dto, 
			@RequestParam(value="pageNo") String pageNo,
			@RequestParam(value="fCate_Num", defaultValue="0" ) int fCate_Num,
			HttpSession session
			) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("store");
		if (info == null)
			return "redirect:/store/login";
		
		if (! info.getG1_Id().equals("admin"))
			return "redirect:/giupFaq/faq?fCate_Num="+fCate_Num+"&pageNo="+pageNo;
		
		service.updateFaq(dto);
		
		return "redirect:/giupFaq/faq?fCate_Num="+fCate_Num+"&pageNo="+pageNo;
	}
	
	//삭제 
	@RequestMapping(value="/giupFaq/delete")
	public String delete(
			@RequestParam(value="f_Num") int f_Num,
			@RequestParam(value="fCate_Num", defaultValue="0") int fCate_Num, 
			@RequestParam(value="pageNo") int pageNo,
			HttpSession session, Model model
			) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("store");
		
		if (info==null)
			return "redirect:/store/login";
		
		if (! info.getG1_Id().equals("admin"))
			return "redirect:/giupFaq/faq?fCate_Num="+fCate_Num+"&pageNo="+pageNo;
		
		service.deleteFaq(f_Num);
		
		return "redirect:/giupFaq/faq?fCate_Num="+fCate_Num+"&pageNo="+pageNo;
	}
	
	//카테고리 신규
	@RequestMapping(value="/giupFaq/createFCate", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createFCate(
			@RequestParam(value="fCate_Name") String fCate_Name,
			HttpServletRequest req
			) throws Exception {
		int fCate_Num = 0, dataCount=0;
		
		String state= "false";
		
		dataCount=service.dataCountFCate();
		if(dataCount<10) {
			Faq dto = new Faq();
			dto.setfCate_Num(fCate_Num);
			dto.setfCate_Name(fCate_Name);
			
			try { // void로 처리하여  controller에서 오류를 잡음. try catch를 안할 경우. 서버가 죽음. 
				service.insertFCate(dto);
				state="true";
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		req.setAttribute("state", state);
		return listFCate(req);
	}
	
	
	//카테고리 리스트
	@RequestMapping(value="/giupFaq/listFCate")
	@ResponseBody
	public Map<String, Object> listFCate(
			HttpServletRequest req			
			) throws Exception {
		List<Faq> list =service.listFCate();
		
		// 카테고리 추가 및 삭제에서 상태
		String state=(String)req.getAttribute("state");
		
		// 작업 결과를 json으로 전송
		Map<String, Object> fCatemodel = new HashMap<>();
		fCatemodel.put("state", state);
		fCatemodel.put("list", list);
		
		return fCatemodel;
	}
	
	
	//카테고리 삭제 
	@RequestMapping(value="/giupFaq/deleteFCate")
	@ResponseBody
	public Map<String, Object> deleteFCate(
			@RequestParam(value="fCate_Num") int fCate_Num,
			HttpServletRequest req) throws Exception {
		
		String state = "true";
		
		try {
			service.deleteFCate(fCate_Num);
		} catch (Exception e) {
			state="false";
		}
		
		req.setAttribute("state", state);
		
		return listFCate(req);
	}
	
}
