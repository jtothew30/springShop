package com.spring.shop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class ReviewIntercepter extends HandlerInterceptorAdapter {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewIntercepter.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
			HttpSession session = request.getSession();
			Object obj = session.getAttribute("account");
						
			boolean adminCheck = false;
			if(obj!=null){
				adminCheck=true;	
			}else {
				response.setContentType("text/html; charset=utf-8");
				response.getWriter().append(
						"<script src=\"https://unpkg.com/sweetalert/dist/sweetalert.min.js\"></script>\r\n"
						+"<body>"
					    +"<div class=\"swal-overlay\" tabindex=\"-1\">\r\n" + 
					    "  <div class=\"swal-modal\" role=\"dialog\" aria-modal=\"true\"><div class=\"swal-icon swal-icon--error\">\r\n" + 
					    "    <div class=\"swal-icon--error__x-mark\">\r\n" + 
					    "      <span class=\"swal-icon--error__line swal-icon--error__line--left\"></span>\r\n" + 
					    "      <span class=\"swal-icon--error__line swal-icon--error__line--right\"></span>\r\n" + 
					    "    </div>\r\n" + 
					    "  </div><div class=\"swal-title\" style=\"\">접근제한</div><div class=\"swal-text\" style=\"\">로그인이 필요한 서비스입니다.</div><div class=\"swal-footer\"><div class=\"swal-button-container\">\r\n" + 
					    "\r\n" + 
					    "    <button class=\"swal-button swal-button--confirm\">OK</button>\r\n" + 
					    "\r\n" + 
					    "    <div class=\"swal-button__loader\">\r\n" + 
					    "      <div></div>\r\n" + 
					    "      <div></div>\r\n" + 
					    "      <div></div>\r\n" + 
					    "    </div>\r\n" + 
					    "\r\n" + 
					    "  </div></div></div></div>"
					    +"<script>"
						+ "swal('접근제한', '로그인이 필요한 서비스입니다.','error')"
						+ ".then((value)=>{if(value==true){ history.back();}});"
					    + "</script>"
					    +"</body>"
						).flush();
				adminCheck=false;
			}
			logger.info("=======================preHandle end=========================");
			return adminCheck;
	}// end

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object arg2, Exception arg3)
			throws Exception {

	}// end

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object arg2, ModelAndView arg3)
			throws Exception {
	}// end
}
