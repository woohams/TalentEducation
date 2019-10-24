package com.prj.te.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prj.te.dto.CalendarDto;
import com.prj.te.model.dao.CalendarDao;

@Service
public class CalendarBizImpl implements CalendarBiz {

	@Autowired
	private CalendarDao calendarDao;
	
	@Override
	public List<CalendarDto> selectList(String id) {
		return calendarDao.selectList(id);
	}

	@Override
	public int dragNdropUpdate(CalendarDto calendarDto) {
		return calendarDao.dragNdropUpdate(calendarDto);
	}

	@Override
	public CalendarDto selectOne(int calendar_seq) {
		return calendarDao.selectOne(calendar_seq);
	}

	@Override
	public int insert(CalendarDto calendarDto) {
		return calendarDao.insert(calendarDto);
	}

	@Override
	public int update(CalendarDto calendarDto) {
		return calendarDao.update(calendarDto);
	}

	@Override
	public int delete(int calendar_seq) {
		return calendarDao.delete(calendar_seq);
	}

}
