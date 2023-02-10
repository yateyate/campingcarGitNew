package kr.co.ccrent.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.ccrent.dto.FaqBoardDTO;
import kr.co.ccrent.dto.Criteria;
import kr.co.ccrent.dto.PageMaker;
import kr.co.ccrent.service.FaqBoardService;


@Controller
public class FaqBoardController {
	
private static final Logger logger = LoggerFactory.getLogger(FaqBoardController.class);
	
@Autowired
FaqBoardService service;
	


@RequestMapping(value = "admin/faqboard/registerForm", method = RequestMethod.GET)
public void registerGET(FaqBoardDTO boardDTO, Model model) throws Exception {
	logger.info("regist get");
}

@RequestMapping(value = "admin/faqboard/register", method = RequestMethod.POST)
public String registerPOST (FaqBoardDTO boardDTO,RedirectAttributes rttr) throws Exception {
	logger.info("regist post");
	logger.info(boardDTO.toString());
	
	service.register(boardDTO);
	
	
	rttr.addFlashAttribute("msg","success");
	return "redirect:listAll";
	}

@RequestMapping(value = "/admin/faqboard/read", method = RequestMethod.GET)
public ModelAndView read(@RequestParam("bno")int bno) throws Exception{
   ModelAndView mav = new ModelAndView();
   System.out.println("글 번호 : "+bno);
   FaqBoardDTO boardDTO = service.read(bno);
   mav.setViewName("/admin/faqboard/read"); //뷰의 이름
   mav.addObject("board", boardDTO); //뷰로 보낼 데이터 값 ( 변수명 , 변수에넣을 데이터 값)
   return mav;
}

@RequestMapping(value = "/admin/faqboard/modifyForm", method = RequestMethod.GET)
public void modifyGET(int bno, Model model) throws Exception {
	
	FaqBoardDTO boardDTO = service.read(bno);
	model.addAttribute("board", boardDTO);
	System.out.println("넘어온bno : " + boardDTO.getBno());
	
}

@RequestMapping(value = "/admin/faqboard/modify", method = RequestMethod.POST)
public String modifyPOST(FaqBoardDTO boardDTO, RedirectAttributes rttr) throws Exception {
	
	logger.info("mod post........");
	
	service.modify(boardDTO);
	rttr.addFlashAttribute("msg", "success");
	System.out.println("접근중");
	return "redirect:listAll?keyword=";
	
}

@RequestMapping(value ="/admin/faqboard/remove", method = RequestMethod.GET)
public String remove(int bno ,RedirectAttributes rttr) throws Exception {
	
	service.remove(bno);

	System.out.println("he");
	
	return "redirect:/admin/faqboard/listAll";
}

@GetMapping(value="/admin/faqboard/listAll")
public void list1(Criteria cri, Model model) throws Exception{
   System.out.println(cri.toString());
   model.addAttribute("list", service.faq_get(cri));
   
   //페이징처리
   PageMaker pageMaker = new PageMaker();
   
   pageMaker.setCri(cri);
   pageMaker.setTotalCount(service.faq_get_count(cri));
   
   model.addAttribute("cri",cri);
   model.addAttribute("pageMaker",pageMaker);
}


//faq게시판 글 상세보기
@RequestMapping(value = "/faqboard/read", method = RequestMethod.GET)
public ModelAndView read_member(@RequestParam("bno")int bno) throws Exception{
   ModelAndView mav = new ModelAndView();
   System.out.println("글 번호 : "+bno);
   FaqBoardDTO boardDTO = service.read(bno);
   mav.setViewName("/faqboard/read"); //뷰의 이름
   mav.addObject("board", boardDTO); //뷰로 보낼 데이터 값 ( 변수명 , 변수에넣을 데이터 값)
   return mav;
}

//faq게시판 글 전체보기/검색기능
@GetMapping(value="/faqboard/listAll")
public void list_member(Criteria cri, Model model) throws Exception{
   System.out.println(cri.toString());
   model.addAttribute("list", service.faq_get(cri));
   
   //페이징처리
   PageMaker pageMaker = new PageMaker();
   
   pageMaker.setCri(cri);
   pageMaker.setTotalCount(service.faq_get_count(cri));
   
   model.addAttribute("cri",cri);
   model.addAttribute("pageMaker",pageMaker);
}	
	

}



