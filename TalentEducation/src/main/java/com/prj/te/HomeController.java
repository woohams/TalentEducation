package com.prj.te;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.prj.te.dto.MemberDto;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}

	@RequestMapping(value = "/mypagehome.do")
	public String myPageHome(Model model, HttpServletRequest request) {
		
		model.addAttribute("tutor", request.getParameter("tutor"));
		
		return "mypagehome";
	}
	@RequestMapping(value = "/mypageinfo.do")
	public String myPageInfo() {
		return "mypageinfo";
	}
	
	@RequestMapping(value = "/member/mypagehome.do")
	public String myPageHomeMember(Model model, Authentication  authentication) {

		MemberDto dto = (MemberDto)authentication.getPrincipal();
		model.addAttribute("tutor", dto.getId());
		
		return "mypagehome";
	}
	@RequestMapping(value = "/member/mypageinfo.do")
	public String myPageInfoMember(Model model, Authentication  authentication) {
		
		MemberDto dto = (MemberDto)authentication.getPrincipal();
		model.addAttribute("tutor", dto.getId());
		
		return "mypageinfo";
	}
	
}
