package com.spring.shop.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.shop.service.ProBoard.ProBoardService;
import com.spring.shop.service.Production.ProductionService;
import com.spring.shop.vo.ProBoard;
import com.spring.shop.vo.Production;


public class AdminController2 {

	private static final Logger logger = LoggerFactory.getLogger(AdminController2.class);

	@Inject
	ProBoardService proBoardService;

	@Inject
	ProductionService productionService;

	@RequestMapping("main.do")
	public String adminMainpage() {
		return "admin/admin";
	}

	@RequestMapping("productInsert.do")
	public String adminInsertPage() {
		return "admin/productInsert";
	}

	// 재고관리 - 상품등록
	@RequestMapping(value = "productInsert.do", method = RequestMethod.POST)
	public String productInsert(Production production) {
		// 제품등록
		productionService.insertProductionService(production);
		logger.info(production.toString());
		// 등록후 고유번호 가져오기
		Production pro = productionService.selectProductionOne(production);

		// 재고량초기화
		logger.info(pro.toString());
		productionService.resetProductionCount(pro);
		return "redirect:productList.do";
	}

	// 재고관리 - 리스트 출력
	@RequestMapping("productList.do")
	public ModelAndView productList() {
		ModelAndView mav = new ModelAndView("admin/productList");
		List<Production> list = productionService.productionSelectAllService();
		mav.addObject("list", list);
		return mav;
	}

	// 재고관리 - 재고량 update
	@RequestMapping("proCountUpdate.do")
	public ModelAndView proCountUpdate(Production production) {
		ModelAndView mav = new ModelAndView("redirect:productList.do");
		logger.info(String.valueOf(production.getPno()));
		logger.info(String.valueOf(production.getCount()));
		productionService.updateProductionCount(production);
		return mav;
	}
	
	// 게시글관리 - 게시글 등록 페이지 이동
	@RequestMapping(value = "boardInsert.do")
	public String boardInsertPage() {
		return "admin/boardInsert";
	}
	
	// 게시글관리 - 게시글 등록
	@RequestMapping(value = "boardInsert.do", method = RequestMethod.POST)
	public String boardInsert(ProBoard proBoard) throws Exception {
		proBoardService.insertProBoardService(proBoard);
		return "redirect:boardList.do";
	}
	
		
		@Autowired
		private ServletContext  application;
		
		@RequestMapping("upload.do")
		public void upload(MultipartHttpServletRequest request) {
			System.out.println("upload 접근");
			List<MultipartFile> filelist = request.getFiles("file");
			String category1 = request.getParameter("category1");
			String category2 = request.getParameter("category2");
			String category3 = request.getParameter("category3");
			String pname = request.getParameter("pname");
			
			String path=application.getRealPath("/resources/upload"+"/"+category1+"/"+category2+"/"+category3+"/"+pname);
			//String path = uploadpath;
			System.out.println(path);
			
			File dir = new File(path); if (!dir.isDirectory()) { dir.mkdirs(); }
				
			for(MultipartFile file : filelist) {
				String originFileName = file.getOriginalFilename(); // 원본 파일 명
		        long fileSize = file.getSize(); // 파일 사이즈
		        System.out.println("originFileName : " + originFileName);
		        System.out.println("fileSize : " + fileSize);
		        
		        try {
		        	file.transferTo(new File(path, originFileName));
		        }catch(IllegalStateException e) {
		        	e.printStackTrace();
		        }catch(IOException e) {
		        	e.printStackTrace();
		        }
			}
		}
	
	// 게시글관리 - 리스트 출력
	@RequestMapping("boardList.do")
	public ModelAndView boardList() throws Exception {
		ModelAndView mav = new ModelAndView("admin/boardList");
		List<ProBoard> list = proBoardService.getlist();
		mav.addObject("list", list);
		return mav;
	}

}
