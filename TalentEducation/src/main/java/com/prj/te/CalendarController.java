package com.prj.te;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.prj.te.dto.CalendarDto;
import com.prj.te.dto.MemberDto;
import com.prj.te.model.biz.CalendarBiz;


@Controller
public class CalendarController {
	
	@Autowired
	private CalendarBiz calendarBiz;
	
	@RequestMapping(value = {"/calendar.do", "/member/calendar.do"})
	public String calendar() {
		
		return "calendar";
	}

	@RequestMapping(value="/calendarlist.do")
	public void selectList(HttpServletResponse response, Authentication  authentication) {

		MemberDto dto = (MemberDto)authentication.getPrincipal();
		
		try {
			PrintWriter out = response.getWriter();
		
		List<CalendarDto> list = calendarBiz.selectList(dto.getId());
		
		
		JSONArray jArr = new JSONArray();
		HashMap<String, Object> hm = null;
		for(int i = 0; i < list.size(); i++) {
			
			hm = new HashMap<String, Object>();
			hm.put("id", list.get(i).getCalendar_seq());
			hm.put("className", list.get(i).getCalendar_category());
			hm.put("color", list.get(i).getCalendar_color());
			hm.put("title", list.get(i).getCalendar_title());
			hm.put("description", list.get(i).getCalendar_description());
			hm.put("start", list.get(i).getCalendar_start());
			hm.put("end", list.get(i).getCalendar_end());
			
			jArr.add(hm);
		}
		
		out.print(jArr.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/calendarDragUpdate.do")
	public void selectListDrag(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			int id = Integer.parseInt(request.getParameter("id"));
			String start = request.getParameter("start");
			String end = request.getParameter("end");
			
			CalendarDto calendarDto = new CalendarDto();
			calendarDto.setCalendar_seq(id);
			calendarDto.setCalendar_start(start);
			calendarDto.setCalendar_end(end);
			
			int res = 0;
			
			res = calendarBiz.dragNdropUpdate(calendarDto);
			
			if(res > 0) {
				out.print("dragNdropUpdate success");
			} else {
				out.print("dragNdropUpdatefail");
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/calendarInsert.do")
	public void insert(CalendarDto calendarDto, HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			int res = 0;
			calendarDto.setCalendar_start(calendarDto.getCalendar_start());
			res = calendarBiz.insert(calendarDto);
			
			if(res > 0) {
				out.print("calendarInsert success");
			}else {
				out.print("calendarInsert fail");
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/calendarDetail.do")
	public String fullDetail(@RequestParam("id")int calendar_seq, Model model) {
		
		CalendarDto calendarDto = calendarBiz.selectOne(calendar_seq);
		
		model.addAttribute("calendarDto", calendarDto);
		
		return "eventdetail";
	}
	
	@RequestMapping(value="/calendarUpdate.do")
	public String fullUpdate(@RequestParam("id")int calendar_seq, Model model) {
		
		CalendarDto calendarDto = calendarBiz.selectOne(calendar_seq);
		
		model.addAttribute("calendarDto", calendarDto);
		
		return "eventupdate";
	}
	
	@RequestMapping(value="/calendarUpdateRes.do")
	public String fullUpdateRes(CalendarDto calendarDto, Model model) {
		
		
		int res = 0;
		
		res = calendarBiz.update(calendarDto);
		
		if(res > 0) {
			
			System.out.println("calendarUpdate success");
			
			model.addAttribute("calendarDto", calendarDto);
			
			return "eventdetail";
			
		} else {
			
			System.out.println("calendarUpdate fail");
			
			model.addAttribute("calendarDto", calendarDto);
			
			return "eventupdate";
		}
	}
	
	@RequestMapping(value="/calendarDelete.do")
	public void fullDelete(@RequestParam("id")int calendar_seq, HttpServletRequest request, HttpServletResponse response, Model model) {
		
		try {
			
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			int res = 0;
			
			res = calendarBiz.delete(calendar_seq);
			
			if(res > 0) {
				out.println("삭제되었습니다.");
				
			}else {
				out.println("calendarDelete fail");
				
				model.addAttribute("id", calendar_seq);				
				response.sendRedirect("calendarDetail.do");
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		
	}
	
	
	
}




