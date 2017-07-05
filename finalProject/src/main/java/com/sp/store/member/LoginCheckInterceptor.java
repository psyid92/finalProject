package com.sp.store.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {
	private final Logger logger = LoggerFactory.getLogger(LoginCheckInterceptor.class);	
	
	@Override
	public boolean preHandle(HttpServletRequest req,
			HttpServletResponse resp, Object handler) throws Exception {
		boolean result=false;
		
		try {
			HttpSession session=req.getSession();
			//SessionInfo info=(SessionInfo)session.getAttribute("store");
			String cp=req.getContextPath();
			String uri=req.getRequestURI();
			
			/*if(info==null) {
				if(isAjaxRequest(req)) {
					resp.sendError(403);
				} else {
					if(uri.indexOf(cp)==0)
						uri=uri.substring(req.getContextPath().length());
						session.setAttribute("preLoginURI", uri);
					
					resp.sendRedirect(cp+"/member/login");
				}
			} else {
				result=true;
			}*/
		} catch (Exception e) {
			logger.info("pre: "+e.toString());
		}
		
		return result;
	}

	/*
	   컨트롤러가 요청을 처리 한 후에 호출. 컨트롤러 실행 중 예외가 발생하면 실행 하지 않음  
	 */
	@Override
	public void postHandle(HttpServletRequest req,
			HttpServletResponse resp, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest req,
			HttpServletResponse resp, Object handler, Exception ex)
			throws Exception {
	}
	
/*	// AJAX 요청인지를 확인하기 위해 작성한 메소드
	private boolean isAjaxRequest(HttpServletRequest req) {
		String header=req.getHeader("AJAX");
		return header!=null && header.equals("true");
	}*/
}