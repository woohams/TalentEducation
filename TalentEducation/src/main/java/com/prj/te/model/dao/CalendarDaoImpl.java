package com.prj.te.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.prj.te.dto.CalendarDto;

@Repository
public class CalendarDaoImpl implements CalendarDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<CalendarDto> selectList(String id) {
		List <CalendarDto> list = new ArrayList<CalendarDto>();
		
		try {
			list = sqlSession.selectList(namespace + "calendarList", id);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectList error");
		}
		
		return list;
	}

	@Override
	public int dragNdropUpdate(CalendarDto calendarDto) {

		int res = 0;
		
		try {
			res = sqlSession.update(namespace + "calendarDragUpdate", calendarDto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("dragNdropUpdate error");
		}
		
		return res;
	}

	@Override
	public CalendarDto selectOne(int calendar_seq) {

		CalendarDto calendarDto = null;
		
		try {
			calendarDto = sqlSession.selectOne(namespace + "calendarDetail", calendar_seq);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectOne error");
		}
		
		return calendarDto;
	}

	@Override
	public int insert(CalendarDto calendarDto) {

		int res = 0;
		
		try {
			res = sqlSession.update(namespace + "calendarInsert", calendarDto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("calendarInsert error");
		}
		
		return res;
	}

	@Override
	public int update(CalendarDto calendarDto) {
		int res = 0;
		
		try {
			res = sqlSession.update(namespace + "calendarUpdate", calendarDto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("calendarUpdate error");
		}
		
		return res;
	}

	@Override
	public int delete(int calendar_seq) {
		
		int res = 0;
		
		try {
			res = sqlSession.update(namespace + "calendarDelete", calendar_seq);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("calendarDelete error");
		}
		
		return res;
	}
	
	

}
