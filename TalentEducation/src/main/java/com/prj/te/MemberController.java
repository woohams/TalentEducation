package com.prj.te;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	@RequestMapping(value ="/insert.do" , method = RequestMethod.POST)
	public String memberJoin(MemberDto dto) {
		int res = Mbiz.insert(dto);
		if(res>0) {
			return "home";
		}else {
			return "regist";
		}
	}
	@RequestMapping(value ="/regist.do")
	public String registf(MemberDto dto) {
		
			return "regist";
		
	}
}
