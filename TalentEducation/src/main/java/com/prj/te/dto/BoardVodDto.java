package com.prj.te.dto;

import java.util.Date;

public class BoardVodDto {
	
	private int board_vod_seq;
	private int board_lecture_seq;
	private String board_vod_content;
	private Date board_vod_regdate;
	private String board_vod_image;
	private double board_vod_star_total;
	private int board_vod_star_count;
	
	public BoardVodDto() {
		
	}

	public BoardVodDto(int board_vod_seq, int board_lecture_seq, String board_vod_content, Date board_vod_regdate,
			String board_vod_image, double board_vod_star_total, int board_vod_star_count) {
		this.board_vod_seq = board_vod_seq;
		this.board_lecture_seq = board_lecture_seq;
		this.board_vod_content = board_vod_content;
		this.board_vod_regdate = board_vod_regdate;
		this.board_vod_image = board_vod_image;
		this.board_vod_star_total = board_vod_star_total;
		this.board_vod_star_count = board_vod_star_count;
	}

	public int getBoard_vod_seq() {
		return board_vod_seq;
	}

	public void setBoard_vod_seq(int board_vod_seq) {
		this.board_vod_seq = board_vod_seq;
	}

	public int getBoard_lecture_seq() {
		return board_lecture_seq;
	}

	public void setBoard_lecture_seq(int board_lecture_seq) {
		this.board_lecture_seq = board_lecture_seq;
	}

	public String getBoard_vod_content() {
		return board_vod_content;
	}

	public void setBoard_vod_content(String board_vod_content) {
		this.board_vod_content = board_vod_content;
	}

	public Date getBoard_vod_regdate() {
		return board_vod_regdate;
	}

	public void setBoard_vod_regdate(Date board_vod_regdate) {
		this.board_vod_regdate = board_vod_regdate;
	}

	public String getBoard_vod_image() {
		return board_vod_image;
	}

	public void setBoard_vod_image(String board_vod_image) {
		this.board_vod_image = board_vod_image;
	}

	public double getBoard_vod_star_total() {
		return board_vod_star_total;
	}

	public void setBoard_vod_star_total(double board_vod_star_total) {
		this.board_vod_star_total = board_vod_star_total;
	}

	public int getBoard_vod_star_count() {
		return board_vod_star_count;
	}

	public void setBoard_vod_star_count(int board_vod_star_count) {
		this.board_vod_star_count = board_vod_star_count;
	}

}
