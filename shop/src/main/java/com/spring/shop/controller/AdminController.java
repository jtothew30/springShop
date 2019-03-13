package com.spring.shop.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.spring.shop.service.Account.AccountService;
import com.spring.shop.service.Event.EventService;
import com.spring.shop.service.ProBoard.ProBoardService;
import com.spring.shop.service.Production.ProductionService;
import com.spring.shop.vo.Account;
import com.spring.shop.vo.Event;
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
	
	@Inject
	EventService eventService;
	
	@Inject
	AccountService accountService;
	
	@Autowired
	private ServletContext application;

	@RequestMapping("admin.do")
	public String adminMainpage() {
		return "admin/admin";
	}
	
	// 재고관리 - 상품등록 페이지 이동	
	@RequestMapping("productInsert.do")
	public String adminInsertPage() {
		return "admin/productInsert";
	}

	// 재고관리 - 상품등록
	@RequestMapping(value = "productInsert.do", method = RequestMethod.POST)
	public String productInsert(Production production) {
		// 제품등록
		productionService.insertProductionService(production);
		//logger.info(production.toString());
		// 등록후 고유번호 가져오기
		Production pro = productionService.selectProductionOne(production);

		// 재고량초기화
		//logger.info(pro.toString());
		productionService.resetProductionCount(pro);
		return "redirect:productList.do";
	}
	
	// 재고관리 - 상품삭제
	@RequestMapping("deleteProduction.do")
	public String prductDelete(int pno) {
		productionService.deleteProduction(pno);
		return "redirect:productList.do";
	}
	// 재고관리 - 상품수정 페이지 이동
	@RequestMapping("updateProduction.do")
	public String productEdit(Model model, int pno) {
		Production pro = productionService.selectProduction(pno);
		model.addAttribute("pro", pro);
		return "admin/productEdit";
	}
	// 재고관리 - 상품수정
	@RequestMapping("productUpdate.do")
	public ModelAndView productUpdate(Production production) {
		ModelAndView mav = new ModelAndView("redirect:productList.do");
		productionService.updateProduction(production);
		return mav;
	}
	
	// 재고관리 - 기존등록제품--> 옵션추가등록페이지 이동
	@RequestMapping("insertNewOption.do")
	public ModelAndView insertNewOption(int pno) {
		ModelAndView mav = new ModelAndView("admin/productInsert");
		Production pro = productionService.selectProduction(pno);
		mav.addObject("pro",pro);		
		return mav;		
	}		
	
	// 재고관리 리스트 출력
	@RequestMapping("productList.do")
	public ModelAndView productList(Paging paging, @RequestParam(value="kwd",required=false) String kwd) {
		ModelAndView mav = new ModelAndView("admin/productList");
		if(kwd==null) kwd="";
		paging.setKwd(kwd);
		paging.setTotalCount(productionService.selectSearchCount(kwd));
		//logger.info(paging.toString());
		List<Production> list = productionService.selectSearch(paging);
		mav.addObject("paging", paging);		
		mav.addObject("list", list);		
		return mav;
	}
	
	// 재고관리 - 재고량 update
	@RequestMapping("proCountUpdate.do")
	public ModelAndView proCountUpdate(Production production) {
		ModelAndView mav = new ModelAndView("redirect:productList.do");
		//logger.info(String.valueOf(production.getPno()));
		//logger.info(String.valueOf(production.getCount()));
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
		//logger.info(proBoard.toString());
		
		List<MultipartFile> filelist = request.getFiles("file");		
		String inputPath = "/resources/upload/";
		proBoard.setPath(inputPath);
		
		//logger.info(proBoard.toString());
		
		proBoardService.insertProBoardService(proBoard);
		// query input 타이밍에 pbno, pbdate ==> null 상태		
		ProBoard pb = proBoardService.selectBoardForContain(proBoard);		
		
		//logger.info(pb.toString());
		
		//procontain 연동 등록 필요 ==> [pbno, pno]
		int pbno = pb.getPbno();
		String[] options = proBoard.getOptions().split(",");	//proBoard.options -> parsing 필요 "," 구문	
		for (int i = 0; i < options.length; i++) {
			HashMap<String,Object> map = new HashMap<String, Object>();
			map.put("pbno", pbno);
			map.put("pname", proBoard.getPname());
			map.put("options", options[i]);
			
			//logger.info(map.toString());
			
			productionService.insertProcontainPnamePno(map);
		}
		
		String path=application.getRealPath(pb.getPath());
		
		File dir = new File(path);
		if (!dir.isDirectory()) { dir.mkdirs(); }
		for(MultipartFile file : filelist) {
			String originFileName = file.getOriginalFilename().toLowerCase(); // 원본 파일 명(소문자강제처리)
	        long fileSize = file.getSize(); // 파일 사이즈
	       
	        //logger.info("originFileName : " + originFileName);
	        //logger.info("fileSize : " + fileSize);
	        
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
			
			//logger.info(map.toString());
			
			productionService.insertProcontainPnamePno(map);
		}
		
		String path=application.getRealPath(pb.getPath());
		
		File dir = new File(path);
		if (!dir.isDirectory()) { dir.mkdirs(); }
		for(MultipartFile file : filelist) {
			String originFileName = file.getOriginalFilename().toLowerCase(); // 원본 파일 명(소문자강제처리)
	        long fileSize = file.getSize(); // 파일 사이즈
	       
	        //logger.info("originFileName : " + originFileName);
	        //logger.info("fileSize : " + fileSize);
	        
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
		proBoardService.deleteProContain(pbno);
		return "redirect:boardList.do";		
	}
	
	//===========================================================================
	
	// 메인페이지 수정 페이지 이동
	@RequestMapping("mainEdit.do")
	public ModelAndView mainEdit() {
		ModelAndView mav = new ModelAndView("admin/mainEdit");
		List<ProBoard> list = proBoardService.selectProBoardAll();
		List<Event> elist = eventService.selectEventAllbyTag();
		List<Event> tlist = eventService.selectEventTagFlag();
		
		ArrayList<String> tagList = new ArrayList<String>();
		for (Event e : tlist) {
			tagList.add(e.getTag());
		}
		
		mav.addObject("elist",elist);
		mav.addObject("tlist",tlist);
		mav.addObject("tagList",tagList);
		mav.addObject("list",list);
		return mav;
	}
	
	// 메인페이지 카로셀이미지 업데이트
	@RequestMapping("mainUpdate.do")
	public ModelAndView mainUpdate(MultipartHttpServletRequest request) {
		ModelAndView mav = new ModelAndView("redirect:/main.do");
		
		MultipartFile[] file = new MultipartFile[3];
		MultipartFile img1 = request.getFile("file1");
		MultipartFile img2 = request.getFile("file2");
		MultipartFile img3 = request.getFile("file3");
		file[0] = img1;
		file[1] = img2;
		file[2] = img3;
		
		String mainPath = "resources/upload/main/carousel/";
		String path = application.getRealPath(mainPath);
		
		File dir = new File(path);
		if (!dir.isDirectory()) { dir.mkdirs(); }
		for(int i=0; i<3; i++) {
			String originFileName = String.valueOf(i+1)+".jpg";
	        long fileSize = file[i].getSize(); // 파일 사이즈
	       
	        //logger.info("originFileName : " + originFileName);
	        //logger.info("fileSize : " + fileSize);
	        
	        try {
	        	file[i].transferTo(new File(path, originFileName));
	        }catch(IllegalStateException e) {
	        	e.printStackTrace();
	        }catch(IOException e) {
	        	e.printStackTrace();
	        }
		}	
		return mav;
	}
	
	// 메인페이지 이벤트 등록
	@RequestMapping("mainEventEdit.do")
	public String mainEventEdit(Event event) {
		//logger.info(event.toString());
		eventService.insertEvent(event);
		return "redirect:mainEdit.do";
	}
			
	// 메인페이지 이벤트 삭제
	@RequestMapping("mainEventDelete.do")
	public String mainEventDelete(@RequestParam("eno") int eno) {
		eventService.deleteEvent(eno);
		return "redirect:mainEdit.do";
	}
	
	// 메인페이지 이벤트 수정
	@RequestMapping("mainEventChange.do")
	public String mainEventChange(Event event) {
		eventService.updateEvent(event);
		return "redirect:mainEdit.do";
	}
	
	// 메인페이지 이벤트 tag ON
	@ResponseBody
	@RequestMapping("updateTagOn.do")
	public boolean updateTagOn(@RequestParam("tag") String tag) {
		boolean result = false;
		int a = eventService.updateEventTagOn(tag);
		logger.info("On 변경 tag 개수 : "+a);
		if(a>0) result= true;
		return result;
	}
	
	// 메인페에지 이벤트 tag Off
	@ResponseBody
	@RequestMapping("updateTagOff.do")
	public boolean updateTagOff(@RequestParam("tag") String tag) {
		boolean result = false;
		int a = eventService.updateEventTagOff(tag);
		logger.info("Off 변경 tag 개수 : "+a);
		if(a>0) result= true;
		return result;
	}
	
	//==========================================================================
	
	// 회원관리 페이지 이동
	@RequestMapping("memberList.do")
	public ModelAndView memberList(Paging paging) {
		ModelAndView mav = new ModelAndView("admin/memberList");
		int count = accountService.selectAccountListCountAll(paging);
		paging.setTotalCount(count);
		List<Account> list = accountService.selectAccountListAll(paging);
		
		mav.addObject("paging",paging);
		mav.addObject("list", list);
		return mav;
	}
	
	// 회원 통계 페이지 이동
	@RequestMapping("staticList")
	public ModelAndView staticList() {
		ModelAndView mav = new ModelAndView("admin/staticList");
		List<Account> acc = accountService.selectAccountAll();
		
		Gson gson = new Gson();
		HashMap<String, Integer> ageMap = new HashMap<String, Integer>();
		ageMap.put("a", 0);
		ageMap.put("b", 0);
		ageMap.put("c", 0);
		ageMap.put("d", 0);
		ageMap.put("e", 0);
		ageMap.put("f", 0);
		ageMap.put("g", 0);
		
		HashMap<String, Integer> genderMap = new HashMap<String, Integer>();
		genderMap.put("m",0);
		genderMap.put("f",0);
		
		for (Account a : acc) {
			if(a.getAge()<=10) {
				ageMap.put("a", ageMap.get("a")+1);
			}else if(a.getAge()<=20 && a.getAge() >10) {
				ageMap.put("b", ageMap.get("b")+1);
			}else if(a.getAge()<=30 && a.getAge() >20) {
				ageMap.put("c", ageMap.get("c")+1);
			}else if(a.getAge()<=40 && a.getAge() >30) {
				ageMap.put("d", ageMap.get("d")+1);
			}else if(a.getAge()<=50 && a.getAge() >40) {
				ageMap.put("e", ageMap.get("e")+1);
			}else if(a.getAge()<=60 && a.getAge() >50) {
				ageMap.put("f", ageMap.get("f")+1);
			}else {
				ageMap.put("g", ageMap.get("g")+1);
			}
			if(a.getGender().equals("male")) {
				genderMap.put("m",genderMap.get("m")+1);
			}else if(a.getGender().equals("female")){
				genderMap.put("f",genderMap.get("f")+1);
			}
		}
		
		mav.addObject("ageList",gson.toJson(ageMap));
		mav.addObject("genderList",gson.toJson(genderMap));
		return mav;
	}
	
}
