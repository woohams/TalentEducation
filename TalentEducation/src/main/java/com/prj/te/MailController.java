package com.prj.te;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.prj.te.dto.MemberDto;
import com.prj.te.model.biz.MailService;
import com.prj.te.model.biz.MemberBizImpl;

@Controller
public class MailController {
	@Autowired
	private MemberBizImpl userService;
	
	@Autowired
    private MailService mailService;
 
   
 
    public void setMailService(MailService mailService) {
        this.mailService = mailService;
    }
 
    // 회원가입 이메일 인증
    @RequestMapping(value = "/emailchk.do", method = RequestMethod.POST)
    @ResponseBody
    public String sendMailAuth(HttpSession session, String email) {
        int ranCode = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
        String joinCode = String.valueOf(ranCode);
        session.setAttribute("joinCode", joinCode);
        String subject = "회원가입 인증 코드 발급 안내 입니다.";
        StringBuilder sb = new StringBuilder();
        sb.append("귀하의 인증 코드는 " + joinCode + " 입니다.");
        mailService.send(subject, sb.toString(), "versamche@gmail.com", email, null);
        return joinCode;
    }
 
    // 아이디 찾기
    @RequestMapping(value = "/sendMailid.do", method = RequestMethod.POST)
    public String sendMailId(HttpSession session, @RequestParam String email, @RequestParam String id,@RequestParam String captcha, RedirectAttributes ra) {
    	String captchaValue = (String) session.getAttribute("captcha");
    	if (captchaValue == null || !captchaValue.equals(captcha)) {
            ra.addFlashAttribute("resultMsg", "자동 방지 코드가 일치하지 않습니다.");
            return "redirect:./findidpage.do";
        } 
    	MemberDto user = userService.findAccount(email,id);
        if (user != null) {
            String subject = "아이디 찾기 안내 입니다.";
            StringBuilder sb = new StringBuilder();
            sb.append("귀하의 아이디는 " + user.getUsername() + " 입니다.");
            mailService.send(subject, sb.toString(), "versamche@gmail.com", email, null);
            ra.addFlashAttribute("resultMsg", "이메일 주소로 해당 이메일로 가입된 아이디를 발송 하였습니다.");
        } else {
            ra.addFlashAttribute("resultMsg", "이메일로 가입된 아이디가 존재하지 않습니다.");
        }
        return "redirect::./findidpage.do";
    }
 
    // 비밀번호 찾기
    @RequestMapping(value = "/sendMailpw.do", method = RequestMethod.POST)
    public String sendMailPassword(HttpSession session, @RequestParam String email,@RequestParam String id, @RequestParam String captcha, RedirectAttributes ra) {
        String captchaValue = (String) session.getAttribute("captcha");
        if (captchaValue == null || !captchaValue.equals(captcha)) {
            ra.addFlashAttribute("resultMsg", "자동 방지 코드가 일치하지 않습니다.");
            return "redirect:./findpwpage.do";
        }
 
        MemberDto user = userService.findAccount(email,id);
        if (user != null) {
            int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
            String pw = String.valueOf(ran);
            userService.updateInfo(user.getId(), pw, user.getEmail()); // 해당 유저의 DB정보 변경
            String subject = "임시 비밀번호 발급 안내 입니다.";
            StringBuilder sb = new StringBuilder();
            sb.append("귀하의 임시 비밀번호는 " + pw + " 입니다.");
            mailService.send(subject, sb.toString(), "versamche@gmail.com", email, null);
            ra.addFlashAttribute("resultMsg", "이메일 주소로 새로운 임시 비밀번호를 발송 하였습니다.");
        } else {
            ra.addFlashAttribute("resultMsg", "이메일 & 아이디가 존제하지 않거나 다릅니다.");
        }
        return "redirect:./findpwpage.do";
    }
}
