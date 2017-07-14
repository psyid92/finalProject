package com.sp.member;

import java.io.File;
import java.util.ArrayList;
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

import com.sp.giupReview.giupReview;
import com.sp.giupReview.giupReviewService;
import com.sp.jumun.JumunMember;
import com.sp.jumun.JumunService;
import com.sp.mileage.Mileage;
import com.sp.mileage.MileageDAO;

@Controller("member.memberController")
public class MemberController {

	@Autowired
	private MemberDAO dao;

	@Autowired
	private MileageDAO midao;

	@Autowired
	private JumunService judao;
	
	@Autowired
	private giupReviewService review;

	
	// 로그인 폼
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String loginForm() {
		return ".mymem.login";
	}

	// 로그아웃
	@RequestMapping(value = "/member/logout")
	public String logout(HttpServletRequest req, HttpSession session, Model model) {

		session.invalidate();
		model.addAttribute("mode", "mainPage");
		return ".mainLayout";
	}

	// 로그인 하기
	@RequestMapping(value = "/member/login", method = RequestMethod.POST)
	public String loginSubmit(Model model, @RequestParam String m1_email, @RequestParam String m1_pwd,
			HttpSession session) throws Exception {

		// 로그인 전페이지로 이동
		String uri = (String) session.getAttribute("preLoginURI");

		int member = dao.getLogin(m1_email, m1_pwd);

		if (member == 1) {
			model.addAttribute("login", "login");
			Member1 dto = dao.getMember(m1_email);
			// 로그인 정보를 세션에 저장
			SessionInfo info = new SessionInfo();
			info.setUserId(m1_email);
			info.setM1_Num(dto.getM1_num());
			session.setAttribute("member", info);

			if (uri == null) {
				uri = "redirect:/";
			}

			return uri;

		} else {
			model.addAttribute("msg", "로그인 실패");
			model.addAttribute("mode", "created");
			return "redirect:/member/login";
		}

		// return ".mainLayout";
	}

	// 회원가입 폼
	@RequestMapping(value = "/member/member", method = RequestMethod.GET)
	public String memberForm(Model model) {
		model.addAttribute("mode", "created");
		return ".mymem.member";
	}

	// 회원가입 하기
	@RequestMapping(value = "/member/member", method = RequestMethod.POST)
	public String memberSignin(HttpServletRequest req, Model model, @RequestParam String m1_nickname,
			@RequestParam String m1_email, @RequestParam String m1_pwd) throws Exception {

		int checkId = dao.checkEmail(m1_email);
		if (checkId > 0) {
			model.addAttribute("msg", "아이디 중복으로 실패");
			model.addAttribute("mode", "created");
			return ".mymem.member";
		} else {

			Member1 dto = new Member1();

			dto.setM1_email(m1_email);
			dto.setM1_pwd(m1_pwd);
			dto.setM1_nickname(m1_nickname);
			dto.setM2_birth(req.getParameter("m2_birth"));
			dto.setM2_gender(req.getParameter("m2_gender"));
			dto.setM2_tel(req.getParameter("m2_tel"));

			dao.insertMember(dto);
		}
		model.addAttribute("mode", "mainPage");
		return ".mainLayout";
	}
	
	//아이디를 잊어버렸어요
	@RequestMapping(value="/member/forgotE")
	public String getMyEmailForm(Model model){
		model.addAttribute("state", "email");
		return ".mymem.forgotmyAccount";
	}
	
	//비밀번호를 잊어버렸어요
	@RequestMapping("/member/forgotP")
	public String getMyPassForm(Model model){
		model.addAttribute("state", "password");
		return ".mymem.forgotmyAccount";
	}
	
	//아이디를 찾고 싶어요
	@RequestMapping("/member/forgotEmail")
	public String getMyEmail(Model model, @RequestParam String m1_nickname, @RequestParam String m2_tel) throws Exception{
		model.addAttribute("state","email");
		String m1_email = "";
		try {
			Map<String, Object> map = new HashMap<>();
			map.put("m1_nickname", m1_nickname);
			map.put("m2_tel", m2_tel);
			m1_email = dao.getMyEmail(map);
		} catch (Exception e) {
			throw e;
		}
		if(m1_email == "" || m1_email == null){
			model.addAttribute("msg", "일치하는 정보가 없습니다.");
			return ".mymem.forgotmyAccount";
		} else {
			model.addAttribute("m1_email", m1_email);
		}
		return ".mymem.forgotAndFound";
	}
	
