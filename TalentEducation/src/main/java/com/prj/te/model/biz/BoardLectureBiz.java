package com.prj.te.model.biz;

import com.prj.te.dto.BoardLectureDto;

public interface BoardLectureBiz {

	public BoardLectureDto selectOne(int seq);
	public BoardLectureDto selectOneLive(String id);
}
