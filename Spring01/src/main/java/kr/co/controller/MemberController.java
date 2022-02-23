package kr.co.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.service.MemberService;
import kr.co.vo.MemberVO;
import kr.co.vo.PageMaker;
import kr.co.vo.SearchCriteria;

@Controller
@RequestMapping("/member/*")
public class MemberController {

		private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
		
		@Inject
		MemberService service;
		
		@RequestMapping(value = "/login", method = RequestMethod.POST)
		public String login(MemberVO vo, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
			logger.info("post login");
			
			HttpSession session = request.getSession();
			MemberVO login = service.login(vo);
			
			if(login == null) {
				session.setAttribute("admin", null);
				rttr.addFlashAttribute("message", false);
			}else {
				session.setAttribute("admin", login);
			}
			
			return "redirect:/member/list";
		}
		
		@RequestMapping(value = "/logout", method = RequestMethod.GET)
		public String logout(HttpSession session) throws Exception {
			
			session.invalidate();
			
			return "redirect:/";
		}
		
		@RequestMapping(value = "/member/joinView", method = RequestMethod.GET)
		private void joinView() throws Exception {
			logger.info("joinView");
			
		}
		
		@RequestMapping(value = "/member/join", method = RequestMethod.POST)
		public String join(MemberVO memberVO) throws Exception {
			logger.info("join");
			
			service.join(memberVO);
			
			return "redirect:/member/list";
		}
		
		@RequestMapping(value = "/list", method = RequestMethod.GET)
		public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
			logger.info("list");
			
			model.addAttribute("list", service.list(scri));
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(service.listCount(scri));
			
			model.addAttribute("pageMaker", pageMaker);
			
			return "member/list";
		}
		
		@RequestMapping(value = "/detailView", method = RequestMethod.GET)
		public String detail(MemberVO memberVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
			logger.info("detail");
			
			model.addAttribute("detail", service.detail(memberVO.getDealer_no()));
			model.addAttribute("scri", scri);
			
			return "member/detailView";
		}

		@RequestMapping(value = "/updateView", method = RequestMethod.GET)
		public String updateView(MemberVO memberVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
			logger.info("updateView");
			
			model.addAttribute("update", service.detail(memberVO.getDealer_no()));
			model.addAttribute("scri", scri);
		
			return "member/updateView";
		}
		
		@RequestMapping(value = "/update", method = RequestMethod.POST)
		public String update(MemberVO memberVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {
			logger.info("update");
			
			service.update(memberVO);
			
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/member/list";
		}
		
		@RequestMapping(value = "delete", method = RequestMethod.POST)
		public String delete(MemberVO memberVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {
			logger.info("delete");
			
			service.delete(memberVO.getDealer_no());
			
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/member/list";
		}
		
		
		
		
}
