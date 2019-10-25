package com.prj.te;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.prj.te.dto.MemberDto;
import com.prj.te.model.biz.MemberBiz;

@Controller
public class MemberController {
	
	@Autowired
	private MemberBiz Mbiz;
	
	
	@RequestMapping(value="/loginform.do")
	public String loginform() {
		return "loginform";
	}
	@RequestMapping(value = "/error.do")
	public String errorPage() {
		return"error";
	}
	@RequestMapping(value = "/emailchkP.do")
	public String emaillChk() {
		return "emailchkpage";
	}
	@RequestMapping(value = "/findidpage.do")
	public String findid() {
		return "findid";
	}
	@RequestMapping(value = "/findpwpage.do")
	public String findpw() {
		return "findpw";
	}
	@RequestMapping(value="/naverlogin.do")
	public String naverlogoutpage() {
		return "naverlogin";
	}
	@RequestMapping(value="/logoutpage.do")
	public String logoutpage(Model model, String id, String pw) {
		model.addAttribute("id", id);
		model.addAttribute("pw", pw);		
		return "logoutpage";
	}
	@RequestMapping(value ="/regist.do")
	public String registf(MemberDto dto) {
		return "regist";
	}
	@RequestMapping(value = "/myinfoupdateres.do" , method = RequestMethod.POST)
	public String myinfoupdateres(Model model, MemberDto dto) {
			
		String id = dto.getId();
		String pw = dto.getPw();
		int res = Mbiz.update(dto);
		
		
		if(res > 0) {
			model.addAttribute("id", id);
			model.addAttribute("pw", pw);
			return "sessionlogout";
		}else {
		
			return "mypageinfo";
		}
	}
	@RequestMapping(value = "/idchk.do" , method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public int idChk(String id) {
		return Mbiz.idChk(id);
	}
	@RequestMapping(value ="/insert.do" , method = RequestMethod.POST)
	public String memberJoin(MemberDto dto) {
		int res = Mbiz.insert(dto);
		if(res>0) {
			return "home";
		}else {
			return "regist";
		}
	}
	@RequestMapping(value="/snslogin.do", method = {RequestMethod.POST})
	@ResponseBody
	public boolean snslogin(MemberDto dto) {
		if(Mbiz.idChk(dto.getId()) == 0) {
			Mbiz.insert(dto);
			return true;
		}else {
			return true;
		}
	}
	
	@RequestMapping(value = "/mypagehome.do")
	public String myPageHome(Model model, HttpServletRequest request) {
		
		System.out.println(request.getParameter("tutor"));
		MemberDto dto = Mbiz.selectoneId(request.getParameter("tutor"));
		System.out.println(dto);
		model.addAttribute("tutor", dto);
		
		return "mypagehome";
	}
	@RequestMapping(value = "/mypageinfo.do")
	public String myPageInfo(Model model, HttpServletRequest request) {

		MemberDto dto = Mbiz.selectoneId(request.getParameter("tutor"));
		model.addAttribute("tutor", dto);
		
		return "mypageinfo";
	}
	
	@RequestMapping(value = "/member/mypagehome.do")
	public String myPageHomeMember(Model model, Authentication  authentication) {

		MemberDto dto = (MemberDto)authentication.getPrincipal();
		model.addAttribute("tutor", dto);
		
		return "mypagehome";
	}
	@RequestMapping(value = "/member/mypageinfo.do")
	public String myPageInfoMember(Model model, Authentication  authentication) {
		
		MemberDto dto = (MemberDto)authentication.getPrincipal();
		model.addAttribute("tutor", dto);
		
		return "mypageinfo";
	}
	
}
