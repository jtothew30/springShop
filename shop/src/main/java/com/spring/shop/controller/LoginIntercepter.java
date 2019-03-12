package com.spring.shop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginIntercepter extends HandlerInterceptorAdapter {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginIntercepter.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
			logger.info("=======================preHandle start======================");
	    //세션을 찾아온다
			HttpSession session = request.getSession();
			Object obj = session.getAttribute("account");
						
			//로그인이 안된 상태에서 요청을 햇을 때 로그인 한 후 
			//요청한 페이지로 이동하도록 하기 위해서 요청한 주소를
			//세션에 저장한 후 로그인이 성공했을 때 그 주소로
			//이동하도록 하면 된다.
//			String uri = request.getRequestURI();
			//System.out.println("LoginInterceptor uri " + uri);
			
	        //프로젝트 이름까지 찾아오기때문에 주소만 추출
			//http://127.0.0.1:8081/bbs/~~.do
//			int idx = uri.lastIndexOf("/");
//			uri = uri.substring(idx+1);
			//System.out.println("LoginInterceptor uri "+uri);
//			logger.info(request.getMethod());
//			if(request.getMethod() != "POST") {	
//			//only get방식일경우에만	
//		    //파라미터 찾아오기
//				String query = request.getQueryString();
//				//System.out.println("LoginInterceptor query=" + query);
//				
//				//파라미터가 없으면 요청 주소는 그대로 
//				if(query==null || query.equals("null")){
//					query="";
//				}
//				else{
//					query="?"+query;
//				}
//				uri = uri + query;
//				
//				//세션에 uri 저장 
//				session.setAttribute("uri",uri);
//			}
			boolean adminCheck = false;
			//로그인이 안된 경우 로그인 페이지로 이동
			if(obj!=null){
				adminCheck=true;	
			}else {
			/*
			 * String str =
			 * "<script src=\"https://unpkg.com/sweetalert/dist/sweetalert.min.js\"></script>"
			 * ; str += "<script type=\"text/javascript\">"; str +=
			 * "swal('접근제한', '로그인이 필요한 서비스입니다.', 'error');"; str += "</script>";
			 */
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
						+ ".then((value)=>{if(value==true){ location.replace('/shop/main.do');}});"
					    + "</script>"
					    +"</body>"
						).flush();
				//response.sendRedirect("/login.do");
				adminCheck=false;
			}
			logger.info("=======================preHandle end=========================");
			return adminCheck;
	}// end

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object arg2, Exception arg3)
			throws Exception {
		// 컨트롤러의 메소드 끝나고 , 화면처리후 처리
		logger.info("=======================afterCompletion start========================");
		logger.info("=======================afterCompletion end=========================");

	}// end

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object arg2, ModelAndView arg3)
			throws Exception {
		// 컨트롤러의 메소드 끝나고 ,1처리
		logger.info("=======================postHandle start======================");
		logger.info("=======================postHandle end=========================");
	}// end
}
