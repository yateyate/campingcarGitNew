/* 작성 register
 * 읽기 list/read
 * 수정 modify
 * 삭제 remove
 */
package kr.co.ccrent.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

import kr.co.ccrent.dto.CompanyDTO;
import kr.co.ccrent.dto.Criteria;
import kr.co.ccrent.dto.PageMaker;
import kr.co.ccrent.service.CompanyService;

@Controller
public class CompanyController {

	private static final Logger logger = LoggerFactory.getLogger(CompanyController.class);

	@Autowired
	CompanyService companyService;
//  유저용 승인목록 + 페이징처리
	@GetMapping(value="/company/list")
	public void list(Criteria cri, Model model) throws Exception{
		System.out.println(cri.toString());
		model.addAttribute("list", companyService.getAll(cri));
		
		//페이징처리
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(companyService.getAll_Count(cri));
		
		model.addAttribute("cri",cri);
		model.addAttribute("pageMaker",pageMaker);
	}
	
//	신청하기로 이동
	@RequestMapping(value = "/company/registerForm",method = RequestMethod.GET)
	public String registerForm(){
		return "/company/register";
	}
	
//	신청하기 작성
	@RequestMapping(value = "/company/register",method = RequestMethod.POST)
	public String register(CompanyDTO companyDTO, HttpServletRequest request,RedirectAttributes rttr)throws Exception{
		request.setCharacterEncoding("UTF-8");
		logger.info("내용"+ companyDTO);
		int r = companyService.register(companyDTO);
		if(r>0) {
			rttr.addFlashAttribute("msg","추가에 성공하였습니다.");
		}
		
		return "redirect:list";
	}
	
	
	
	
//	승인되어있는 목록 전체조회 ( 페이징처리 전 메서드 )
//	@RequestMapping(value = "/list", method = RequestMethod.GET)
//	public ModelAndView list() throws Exception {
//		logger.info("list");
//		ModelAndView mav = new ModelAndView();
//		List<CompanyDTO> list = companyService.getAll();
//		mav.addObject("list", list);
//		mav.setViewName("list");
//		return mav;
//	}
	
//- - - - - - - - - - - - - - - - - - -유저용 페이지 끝 - - - - - - - - - - - -  - - - - - - - - - - - 
	
	
	
	
	
	
	
	
//	승인안되어 있는 목록 관리자에서 전체조회
	@RequestMapping(value = "/admin/company/listForm", method = RequestMethod.GET)
	public ModelAndView list2() throws Exception {
		logger.info("/admin/company/listForm");
		ModelAndView mav = new ModelAndView();
		List<CompanyDTO> list2 = companyService.getAll2();
		List<CompanyDTO> list3 = companyService.getAll3();
		mav.addObject("list3", list3);
		mav.addObject("list2", list2);
		mav.setViewName("/admin/company/listForm");
		return mav;
	}	
	
//	승인되어있는 목록 관리자에서 전체 조회
	@RequestMapping(value = "/admin/company/listForm2", method = RequestMethod.GET)
	public ModelAndView list3() throws Exception {
		logger.info("/admin/company/listForm2");
		ModelAndView mav = new ModelAndView();
		List<CompanyDTO> list3 = companyService.getAll3();
		mav.addObject("list3", list3);
		mav.setViewName("/admin/company/listForm2");
		return mav;
	}
	
//	선택조회
//	@RequestMapping(value ="/read",method = RequestMethod.GET)
//	public String read(@RequestParam("comp_id") int comp_id, Model model) throws Exception{
//		CompanyDTO companyDTO = companyService.get(comp_id);
//		model.addAttribute("read", companyDTO);
//		return "read";	
//	}
	
//	신청 대기상태인 회사 상세보기
	@RequestMapping(value = "/admin/company/read", method = RequestMethod.GET)
	public ModelAndView read(@RequestParam("comp_id")int comp_id) throws Exception{
		ModelAndView mav = new ModelAndView();
		System.out.println("회사 번호 : "+comp_id);
		CompanyDTO companyDTO = companyService.get(comp_id);
		mav.setViewName("/admin/company/read"); //뷰의 이름
		mav.addObject("company", companyDTO); //뷰로 보낼 데이터 값 ( 변수명 , 변수에넣을 데이터 값)
		return mav;
	}
	

	
	
	

	
	

	
	
	
	
	
//	신청상태 변경하기(수정)       +1 = 승인       -1 = 거절
	@RequestMapping(value = "/admin/company/stsmodify",method = RequestMethod.POST)
	public ModelAndView modify(@RequestParam("count") int comp_status, @RequestParam("comp_id") int comp_id, Model model) {
		 
		System.out.println("넘어온 value : " + comp_status);
		CompanyDTO companyDTO =companyService.get(comp_id);
		companyDTO.setComp_status(comp_status);
		int result = companyService.stsmodify(companyDTO);
		model.addAttribute("/admin/company/stsmodify", result);
		ModelAndView mav = new ModelAndView();
		List<CompanyDTO> list2 = companyService.getAll2();
		List<CompanyDTO> list3 = companyService.getAll3();
		mav.addObject("list3", list3);
		mav.addObject("list2", list2);
		mav.setViewName("/admin/company/listForm");
		return mav;
	}
	

	
	
	
//	신청상태 변경 (거절)
//	@RequestMapping(value = "/stsmodify2", method = RequestMethod.GET)
//	public String modify2(@RequestParam("comp_status") int comp_status,Model model) {
//		companyService.stsmodify2(comp_status);
//		model.addAttribute("stsmodify2",comp_status);
//		return "listForm";
//	}
	

	
	
	
	
}	
