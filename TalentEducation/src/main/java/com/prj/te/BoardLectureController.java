package com.prj.te;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String lectureInsert(HttpServletRequest request) {
		BoardLectureDto dto = new BoardLectureDto();
		dto.setBoard_lecture_title(request.getParameter("title"));
		dto.setTutor_id(request.getParameter("tutor_id"));
		dto.setTutor_nik(request.getParameter("tutor_nik"));
		dto.setBoard_lecture_content(request.getParameter("content"));

		int res = lectureBiz.insertLecture(dto);
		if(res > 0) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		System.out.println(dto);
		
		return "redirect:./boardlist.do";
	}

	@RequestMapping(value = "/lectureupdate.do", method = RequestMethod.POST)
	public String lectureUpdate(Model model, HttpServletRequest request) {
		
		int seq = Integer.parseInt(request.getParameter("boardseq"));
		BoardLectureDto dto = lectureBiz.selectOne(seq);
		
		model.addAttribute("lecture", dto);
		
		return "lectureupdate.do";
	}

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
