package com.prj.te;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.prj.te.dto.BoardLectureDto;
import com.prj.te.model.biz.BoardLectureBiz;

@Controller
public class BoardLectureController {
	
	@Autowired
	BoardLectureBiz lectureBiz;
	

	@RequestMapping(value = "/boardlist.do")
	public String boardList(Model model) {
		
		List<BoardLectureDto> list = lectureBiz.selectList();
		
		model.addAttribute("lectureList", list);
		
		return "boardlist";
	}
	
	@RequestMapping(value = "/selectone.do")
	public String selectOne(Model model, HttpServletRequest request) {
		
		int seq = Integer.parseInt(request.getParameter("boardseq"));
		BoardLectureDto dto = lectureBiz.selectOne(seq);
		
		model.addAttribute("lecture", dto);
		
		return "boardselectone";
	}
	
	@RequestMapping(value = "/lectureinsert.do", method = RequestMethod.GET)
	public String lectureInsertForm() {
		return "lectureinsert";
	}
	
	@RequestMapping(value = "/lectureinsert.do", method = RequestMethod.POST)
	public String lectureInsert(@ModelAttribute BoardLectureDto dto) {

		int res = lectureBiz.insertLecture(dto);
		if(res > 0) {
			return "redirect:/boardlist.do";
		}else {
			return "redirect:/lectureinsert.do";
		}
		
	}

	@RequestMapping(value = "/lectureupdate.do", method = RequestMethod.POST)
	public String lectureUpdate(Model model, HttpServletRequest request) {
		
		int seq = Integer.parseInt(request.getParameter("boardseq"));
		BoardLectureDto dto = lectureBiz.selectOne(seq);
		
		model.addAttribute("lecture", dto);
		
		return "lectureupdate";
	}
	@RequestMapping(value = "/lectureupdateres.do", method = RequestMethod.POST)
	public String lectureUpdateRes(Model model, @ModelAttribute BoardLectureDto dto) {
		
		int res = lectureBiz.updateLecture(dto);
		
		if(res > 0) {
			return "redirect:/selectone.do?boardseq=" + dto.getBoard_lecture_seq();
		}else {
			BoardLectureDto dto0 = lectureBiz.selectOne(dto.getBoard_lecture_seq());
			
			model.addAttribute("lecture", dto0);
			return "lectureupdate";
		}
		
	}
	
	@RequestMapping(value = "/lecturedelete.do", method = RequestMethod.POST)
	public String lectureDelete(HttpServletRequest request) {

		int seq = Integer.parseInt(request.getParameter("boardseq"));
		
		int res = lectureBiz.deleteLecture(seq);
		
		if(res > 0) {
			return "redirect:/boardlist.do";
		}else {
			return "redirect:/selectone.do?boardseq=" + seq;
		}
		
	}


	@RequestMapping(value = {"/openroom.do", "/member/openroom.do"})
	public String openRoom(Model model, HttpServletRequest request) {
		String isTutor = request.getParameter("isTutor");
		String tutorId = request.getParameter("tutorId");
		String myId = request.getParameter("myId");
		
		BoardLectureDto lectureDto = lectureBiz.selectOneLive(tutorId);
		int roomNo = lectureDto.getBoard_lecture_seq();
		
		String url = "chatingroom";
		if(isTutor.equals("true")) {
			url = "createroom";
			roomNo = 0;
		}

		model.addAttribute("url", url);
		model.addAttribute("myId", myId);
		model.addAttribute("roomNo", roomNo);
		
		return "openroom";
	}

}
