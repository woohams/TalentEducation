package com.prj.te.model.dao;

import java.util.List;

import com.prj.te.dto.BoardLectureDto;

public interface BoardLectureDao {

	String namespace= "boardLecture.";

	public List<BoardLectureDto> selectList();
	public BoardLectureDto selectOne(int seq);
	public int insertLecture(BoardLectureDto dto);
	public int updateLecture(BoardLectureDto dto);
	public int deleteLecture(int seq);
	
	public BoardLectureDto selectOneLive(String id);
}
