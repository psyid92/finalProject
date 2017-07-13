package com.sp.store.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

//사장님 페이지 컨트롤러
@SessionAttributes("storeDto")
@Controller("member.storeController")
public class StoreContorller {
	@ModelAttribute("storeDto")
	public Store command() {
		return new Store();
	}

	@Autowired
	private StoreService service;

	// 로그인창으로 이동
	@RequestMapping(value = "/store/login", method = RequestMethod.GET)
	public String storeLoginForm(String login_error, Model model) {
		
		return "store/store/login";
	}
	// 로그인시 이동할 페이지로 리턴
	@RequestMapping(value = "/store/login", method = RequestMethod.POST)
	public String storeLoginSubmit(
			@RequestParam String g1_Id,
			@RequestParam String g1_Pwd,
			HttpSession session,
			Model model) throws Exception{
		
		Store store = service.readStore(g1_Id);
		
		if (store == null || (!store.getG1_Pwd().equals(g1_Pwd))){
			model.addAttribute("message", "아이디 또는 패스워드가 일치하지 않습니다.");
			return "store/store/login";
		}
		
		// 로그인 정보를 세션에 저장
		SessionInfo info = new SessionInfo();
		info.setG1_Id(store.getG1_Id());
		info.setG1_Name(store.getG1_Name());
		info.setG1_Num(store.getG1_Num());
		session.setAttribute("store", info);
		
		return ".store4.menu1.mystore.list";
	}

	@RequestMapping(value="/store/logout")
	public String logout(HttpServletRequest req, HttpSession session, Model model){
		session.removeAttribute("store");
		session.invalidate();
		
		return "store/store/login";
	}
	
	// 회원가입 눌렀을때
	@RequestMapping(value = "/store/join", method = RequestMethod.GET)
	public String storeJoinForm(@ModelAttribute("storeDto") Store store, Model model) {

		model.addAttribute("mode", "created");
		return ".store.store.step1";
	}

	// 다음단계
	@RequestMapping(value = "/store/step2", method = RequestMethod.POST)
	public String storeStep2(@ModelAttribute("storeDto") Store store, SessionStatus sessionstatus, Model model) {
		
		model.addAttribute("mode", "created");
		
		return ".store.store.step2";
	}

	@RequestMapping(value = "/store/complete", method = RequestMethod.POST)
	public String storeSubmit(@ModelAttribute("storeDto") Store store,
			SessionStatus sessionstatus, Model model) {
		//패스워드 암호화
		/*ShaPasswordEncoder pe = new ShaPasswordEncoder(256);
		String s = pe.encodePassword(store.getG1_Pwd(), null);
		store.setG1_Pwd(s);*/
		StringBuffer sb = new StringBuffer();
		
		//위도 경도 추가
		try {
			service.insertStore(store);
			
			sessionstatus.setComplete();
			
		} catch (Exception e) {
			model.addAttribute("message", "회원가입이 실패했습니다. 다른 아이디로 다시 가입하시기 바랍니다.");
			model.addAttribute("mode", "created");
			sessionstatus.setComplete();
			return ".store.store.complete";
		}
		sb.append(store.getG1_Name() + "사장님의 회원 가입이 정상적으로 처리되었습니다.<br>");
		sb.append("메인화면으로 이동하여 로그인 하시기 바랍니다.<br>");
		sessionstatus.setComplete();

		model.addAttribute("title", "회원 가입");
		model.addAttribute("message", sb.toString());
		
		return ".store.store.complete";
	}
	
	@RequestMapping(value="/store/g1_IdCheck")
	@ResponseBody
	public Map<String, Object> g1_IdCheck(
			@RequestParam String g1_Id
			) throws Exception {
		String passed="false";
		Store store = service.readStore(g1_Id);
		if(store==null)
			passed="true";
		
   	    // 작업 결과를 json으로 전송
		Map<String, Object> map = new HashMap<>(); 
		map.put("passed", passed);
		return map;
	}
	
	@RequestMapping(value="/store/g2_GiupNumCheck")
	@ResponseBody
	public Map<String, Object> g2_GiupNumCheck(
			@RequestParam String g2_GiupNum
			) throws Exception {
		String passed="false";
		Store store = service.readStore2(g2_GiupNum);
		if(store==null)
			passed="true";
		
   	    // 작업 결과를 json으로 전송
		Map<String, Object> map = new HashMap<>(); 
		map.put("passed", passed);
		return map;
	}
	
}
