package com.prj.te.dto;

import java.util.Date;

public class BoardLectureDto {
	
	private int board_lecture_seq;
	private String board_lecture_title;
	private String category_code;
	private String tuter_id;
	private String tutees;
	private String board_lecture_enable;
	private String board_lecture_content;
	private Date board_lecture_regdate;
	private String board_lecture_tag;
	private String board_lecture_image;
	private double board_lecture_star_total;
	private int board_lecture_star_count;
	
	public BoardLectureDto() {}

	public BoardLectureDto(int board_lecture_seq, String board_lecture_title, String category_code, String tuter_id,
			String tutees, String board_lecture_enable, String board_lecture_content, Date board_lecture_regdate,
			String board_lecture_tag, String board_lecture_image, double board_lecture_star_total,
			int board_lecture_star_count) {
		this.board_lecture_seq = board_lecture_seq;
		this.board_lecture_title = board_lecture_title;
		this.category_code = category_code;
		this.tuter_id = tuter_id;
		this.tutees = tutees;
		this.board_lecture_enable = board_lecture_enable;
		this.board_lecture_content = board_lecture_content;
		this.board_lecture_regdate = board_lecture_regdate;
		this.board_lecture_tag = board_lecture_tag;
		this.board_lecture_image = board_lecture_image;
		this.board_lecture_star_total = board_lecture_star_total;
		this.board_lecture_star_count = board_lecture_star_count;
	}

	public int getBoard_lecture_seq() {
		return board_lecture_seq;
	}

	public void setBoard_lecture_seq(int board_lecture_seq) {
		this.board_lecture_seq = board_lecture_seq;
	}

	public String getBoard_lecture_title() {
		return board_lecture_title;
	}

	public void setBoard_lecture_title(String board_lecture_title) {
		this.board_lecture_title = board_lecture_title;
	}

	public String getCategory_code() {
		return category_code;
	}

	public void setCategory_code(String category_code) {
		this.category_code = category_code;
	}

	public String getTuter_id() {
		return tuter_id;
	}

	public void setTuter_id(String tuter_id) {
		this.tuter_id = tuter_id;
	}

	public String getTutees() {
		return tutees;
	}

	public void setTutees(String tutees) {
		this.tutees = tutees;
	}

	public String getBoard_lecture_enable() {
		return board_lecture_enable;
	}

	public void setBoard_lecture_enable(String board_lecture_enable) {
		this.board_lecture_enable = board_lecture_enable;
	}

	public String getBoard_lecture_content() {
		return board_lecture_content;
	}

	public void setBoard_lecture_content(String board_lecture_content) {
		this.board_lecture_content = board_lecture_content;
	}

	public Date getBoard_lecture_regdate() {
		return board_lecture_regdate;
	}

	public void setBoard_lecture_regdate(Date board_lecture_regdate) {
		this.board_lecture_regdate = board_lecture_regdate;
	}

	public String getBoard_lecture_tag() {
		return board_lecture_tag;
	}

	public void setBoard_lecture_tag(String board_lecture_tag) {
		this.board_lecture_tag = board_lecture_tag;
	}

	public String getBoard_lecture_image() {
		return board_lecture_image;
	}

	public void setBoard_lecture_image(String board_lecture_image) {
		this.board_lecture_image = board_lecture_image;
	}

	public double getBoard_lecture_star_total() {
		return board_lecture_star_total;
	}

	public void setBoard_lecture_star_total(double board_lecture_star_total) {
		this.board_lecture_star_total = board_lecture_star_total;
	}

	public int getBoard_lecture_star_count() {
		return board_lecture_star_count;
	}

	public void setBoard_lecture_star_count(int board_lecture_star_count) {
		this.board_lecture_star_count = board_lecture_star_count;
	}
	
	
	
}
