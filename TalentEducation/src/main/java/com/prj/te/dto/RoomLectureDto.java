package com.prj.te.dto;

public class RoomLectureDto {

	private int lecture_seq;
	private String tutor;
	private String tutees;
	
	public RoomLectureDto() {
		
	}

	public RoomLectureDto(int lecture_seq, String tutor, String tutees) {
		this.lecture_seq = lecture_seq;
		this.tutor = tutor;
		this.tutees = tutees;
	}

	public int getLecture_seq() {
		return lecture_seq;
	}

	public void setLecture_seq(int lecture_seq) {
		this.lecture_seq = lecture_seq;
	}

	public String getTutor() {
		return tutor;
	}

	public void setTutor(String tutor) {
		this.tutor = tutor;
	}

	public String getTutees() {
		return tutees;
	}

	public void setTutees(String tutees) {
		this.tutees = tutees;
	}
	
}
