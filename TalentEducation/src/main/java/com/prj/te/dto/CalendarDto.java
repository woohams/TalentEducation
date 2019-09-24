package com.prj.te.dto;

import java.util.Date;

public class CalendarDto {

	private int calendar_seq;
	private String id;
	private String calendar_title;
	private String calendar_content;
	private Date calendar_start;
	private Date calendar_end;
	
	public CalendarDto() {
		
	}

	public CalendarDto(int calendar_seq, String id, String calendar_title, String calendar_content, Date calendar_start,
			Date calendar_end) {
		this.calendar_seq = calendar_seq;
		this.id = id;
		this.calendar_title = calendar_title;
		this.calendar_content = calendar_content;
		this.calendar_start = calendar_start;
		this.calendar_end = calendar_end;
	}

	public int getCalendar_seq() {
		return calendar_seq;
	}

	public void setCalendar_seq(int calendar_seq) {
		this.calendar_seq = calendar_seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCalendar_title() {
		return calendar_title;
	}

	public void setCalendar_title(String calendar_title) {
		this.calendar_title = calendar_title;
	}

	public String getCalendar_content() {
		return calendar_content;
	}

	public void setCalendar_content(String calendar_content) {
		this.calendar_content = calendar_content;
	}

	public Date getCalendar_start() {
		return calendar_start;
	}

	public void setCalendar_start(Date calendar_start) {
		this.calendar_start = calendar_start;
	}

	public Date getCalendar_end() {
		return calendar_end;
	}

	public void setCalendar_end(Date calendar_end) {
		this.calendar_end = calendar_end;
	}
	
}
