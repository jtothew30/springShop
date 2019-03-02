package com.spring.shop.controller;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.shop.service.ProBoard.ProBoardService;
import com.spring.shop.service.Production.ProductionService;
import com.spring.shop.vo.Paging;
import com.spring.shop.vo.ProBoard;
import com.spring.shop.vo.Production;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Inject
	ProBoardService proBoardService;

	@Inject
	ProductionService productionService;

	@Autowired
	private ServletContext application;

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
	
	// 재고관리 - 상품삭제
	@RequestMapping("deleteProduction.do")
	public String prductDelete(int pno) {
		return null;
	}
	// 재고관리 - 상품수정
	@RequestMapping("updateProduction.do")
	public String productEdit(int pno) {
		return null;
	}
	
	//기존등록제품--> 옵션추가등록페이지 이동
	@RequestMapping("insertNewOption.do")
	public ModelAndView insertNewOption(int pno) {
		ModelAndView mav = new ModelAndView("admin/productInsert");
		Production pro = productionService.selectProduction(pno);
		mav.addObject("pro",pro);		
		return mav;		
	}		
		
	@RequestMapping("productList.do")
	public ModelAndView productList(Paging paging, @RequestParam(value="kwd",required=false) String kwd) {
		ModelAndView mav = new ModelAndView("admin/productList");
		if(kwd==null) kwd="";
		paging.setKwd(kwd);
		paging.setTotalCount(productionService.selectSearchCount(kwd));
		logger.info(paging.toString());
		List<Production> list = productionService.selectSearch(paging);
		mav.addObject("paging", paging);		
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
	
	//------------------------------------------------------------------------
	
	// 게시글관리 - 게시글 등록 페이지 이동
	@RequestMapping(value = "boardInsert.do")
	public ModelAndView boardInsertPage() {
		ModelAndView mav = new ModelAndView("admin/boardInsert");
		// production 에서 목록을 받아옴
		List<Production> plist = productionService.productionSelectAllService();
		mav.addObject("plist",plist);
		
		HashSet<String> list = new HashSet<String>();
		for (Production p  : plist) {
			list.add(String.valueOf(p.getPname()));
		}	
		mav.addObject("list",list);
		return mav;
	}

	// 게시글관리 - 게시글 등록
	@RequestMapping(value = "boardInsert.do", method = RequestMethod.POST)
	public String boardInsert(ProBoard proBoard, MultipartHttpServletRequest request) throws Exception {
		logger.info(proBoard.toString());
		
		List<MultipartFile> filelist = request.getFiles("file");		
		String inputPath = "/resources/upload/";
		proBoard.setPath(inputPath);
		
		logger.info(proBoard.toString());
		
		proBoardService.insertProBoardService(proBoard);
		// query input 타이밍에 pbno, pbdate ==> null 상태		
		ProBoard pb = proBoardService.selectBoardForContain(proBoard);		
		
		logger.info(pb.toString());
		
		//procontain 연동 등록 필요 ==> [pbno, pno]
		int pbno = pb.getPbno();
		String[] options = proBoard.getOptions().split(",");	//proBoard.options -> parsing 필요 "," 구문	
		for (int i = 0; i < options.length; i++) {
			HashMap<String,Object> map = new HashMap<String, Object>();
			map.put("pbno", pbno);
			map.put("pname", proBoard.getPname());
			map.put("options", options[i]);
			
			logger.info(map.toString());
			
			productionService.insertProcontainPnamePno(map);
		}
		
		String path=application.getRealPath(pb.getPath());
		
		File dir = new File(path);
		if (!dir.isDirectory()) { dir.mkdirs(); }
		for(MultipartFile file : filelist) {
			String originFileName = file.getOriginalFilename().toLowerCase(); // 원본 파일 명(소문자강제처리)
	        long fileSize = file.getSize(); // 파일 사이즈
	       
	        logger.info("originFileName : " + originFileName);
	        logger.info("fileSize : " + fileSize);
	        
	        try {
	        	file.transferTo(new File(path, originFileName));
	        }catch(IllegalStateException e) {
	        	e.printStackTrace();
	        }catch(IOException e) {
	        	e.printStackTrace();
	        }
		}		
		return "redirect:boardList.do";				
	}	
	// 게시글관리 - 글 수정 업데이트
	@RequestMapping("boardUpdate.do")
	public ModelAndView boardUpdate(ProBoard proBoard, MultipartHttpServletRequest request) {
		ModelAndView mav = new ModelAndView("redirect:boardList.do");
		
		List<MultipartFile> filelist = request.getFiles("file");		
		String inputPath = "/resources/upload/";
		proBoard.setPath(inputPath);
		proBoardService.updateBoard(proBoard);
		int pbno = proBoard.getPbno();
		ProBoard pb = proBoardService.selectProBoardDetail(pbno);
		//procontain 연동 등록 필요 ==> [pbno, pno]		
		pbno = pb.getPbno();
		//기존 pbno,pno 삭제
		proBoardService.deleteProcontain(pbno);
		
		String[] options = proBoard.getOptions().split(",");	//proBoard.options -> parsing 필요 "," 구문	
		for (int i = 0; i < options.length; i++) {
			HashMap<String,Object> map = new HashMap<String, Object>();
			map.put("pbno", pbno);
			map.put("pname", proBoard.getPname());
			map.put("options", options[i]);
			
			logger.info(map.toString());
			
			productionService.insertProcontainPnamePno(map);
		}
		
		String path=application.getRealPath(pb.getPath());
		
		File dir = new File(path);
		if (!dir.isDirectory()) { dir.mkdirs(); }
		for(MultipartFile file : filelist) {
			String originFileName = file.getOriginalFilename().toLowerCase(); // 원본 파일 명(소문자강제처리)
	        long fileSize = file.getSize(); // 파일 사이즈
	       
	        logger.info("originFileName : " + originFileName);
	        logger.info("fileSize : " + fileSize);
	        
	        try {
	        	file.transferTo(new File(path, originFileName));
	        }catch(IllegalStateException e) {
	        	e.printStackTrace();
	        }catch(IOException e) {
	        	e.printStackTrace();
	        }
		}
		return mav;
	}

	// 게시글관리 - 리스트 출력
	@RequestMapping("boardList.do")
	public ModelAndView boardList(Paging paging) throws Exception {
		ModelAndView mav = new ModelAndView("admin/boardList");
		if(paging.getKwd()==null) paging.setKwd("");		
		// 검색어 => 총 검색자료수 가져오기
		int count = proBoardService.selectSearchCount(paging.getKwd());
		// 페이징 객체 넣고 세팅준비끝
		paging.setTotalCount(count);			
		// 페이징 => 검색리스트 받아오기
		// List<ProBoard> list = proBoardService.getlist();
		List<ProBoard> list = proBoardService.selectSearchList(paging);		
		mav.addObject("paging", paging);
		mav.addObject("list", list);
		return mav;
	}
	
	// 게시글관리 - 글 수정 페이지 이동 
	@RequestMapping("boardEdit.do")
	public ModelAndView boardEdit(@RequestParam("pbno") int pbno) {
		ModelAndView mav = new ModelAndView("admin/boardEdit");
		ProBoard pb = proBoardService.selectProBoardDetail(pbno);
		
		// production 에서 목록을 받아옴
		List<Production> plist = productionService.productionSelectAllService();
		mav.addObject("plist",plist);
		
		HashSet<String> list = new HashSet<String>();
		for (Production p  : plist) {
			list.add(String.valueOf(p.getPname()));
		}	
		mav.addObject("list",list);		
		mav.addObject("pb",pb);
		return mav;		
	}
	
	
	
	// 게시글관리 - 글 삭제
	@RequestMapping("boardDelete.do")
	public String boardDelete(@RequestParam("pbno") int pbno) {
		proBoardService.deleteProBoard(pbno);
		return "redirect:boardList.do";		
	}
}
