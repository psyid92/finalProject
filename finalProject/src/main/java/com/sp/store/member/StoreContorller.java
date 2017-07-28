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
	public String storeLoginSubmit(@RequestParam String g1_Id, @RequestParam String g1_Pwd, HttpSession session,
			Model model) throws Exception {

		Store store = service.readStore(g1_Id);

		if (store == null || (!store.getG1_Pwd().equals(g1_Pwd))) {
			model.addAttribute("message", "아이디 또는 패스워드가 일치하지 않습니다.");
			return "store/store/login";
		}

		// 로그인 정보를 세션에 저장
		SessionInfo info = new SessionInfo();
		info.setG1_Id(store.getG1_Id());
		info.setG1_Name(store.getG1_Name());
		info.setG1_Num(store.getG1_Num());
		session.setAttribute("store", info);

		return "redirect:/store/jumunControll";
	}

	@RequestMapping(value = "/store/logout")
	public String logout(HttpServletRequest req, HttpSession session, Model model, SessionStatus sessionstatus) {
		session.removeAttribute("storeDto");
		session.invalidate();
		sessionstatus.setComplete();

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
	public String storeSubmit(@ModelAttribute("storeDto") Store store, SessionStatus sessionstatus, Model model) {

		StringBuffer sb = new StringBuffer();

		// 위도 경도 추가
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

	@RequestMapping(value = "/store/g1_IdCheck")
	@ResponseBody
	public Map<String, Object> g1_IdCheck(@RequestParam String g1_Id) throws Exception {
		String passed = "false";
		Store store = service.readStore(g1_Id);
		if (store == null)
			passed = "true";

		// 작업 결과를 json으로 전송
		Map<String, Object> map = new HashMap<>();
		map.put("passed", passed);
		return map;
	}

	@RequestMapping(value = "/store/g2_GiupNumCheck")
	@ResponseBody
	public Map<String, Object> g2_GiupNumCheck(@RequestParam String g2_GiupNum) throws Exception {
		String passed = "false";
		Store store = service.readStore2(g2_GiupNum);
		if (store == null)
			passed = "true";

		// 작업 결과를 json으로 전송
		Map<String, Object> map = new HashMap<>();
		map.put("passed", passed);
		return map;
	}

	// -----------------------------------------------------------------------------------------------------------
	// 회원정보수정
	@RequestMapping(value = "/store/mypage", method = RequestMethod.GET)
	public String pwdForm(Model model) {

		model.addAttribute("mainMenu", "8");
		model.addAttribute("mode", "update");
		return ".store.menu1.mypage.pwd";
	}

	@RequestMapping(value = "/store/update", method = RequestMethod.POST)
	public String pwdSubmit(@RequestParam String g1_Pwd, @RequestParam String mode, Model model, HttpSession session) {
		SessionInfo info = (SessionInfo) session.getAttribute("store");

		Store storeDto = service.readStore(info.getG1_Id());
		if (storeDto == null) {
			session.invalidate();
			return "redirect:/";
		}
		if (!storeDto.getG1_Pwd().equals(g1_Pwd)) {
			if (mode.equals("update")) {
				model.addAttribute("mainMenu", "8");
				model.addAttribute("mode", "update");
			}
			model.addAttribute("mainMenu", "8");
			model.addAttribute("message", "패스워드가 일치하지 않습니다.");

			return ".store.menu1.mypage.pwd";
		}
		// 회원정보 수정폼
		model.addAttribute("mainMenu", "8");
		model.addAttribute("storeDto", storeDto);
		model.addAttribute("mode", "update");

		return ".store.store.step1";
	}

	@RequestMapping(value = "/store/update", method = RequestMethod.GET)
	public String storeUpdateForm(@ModelAttribute("storeDto") Store storeDto, Model model) {
		model.addAttribute("mode", "update");
		return ".store.store.step1";
	}

	// 다음단계
	@RequestMapping(value = "/store/update2", method = RequestMethod.POST)
	public String storUpdateStep2(@ModelAttribute("storeDto") Store storeDto, SessionStatus sessionstatus,
			Model model) {
		model.addAttribute("mode", "update");
		return ".store.store.step2";
	}

	@RequestMapping(value = "/store/updatecomplete", method = RequestMethod.POST)
	public String updateSubmit(@ModelAttribute("storeDto") Store storeDto, HttpSession session, Model model,
			SessionStatus sessionstatus) {
		SessionInfo info = (SessionInfo) session.getAttribute("store");
		try {
			service.updateStore(storeDto);
			sessionstatus.setComplete();
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "회원정보 수정에 실패했습니다. 다시 시도해주세요.");
			model.addAttribute("mode", "update");
			return ".store.store.complete";
		}
		StringBuffer sb = new StringBuffer();
		sb.append(info.getG1_Name() + "사장님의 회원정보 수정이 정상적으로 처리되었습니다.<br>");
		sb.append("다시 로그인 하시기 바랍니다.<br>");
		session.removeAttribute("storeDto");
		session.invalidate();
		model.addAttribute("title", "회원정보 수정");
		model.addAttribute("message", sb.toString());
		return ".store.store.complete";
	}

	// 회원 탈퇴일 경우
	@RequestMapping(value = "/store/storeout", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteStore(@RequestParam String g1_Id, @RequestParam String g1_pwd, HttpSession session,
			SessionStatus sessionstatus, @RequestParam int g1_Num) {
		Map<String, Object> model = new HashMap<>();
		String state = "true";
		try {
			Store store = service.readStore(g1_Id);

			if (store == null || (!store.getG1_Pwd().equals(g1_pwd))) {
				state = "false";

				model.put("state", state);
			} else {
				int result = service.deleteStore(g1_Num);

				if (result == 0)
					state = "false";

				model.put("state", state);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}

	@RequestMapping(value = "/store/storeoutComplete")
	public String storeoutSubmit(HttpSession session, SessionStatus sessionstatus, Model model) {
		StringBuffer sb = new StringBuffer();
		SessionInfo info = (SessionInfo) session.getAttribute("store");
		sb.append(info.getG1_Id() + "님의 회원 탈퇴 처리가 정상적으로 처리되었습니다.<br>");
		sb.append("메인화면으로 이동하세요");

		session.removeAttribute("store");
		session.invalidate();
		sessionstatus.setComplete();

		model.addAttribute("mainMenu", "8");
		model.addAttribute("title", "회원탈퇴");
		model.addAttribute("message", sb.toString());

		return ".store.store.complete";
	}

	// 아이디 찾기
	@RequestMapping(value = "/store/findId")
	public String findGiupId(Model model) {
		model.addAttribute("state", "g1_Id");
		return ".store.store.forgetGiupAccount";
	}

	@RequestMapping(value = "/store/getId")
	public String getGiupId(Model model, @RequestParam String g1_Name, @RequestParam String g2_Giupnum) throws Exception {
		model.addAttribute("state", "g1_Id");
		Map<String, Object> map = new HashMap<>();
		String g1_Id = "";
		try {
			map.put("g1_Name", g1_Name);
			map.put("g2_Giupnum", g2_Giupnum);
			g1_Id = service.findGiupId(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (g1_Id == "" || g1_Id == null) {
			model.addAttribute("message", "일치하는 정보가 없습니다.");
			return ".store.store.forgetGiupAccount";
		} else {
			model.addAttribute("g1_Id", g1_Id);
		}
		return ".store.store.foundId";
	}

	// 비밀번호 찾기
	@RequestMapping(value = "/store/findPwd")
	public String findGiupPwd(Model model) {
		model.addAttribute("state", "g1_Pwd");
		return ".store.store.forgetGiupAccount";
	}

	// 비밀번호 변경하기 전 확인
	@RequestMapping(value = "/store/foudPwd")
	public String foundGiupPwd(Model model, @RequestParam String g1_Id, @RequestParam String g2_Giupnum) {
		model.addAttribute("state", "g1_Pwd");
		Map<String, Object> map = new HashMap<>();
		map.put("g1_Id", g1_Id);
		map.put("g2_Giupnum", g2_Giupnum);
		String result = "";
		try {
			result = service.findGiupPwd(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (result == "" || result == null) {
			model.addAttribute("message", "일치하는 정보가 없습니다.");
			return ".store.store.forgetGiupAccount";
		}
		return ".store.store.changePwd";
	}

	// 비밀번호 변경하기
	@RequestMapping(value = "/store/pwdChangSubmit")
	public String changeGiupPwd(Model model, @RequestParam String g1_Id, @RequestParam String g2_Giupnum) {
		model.addAttribute("state", "g1_Pwd");
		Map<String, Object> map = new HashMap<>();
		StringBuffer sb = new StringBuffer();
		map.put("gi_Id", g1_Id);
		map.put("g2_Giupnum", g2_Giupnum);
		int result = 0;
		try {
			result = service.changeGiupPwd(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (result == 0) {
			sb.append("변경에 실패했습니다. 다시 시도해주세요.");
			
			model.addAttribute("title", "비밀번호 변경 실패");
			model.addAttribute("message", sb.toString());
			return ".store.store.complete";
		}
		sb.append("패스워드가 변경되었습니다.<br>");
		sb.append("메인화면으로 이동하세요.");
		
		model.addAttribute("title", "패스워드 변경 성공");
		model.addAttribute("message", sb.toString());
		return ".store.store.complete";
		
	}
}
