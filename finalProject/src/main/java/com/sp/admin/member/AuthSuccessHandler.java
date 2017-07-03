package com.sp.admin.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import com.sp.member.SessionInfo;

public class AuthSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {
		SessionInfo info=new SessionInfo();
		info.setUserId("admin");
		
		HttpSession session=request.getSession();
		session.setAttribute("member", info);
		// TODO Auto-generated method stub
		super.onAuthenticationSuccess(request, response, authentication);
	}
	
}
