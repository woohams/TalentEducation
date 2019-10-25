package com.prj.te.model.biz;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.prj.te.dto.BoardLectureDto;

public interface BoardLectureBiz {

	public List<BoardLectureDto> selectList();
	public BoardLectureDto selectOne(int seq);
	public int insertLecture(BoardLectureDto dto);
	public int updateLecture(BoardLectureDto dto);
	public int deleteLecture(int seq);
	
	public BoardLectureDto selectOneLive(String id);
	public String restore(MultipartFile multipartFile, HttpServletRequest request);
}
