package com.sp.userFaq;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

@Controller("userFaq.userFaqController")
public class UserFaqController {
	
	@Autowired
	private UserFaqService service;
	
	@Autowired
	private MyUtil myUtil;
	
	
	@RequestMapping(value={"/userFaq/faq", "/auserfaq/faq"})
	public String userFaq(
			HttpSession session,
			Model model)throws Exception{
		try {
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			
			if(info.getUserId().equals("admin")){
				model.addAttribute("mainMenu", "3");
				return ".admin4.menu4.memberfaq.faq";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ".userFaq.faq";
	}
	
	
	@RequestMapping(value={"/userFaq/list", "/auserfaq/list"})
	public String list(
			HttpSession session,
			Model model)throws Exception{
		try {
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			
			if(info.getUserId().equals("admin")){
				model.addAttribute("mainMenu", "3");
				return ".admin4.menu4.memberfaq.list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ".userFaq.list";
	}
	
	
	
	@RequestMapping(value="/auserfaq/created", method=RequestMethod.GET)
	public String createdForm(
			Model model
			,@RequestParam(value="category", defaultValue="0")int ca_Num,
			HttpSession session
			)throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(! info.getUserId().equals("admin"))
			return "redirect:/admin/login";
		
		List<UserFaq> listCategory=service.listCategory();
		List<UserFaq> listUserFaqCategory=service.listUserFaqCategory();
		
		model.addAttribute("category", ca_Num);
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("listUserFaqCategory", listUserFaqCategory);
		model.addAttribute("mode", "created");
		
		return ".admin4.menu4.memberfaq.created";
	}
	
	@RequestMapping(value="/auserfaq/created", method=RequestMethod.POST)
	public String createdSubmit(
			UserFaq dto
			){
		try {
			dto.setAdmin_Id("admin");
			service.insertUserFaq(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/auserfaq/list";
	}
		
	
	
	
	@RequestMapping(value="/auserfaq/categoryCreated", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> categoryCreated(
			@RequestParam(value="ca_class")String ca_class,
			HttpServletRequest req
			) throws Exception{
		int ca_Num=0;
		int dataCount=0;
		
		String state="false";
		
		dataCount=service.dataCountCategory();
		if(dataCount<10){
			UserFaq dto=new UserFaq();
			dto.setCa_Num(ca_Num);
			dto.setCa_class(ca_class);
			
			int result=service.insertCategory(dto);
			if(result==1)
				state="true";
		}
		req.setAttribute("state", state);
		return categoryList(req);
	}
	
	@RequestMapping(value="/auserfaq/categoryList")
	@ResponseBody
	public Map<String, Object> categoryList(
			HttpServletRequest req
			) throws Exception{
		List<UserFaq>list=service.listCategory();
		
		//카테고리 추가 및 삭제에서 상태
		String state=(String)req.getAttribute("state");
		
		//작업 결과를 json으로 전송
		Map<String, Object>model =new HashMap<>();
		model.put("state", state);
		model.put("list", list);
		return model; 
	}
	
	@RequestMapping(value="/auserfaq/categoryDelete")
	@ResponseBody
	public Map<String, Object> categoryDelete(
			HttpServletRequest req,
			@RequestParam(value="ca_Num")int ca_Num
			)throws Exception{
		String state="true";
		
		int result=service.deleteCategory(ca_Num);
		if(result==0)
			state="false";
		
		req.setAttribute("state", state);
		return categoryList(req);
	}
	
	
	
	
}
