package com.prj.te;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.prj.te.dto.BoardLectureDto;
import com.prj.te.model.biz.BoardLectureBiz;

@Controller
public class BoardLectureController {
	
	@Autowired
	BoardLectureBiz lectureBiz;
	
	@RequestMapping(value = "/openroom.do")
	public String openRoom(Model model, HttpServletRequest request) {
		String isTuter = request.getParameter("isTuter");
		String tuterId = request.getParameter("tuterId");
		String myId = request.getParameter("myId");
		
		BoardLectureDto lectureDto = lectureBiz.selectOneLive(tuterId);
		int roomNo = lectureDto.getBoard_lecture_seq();
		
		String url = "chatingroom";
		if(isTuter.equals("true")) {
			url = "createroom";
			roomNo = 0;
		}

		model.addAttribute("url", url);
		model.addAttribute("myId", myId);
		model.addAttribute("roomNo", roomNo);
		
		return "openroom";
	}
}
