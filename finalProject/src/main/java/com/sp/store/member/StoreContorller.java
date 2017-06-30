package com.sp.store.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

//사장님 페이지 컨트롤러
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
	public String storeLoginForm() {
		return "store/store/login";
	}

	// 로그인시 이동할 페이지로 리턴
	@RequestMapping(value = "/store/login", method = RequestMethod.POST)
	public String storeLoginSubmit(Model model) {

		model.addAttribute("mainMenu", "0");
		return ".store4.menu1.mystore.list";
	}

	// 회원가입 눌렀을때
	@RequestMapping(value = "/store/join", method = RequestMethod.GET)
	public String storeJoinForm(@ModelAttribute Store dto, Model model) {

		model.addAttribute("mode", "created");
		return ".store.store.step1";
	}

	// 다음단계
	@RequestMapping(value = "/store/step2", method = RequestMethod.POST)
	public String storeStep2(@ModelAttribute("store") Store dto, SessionStatus sessionstatus, Model model) {
		
		model.addAttribute("mode", "created");
		model.addAttribute("dto", dto);
		return ".store.store.step2";
	}

	@RequestMapping(value = "/store/complete", method = RequestMethod.POST)
	public String storeSubmit(@ModelAttribute("store") Store dto, SessionStatus sessionstatus, Model model) {
		// 패스워드 암호화
		ShaPasswordEncoder pe = new ShaPasswordEncoder(256);
		String s = pe.encodePassword(dto.getG1_Pwd(), null);
		dto.setG1_Pwd(s);
		StringBuffer sb = new StringBuffer();

		int result = 0;
		try {

			result = service.insertStore(dto);

		} catch (Exception e) {

		}
		if (result > 0) {
			sb.append(dto.getG1_Name() + "사장님의 회원 가입이 정상적으로 처리되었습니다.<br>");
			sb.append("메인화면으로 이동하여 로그인 하시기 바랍니다.<br>");
			sessionstatus.setComplete();

			model.addAttribute("title", "회원 가입");
			model.addAttribute("message", sb.toString());

			return ".mainLayout";
		} else {
			model.addAttribute("message", "회원가입이 실패했습니다. 다시 시도해주시기 바랍니다.");
			model.addAttribute("mode", "created");
			return ".store.store.step2";
		}

	}

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
