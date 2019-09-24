package com.prj.te.dto;

import java.util.Date;

public class ReviewDto {

	private int review_seq;
	private int board_lecture_seq;
	private String id;
	private String review_content;
	private Date review_regdate;
	
	public ReviewDto() {
		
	}

	public ReviewDto(int review_seq, int board_lecture_seq, String id, String review_content, Date review_regdate) {
		this.review_seq = review_seq;
		this.board_lecture_seq = board_lecture_seq;
		this.id = id;
		this.review_content = review_content;
		this.review_regdate = review_regdate;
	}

	public int getReview_seq() {
		return review_seq;
	}

	public void setReview_seq(int review_seq) {
		this.review_seq = review_seq;
	}

	public int getBoard_lecture_seq() {
		return board_lecture_seq;
	}

	public void setBoard_lecture_seq(int board_lecture_seq) {
		this.board_lecture_seq = board_lecture_seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public Date getReview_regdate() {
		return review_regdate;
	}

	public void setReview_regdate(Date review_regdate) {
		this.review_regdate = review_regdate;
	}
	
}
