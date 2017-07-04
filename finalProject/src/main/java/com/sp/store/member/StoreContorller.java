package com.sp.store.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tiles.request.Request;
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

import com.sp.member.SessionInfo;

//사장님 페이지 컨트롤러
@SessionAttributes("dto")
@Controller("storeController")
public class StoreContorller {
	@ModelAttribute("dto")
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
		
		Store dto = service.readStore(g1_Id);
		if (dto == null || (!dto.getG1_Pwd().equals(g1_Pwd))){
			model.addAttribute("message", "아이디 또는 패스워드가 일치하지 않습니다.");
			return "store/store/login";
		}
		
		// 로그인 정보를 세션에 저장
		SessionInfo info = new SessionInfo();
		info.setUserId(dto.getG1_Id());
		info.setUserName(dto.getG1_Name());
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
	public String storeJoinForm(@ModelAttribute("dto") Store dto, Model model) {

		model.addAttribute("mode", "created");
		return ".store.store.step1";
	}

	// 다음단계
	@RequestMapping(value = "/store/step2", method = RequestMethod.POST)
	public String storeStep2(@ModelAttribute("dto") Store dto, SessionStatus sessionstatus, Model model) {
		
		model.addAttribute("mode", "created");
		
		return ".store.store.step2";
	}

	@RequestMapping(value = "/store/complete", method = RequestMethod.POST)
	public String storeSubmit(@ModelAttribute("dto") Store dto,
			SessionStatus sessionstatus, Model model) {
		//패스워드 암호화
		/*ShaPasswordEncoder pe = new ShaPasswordEncoder(256);
		String s = pe.encodePassword(dto.getG1_Pwd(), null);
		dto.setG1_Pwd(s);*/
		StringBuffer sb = new StringBuffer();
		
		//위도 경도 추가
		
		try {

			service.insertStore(dto);
			
			sessionstatus.setComplete();
			
		} catch (Exception e) {
			model.addAttribute("message", "회원가입이 실패했습니다. 다른 아이디로 다시 가입하시기 바랍니다.");
			model.addAttribute("mode", "created");
			sessionstatus.setComplete();
			return ".store.store.complete";
		}
		sb.append(dto.getG1_Name() + "사장님의 회원 가입이 정상적으로 처리되었습니다.<br>");
		sb.append("메인화면으로 이동하여 로그인 하시기 바랍니다.<br>");
		sessionstatus.setComplete();

		model.addAttribute("title", "회원 가입");
		model.addAttribute("message", sb.toString());
		
		return ".store.store.complete";

	}
	
/*	@RequestMapping(value="/store/login_check")
	@ResponseBody
	public Map<String, Object> userIdCheck(
			@RequestParam(value="g1_Id") String g1_Id
			) throws Exception{
		String passed = "true";
		Store dto = service.readStore(g1_Id);
		if(dto != null)
			passed = "false";
		
		Map<String, Object> map = new HashMap<>();
		map.put("passed", passed);
		return map;
	}*/
	
	// 메뉴1
	@RequestMapping(value = "/store/mystore", method = RequestMethod.GET)
	public String mystoreForm(Model model) {

		model.addAttribute("mainMenu", "0");
		return ".store4.menu1.mystore.list";
	}

	// 메뉴2
	@RequestMapping(value = "/store/event", method = RequestMethod.GET)
	public String eventForm(Model model) {

		model.addAttribute("mainMenu", "1");
		return ".store4.menu2.event.list";
	}

	// 메뉴3
	@RequestMapping(value = "/store/cscenter", method = RequestMethod.GET)
	public String cscenterForm(Model model) {

		model.addAttribute("mainMenu", "2");
		return ".store4.menu3.cscenter.list";
	}
}
