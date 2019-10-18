package com.prj.te.model.dao;

import com.prj.te.dto.BoardLectureDto;

public interface BoardLectureDao {

	String namespace= "boardLecture.";
	
	public BoardLectureDto selectOne(int id);
	public BoardLectureDto selectOneLive(String id);
}
