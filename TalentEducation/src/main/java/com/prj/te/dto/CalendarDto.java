package com.prj.te.dto;


public class CalendarDto {
	
	private int calendar_seq;
	private String id;
	private String calendar_title;
	private String calendar_category;
	private String calendar_color;
	private String calendar_start;
	private String calendar_end;
	private String calendar_description;
	
	public CalendarDto() {
		
	}



	public CalendarDto(int calendar_seq, String id, String calendar_title, String calendar_category,
			String calendar_color, String calendar_start, String calendar_end, String calendar_description) {
		this.calendar_seq = calendar_seq;
		this.id = id;
		this.calendar_title = calendar_title;
		this.calendar_category = calendar_category;
		this.calendar_color = calendar_color;
		this.calendar_start = calendar_start;
		this.calendar_end = calendar_end;
		this.calendar_description = calendar_description;
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

	public String getCalendar_category() {
		return calendar_category;
	}

	public void setCalendar_category(String calendar_category) {
		this.calendar_category = calendar_category;
	}

	public String getCalendar_color() {
		return calendar_color;
	}

	public void setCalendar_color(String calendar_color) {
		this.calendar_color = calendar_color;
	}

	public String getCalendar_title() {
		return calendar_title;
	}

	public void setCalendar_title(String calendar_title) {
		this.calendar_title = calendar_title;
	}

	public String getCalendar_description() {
		return calendar_description;
	}

	public void setCalendar_description(String calendar_description) {
		this.calendar_description = calendar_description;
	}

	public String getCalendar_start() {
		return calendar_start;
	}

	public void setCalendar_start(String calendar_start) {
		this.calendar_start = calendar_start;
	}

	public String getCalendar_end() {
		return calendar_end;
	}

	public void setCalendar_end(String calendar_end) {
		this.calendar_end = calendar_end;
	}

	
}
