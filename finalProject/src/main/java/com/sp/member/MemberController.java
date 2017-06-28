package com.sp.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("member.memberController")
public class MemberController {
	
	@Autowired
	private MemberDAO dao;
	
	//로그인 폼
	@RequestMapping(value="/member/login", method=RequestMethod.GET)
	public String loginForm(){
		return "member/login";
	}
	
	//로그아웃
	@RequestMapping(value="/member/logout")
	public String logout(HttpServletRequest req){
		req.setAttribute("login", null);
		return ".mainLayout";
	}
	
	//로그인 하기
	@RequestMapping(value="/member/login", method=RequestMethod.POST)
	public String loginSubmit(Model model, @RequestParam String m1_email, @RequestParam String m1_pwd,
			HttpSession session) throws Exception{
		int member = dao.getLogin(m1_email, m1_pwd);

		if(member == 1)	{
			model.addAttribute("login", "login");
			
			// 로그인 정보를 세션에 저장
			SessionInfo info = new SessionInfo();
			info.setUserId(m1_email);
			session.setAttribute("member", info);
			return ".mainLayout";
			
		} else {
			model.addAttribute("msg", "로그인 실패");
			model.addAttribute("mode", "created");
			return "/member/login";
		}
		
//		return ".mainLayout";
	}
	
	//회원가입 폼
	@RequestMapping(value="/member/member", method=RequestMethod.GET)
	public String memberForm(Model model){
		model.addAttribute("mode", "created");
		return "member/member";
	}
	
	//회원가입 하기
	@RequestMapping(value="/member/member", method=RequestMethod.POST)
	public String memberSignin(HttpServletRequest req, Model model,
			@RequestParam String m1_email, @RequestParam String m1_pwd) throws Exception{
		
		int checkId = dao.checkEmail(m1_email);
		if(checkId >0){
			model.addAttribute("msg", "아이디 중복으로 실패");
			return "/member/member";
		} else {
			
		
		Member1 dto = new Member1();
		
		dto.setM1_email(m1_email);
		dto.setM1_pwd(m1_pwd);
		
		int result = dao.insertMember(dto);
		if(result >0 ){
			model.addAttribute("msg", "가입 성공");
		}
		}
		
		return ".mainLayout";
	}
}
