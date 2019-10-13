package com.prj.te.model.biz;

import java.util.List;

import com.prj.te.dto.CalendarDto;

public interface CalendarBiz {

	public List<CalendarDto> selectList();
	public CalendarDto selectOne(int calendar_seq);
	public int insert(CalendarDto calendarDto);
	public int dragNdropUpdate(CalendarDto calendarDto);
	public int update(CalendarDto calendarDto);
	public int delete(int calendar_seq);
	
}
