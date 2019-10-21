package com.prj.te.model.biz;

import java.util.List;

import com.prj.te.dto.BoardLectureDto;

public interface BoardLectureBiz {

	public List<BoardLectureDto> lectureList();
	public BoardLectureDto selectOne(int seq);
	public int insertLecture(BoardLectureDto dto);
	public int updateLecture(BoardLectureDto dto);
	public int deleteLecture(int seq);
	
	public BoardLectureDto selectOneLive(String id);
}
