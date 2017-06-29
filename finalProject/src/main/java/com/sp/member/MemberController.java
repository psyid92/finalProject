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
		
		return ".mainLayout";
	}
	
	//로그인 하기
	@RequestMapping(value="/member/login", method=RequestMethod.POST)
	public String loginSubmit(Model model, @RequestParam String m1_email, @RequestParam String m1_pwd,
			HttpSession session) throws Exception{
		
		//로그인 전페이지로 이동
		String uri = (String)session.getAttribute("preLoginURI");
		
		
		int member = dao.getLogin(m1_email, m1_pwd);

		if(member == 1)	{
			model.addAttribute("login", "login");
			
			// 로그인 정보를 세션에 저장
			SessionInfo info = new SessionInfo();
			info.setUserId(m1_email);
			session.setAttribute("member", info);
			
			
			if(uri==null){
				uri="redirect:/";
			} else {
				uri = "redirect:"+uri; 
			}
			
			
			return uri;
			
		} else {
			model.addAttribute("msg", "로그인 실패");
			model.addAttribute("mode", "created");
			return "redirect:/member/login";
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
	public String memberSignin(HttpServletRequest req, Model model, @RequestParam String m1_nickname,
			@RequestParam String m1_email, @RequestParam String m1_pwd) throws Exception{
		
		int checkId = dao.checkEmail(m1_email);
		if(checkId >0){
			model.addAttribute("msg", "아이디 중복으로 실패");
			model.addAttribute("mode", "created");
			return "/member/member";
		} else {
			
		
		Member1 dto = new Member1();
		
		dto.setM1_email(m1_email);
		dto.setM1_pwd(m1_pwd);
		dto.setM1_nickname(m1_nickname);
		dto.setM2_birth(req.getParameter("m2_birth"));
		dto.setM2_gender(req.getParameter("m2_gender"));
		dto.setM2_tel(req.getParameter("m2_tel"));
		
		int result = dao.insertMember(dto);
		if(result >0 ){
			model.addAttribute("msg", "가입 성공");
		}
		}
		
		return ".mainLayout";
	}
	
	//마이페이지로 이동 /member/mypage
	@RequestMapping("/member/mypage")
	public String myPage(SessionInfo info, HttpSession session){
		
		session.setAttribute("preLoginURI", ".mainLayout");
		if(info == null){
			return "member/login";
		}
		return ".member.mypage";
	}
	
	//내 정보 수정
	@RequestMapping(value="/member/update")
	public String updateMember(SessionInfo info, Model model, HttpSession session) throws Exception{
		session.setAttribute("preLoginURI", "member/mypage");
		
		if(info == null){
			return "member/login";
		}
		String m1_email = (String)info.getUserId();
		Member1 dto = dao.getMember(m1_email);
		
		model.addAttribute("dto",dto);
		model.addAttribute("mode", "update");
		return "member/member";
	}
	
	
	
}
