package com.spring.shop.controller.upload;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AjaxUploadController {

	private static final Logger logger = LoggerFactory.getLogger(AjaxUploadController.class);
	
	//servlet-context.xml에 선언	
	//@Resource(name="uploadPath")
	//String uploadPath;
	
	//@RequestMapping(value="/upload/uploadAjax", method=RequestMethod.GET)
	//public void uploadAjax() {
		// view/upload/uploadAjax.jsp로 이동
	//}
	
	
}
