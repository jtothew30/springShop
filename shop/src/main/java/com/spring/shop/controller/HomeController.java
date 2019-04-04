package com.spring.shop.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.shop.service.Event.EventService;
import com.spring.shop.vo.Event;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@Autowired
	private EventService eventService;
	
	@RequestMapping("product.do")
	public String product() {
		return "product";
		
	}
	@RequestMapping("main.do")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView("main");
		// 전체 이벤트 list
		List<Event> list = eventService.selectEventTagOn();
		
		// 이벤트 tag list & flag ==1
		List<Event> list2 = eventService.selectEventTagFlagOnly();
		ArrayList<String> tagList = new ArrayList<String>();
		for (Event e : list2) {
			tagList.add(e.getTag());
		}
		
		mav.addObject("tagList",tagList);
		mav.addObject("list",list);
		return mav;
		
	}
	
}