	//비밀번호를 찾고 싶어요
	@RequestMapping("/member/forgotPass")
	public String getMyPass(HttpSession session, Model model, @RequestParam String m1_email, @RequestParam String m2_tel){
		model.addAttribute("state", "password");
		Map<String, Object> map = new HashMap<>();
		map.put("m1_email", m1_email);
		map.put("m2_tel", m2_tel);
		int result = 0;
		try {
			result = dao.getMyPassword(map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		if(result == 0){
			model.addAttribute("msg","일치하는 정보가 없습니다.");
			return ".mymem.forgot";
		} else {
			map.put("result", "true");
		}
		session.setAttribute("result", "pass");
		session.setAttribute("m1_email", m1_email);
		return ".mymem.memberAccount";
	}
	

	// 마이페이지로 이동 /member/mypage
	@RequestMapping("/member/mypage")
	public String myPage(HttpSession session, Model model) {
		session.removeAttribute("preLoginURI");
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if (session.getAttribute("member") == null) {
			return ".mymem.login";
		}

		int mileage;
		try {
			mileage = midao.getMemberMileage(info.getUserId());
			model.addAttribute("mileage", mileage);
		} catch (Exception e) {
		}
		return ".mymem.mypage";
	}

	// 내 정보 수정 폼
	@RequestMapping(value = "/member/update", method = RequestMethod.GET)
	public String updateMemberForm(SessionInfo info, Model model, HttpSession session) throws Exception {
		// session.setAttribute("preLoginURI", ".mainLayout");

		if (session.getAttribute("member") == null) {
			return ".mymem.login";
		}

		info = (SessionInfo) session.getAttribute("member");
		String m1_email = info.getUserId();

		Member1 dto = dao.getMember(m1_email);

		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		return ".mymem.member";
	}

	// 회원정보 수정
	@RequestMapping(value = "/member/update", method = RequestMethod.POST)
	public String updateMemberDo(Member1 dto, HttpSession session, Model model, HttpServletRequest req)
			throws Exception {

		if (session.getAttribute("member") == null) {
			return ".mymem.login";
		}

		try {
			// 비밀번호가 틀리면 수정 취소
			int check = dao.passCheck(dto);
			if (check == 0) {
				model.addAttribute("mode", "update");
				model.addAttribute("msg", "비밀번호가 틀렸습니다.");
				model.addAttribute("dto", dto);
				return ".mymem.member";
			} else {
				// 넘어왔으면 업데이트 진행
				dto.setM1_nickname(req.getParameter("m1_nickname"));
				dto.setM2_birth(req.getParameter("m2_birth"));
				dto.setM2_gender(req.getParameter("m2_gender"));
				dto.setM2_tel(req.getParameter("m2_tel"));
				dao.updateMember(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("msg", "회원 정보 업데이트에 성공했습니다.");
		return ".mymem.mypage";
	}

	// 회원탈퇴 or 비밀번호 변경
	@RequestMapping(value = "/member/memberAccount", method = RequestMethod.POST)
	public String memberAccuntForm(@RequestParam String m1_pwd, HttpSession session, Model model) {
		String url = "";
		if (session.getAttribute("member") == null) {
			return ".mymem.login";
		}

		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			String m1_email = info.getUserId();

			Member1 dto = new Member1();
			dto.setM1_pwd(m1_pwd);
			dto.setM1_email(m1_email);
			int check = dao.passCheck(dto);

			if (check == 0) {
				// 실패
				model.addAttribute("msg", "비밀번호가 틀렸습니다.");
				url = ".mymem.mypage";
			} else {
				url = ".mymem.memberAccount";
			}
		} catch (Exception e) {
		}
		return url;
	}

	// 비밀번호 변경 하기
	@RequestMapping("/member/mychangePass")
	public String goChangePass(HttpSession session, @RequestParam String m1_pwd) {
		if (session.getAttribute("member") == null) {
			return ".mymem.login";
		}

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String m1_email = info.getUserId();

		Member1 dto = new Member1();
		dto.setM1_email(m1_email);
		dto.setM1_pwd(m1_pwd);

		try {
			dao.changePass(dto);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return ".mymem.mypage";
	}
	
	//비밀번호 변경 하기 필수
	@RequestMapping("/member/changeForgot")
	public String rewitePassword( @RequestParam String m1_pwd, @RequestParam String m1_email, HttpSession session){
		String uri = "/member/login";
		
		Member1 dto = new Member1();
		dto.setM1_pwd(m1_pwd);
		dto.setM1_email(m1_email);
		try {
			dao.changePass(dto);
		} catch (Exception e) {
		}
		
		session.removeAttribute("result");
		session.removeAttribute("m1_email");
		return uri;
	}

	// 비밀번호 확인 폼
	@RequestMapping(value = "/member/memberAccount", method = RequestMethod.GET)
	public String checkPass(HttpSession session, Model model) {
		if (session.getAttribute("member") == null) {
			return ".mymem.login";
		}

		return ".mymem.passCheck";
	}

	// 회원 탈퇴
	@RequestMapping(value = "/member/remove")
	public String removeAccount(HttpSession session) {
		if (session.getAttribute("member") == null) {
			return ".mymem.login";
		}

		Member1 dto = new Member1();
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		dto.setM1_email(info.getUserId());
		try {
			dao.removeAccount(dto);
		} catch (Exception e) {
		}
		return "/main";
	}

	// 회원 삭제
	public String deleteAccount(HttpSession session) {
		Member1 dto = new Member1();
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		dto.setM1_email(info.getUserId());
		try {
			dao.deleteAccount(dto);
		} catch (Exception e) {
		}
		return "/main";
	}

	/*
	 * -------------------------------------------------------------------------
	 * ---------------
	 * -------------------------------------------------------------------------
	 * --------------- 좋아요 버튼
	 * 
	 */

	// 페이지로 이동
	@RequestMapping("/member/ilike")
	public String goLikegiup(HttpSession session, Model model) throws Exception {
		if (session.getAttribute("member") == null) {
			return ".mymem.login";
		}

		Map<String, Object> map = new HashMap<String, Object>();

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String m1_email = info.getUserId();

		map.put("m1_email", m1_email);

		List<LikeGiup> list = dao.listLikeGiup(map);
		int count = list.size();

		model.addAttribute("count", count);
		model.addAttribute("list", list);
		return ".mymem.likegiup";
	}

	@RequestMapping(value = "/member/canclelike", method = RequestMethod.POST)
	@ResponseBody // AJax 사용
	public Map<String, Object> deleteLike(HttpSession session,
			@RequestParam(value = "mydata", defaultValue = "") int mydata) {
		

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		try {
			LikeGiup dto = new LikeGiup();
			String m1_email = info.getUserId();
			dto.setM1_email(m1_email);
			dto.setG1_num(mydata);
			dao.deleteLikeGiup(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		Map<String, Object> model = new HashMap<>();
		model.put("state", true);
		return model;
	}

	/*
	 * -------------------------------------------------------------------------
	 * ---------------
	 * -------------------------------------------------------------------------
	 * --------------- 마일리지
	 * 
	 */
	// 마일리지 페이지
	@RequestMapping("/member/mileage")
	public String goMileage(Model model, HttpSession session) {

		if (session.getAttribute("member") == null) {
			return ".mymem.login";
		}
		int mileage = 0;
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		List<Mileage> list = null;
		Map<String, Object> map = new HashMap<>();
		try {
			int m1_num = info.getM1_Num();
			mileage = midao.getMemberMileage(info.getUserId());

			map.put("m1_num", m1_num);
			list = midao.getMileageList(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("mileage", mileage);
		model.addAttribute("list", list);
		return ".mymem.mileage";
	}

	@RequestMapping(value = "/member/deleteMileage", method = RequestMethod.POST)
	@ResponseBody // AJax 사용
	public Map<String, Object> deleteMileage(HttpSession session,
			@RequestParam(value = "mydata", defaultValue = "") int mydata) {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		try {
			Mileage dto = new Mileage();
			dto.setM1_num(info.getM1_Num());
			dto.setMil_num(mydata);
			midao.deleteMileage(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		Map<String, Object> model = new HashMap<>();
		model.put("state", true);
		return model;
	}

	
	/*
	 * -------------------------------------------------------------------------
	 * ---------------
	 * -------------------------------------------------------------------------
	 * --------------- 결제 내역
	 * 
	 */

	@RequestMapping("/member/payList")
	public String goPayList(HttpSession session, Model model) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		if (session.getAttribute("member") == null) {
			return ".mymem.login";
		}
		
		List<JumunMember> list = null;
		try {
			list = judao.listmyPay(info.getM1_Num());
		} catch (Exception e) {
			throw e;
		}
		model.addAttribute("list", list);
		return ".mymem.payList";
	}

	// 결제 상세 가져오기
	@RequestMapping("/member/getDetail")
	@ResponseBody //AJax 사용
	public Map<String, Object> getDetailPay(HttpSession session, @RequestParam(value="mydata", defaultValue="") int jumun_num){
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		int getNumReview = 0;
		Map<String, Object> map = new HashMap<>();
		map.put("jumun_num", jumun_num);
		map.put("m1_num", info.getM1_Num());
		
		List<JumunMember> list = new ArrayList<>();
		String myJumun= "<br><br>";
		try {
			list = judao.detailmyPay(map);
			getNumReview = dao.getNumReview(map);
			
			for (JumunMember jumun : list) {
				myJumun += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + jumun.getMAINMENU_TITLE() + "&nbsp;&nbsp;&nbsp;" + jumun.getMAINGOODS_COUNT() + "&nbsp;개";
				if(jumun.getSUBMENU_TITLE() != null){
					myJumun += "&nbsp;&nbsp;&nbsp;" ;
					myJumun += jumun.getSUBMENU_TITLE() + ", ";
				} else {
					myJumun += ", ";
				}
			}
			
		} catch (Exception e) {
		}
		if(myJumun.length() > 0){
			myJumun = myJumun.substring(0, myJumun.length()-2);
		}
		myJumun += "<br><br>";
		
		//리뷰를 이미 썼으면
		if(getNumReview == 0){
//			myJumun += "<a href='#' class='btn btn-block btn-primary btn-success'><span class='glyphicon glyphicon-book'></span> 리뷰 남기기</a>";
			myJumun += "<button onclick='goWriteForm("+jumun_num +");' class='btn btn-block btn-primary btn-success'><span class='glyphicon glyphicon-book'></span> 리뷰 남기기</button>";
		} else {
			myJumun += "<button onclick = '' class='btn btn-block btn-primary btn-info'><span class='glyphicon glyphicon-book'></span> 내가 남긴 리뷰 보기</button>";
		}
		
		map.put("myJumun", myJumun);
		return map;
	}
	
	
	
	/*
	 * ---------------------------------------------------------------
	 * ---------------------------------------------------------------
	 * ---------------------------------------------------------------
	 * ----------------------리뷰
	 */
	@RequestMapping(value="/member/writeReview", method=RequestMethod.GET)
	public String writeGiupReviewForm(Model model, @RequestParam int jumun_num, HttpSession session){
		if (session.getAttribute("member") == null) {
			return ".mymem.login";
		}

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		model.addAttribute("jumun_num", jumun_num);
		model.addAttribute("m1_email", info.getUserId());
		model.addAttribute("mode", "nowCreate");
		
		return ".mymem.giupReview.writeGiupReview";
	}
	
	@RequestMapping(value="/member/writeReview", method=RequestMethod.POST)
	public String writeGiupReview(giupReview reviewDto, HttpSession session, Model model){
		if (session.getAttribute("member") == null) {
			return ".mymem.login";
		}
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"giupReview";
		reviewDto.setM1_num(info.getM1_Num());
		
		try {
			review.insertReview(reviewDto, pathname);
		} catch (Exception e) {
		}
		model.addAttribute("mode", "clear");
		return ".mymem.giupReview.writeGiupReview";
	}
	
	@RequestMapping("/member/listGiupReview")
	public String listGiupReview(HttpSession session,Model model){
		if (session.getAttribute("member") == null) {
			return ".mymem.login";
		}
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		List<giupReview> list = new ArrayList<>();

		giupReview dto = new giupReview();
		dto.setM1_num(info.getM1_Num());
		try {
			String root=session.getServletContext().getRealPath("/");
			String pathname=root+File.separator+"uploads"+File.separator+"giupReview";
			list = review.getListMyReview(dto, pathname);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		model.addAttribute("ReviewList", list);
		return ".mymem.giupReview.listGiupReview";
	}
			
}
