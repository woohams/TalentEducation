package com.prj.te;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public String logoutpage() {
		return "logoutpage";
	}
	@RequestMapping(value ="/regist.do")
	public String registf(MemberDto dto) {
		return "regist";
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
	
}
