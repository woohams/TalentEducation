package com.prj.te.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prj.te.dto.BoardLectureDto;
import com.prj.te.model.dao.BoardLectureDao;

@Service
public class BoardLectureBizImpl implements BoardLectureBiz {
	
	@Autowired
	BoardLectureDao lectureDao;

	@Override
	public List<BoardLectureDto> selectList() {
		return lectureDao.selectList();
	}
	@Override
	public BoardLectureDto selectOne(int seq) {
		return lectureDao.selectOne(seq);
	}

	@Override
	public BoardLectureDto selectOneLive(String id) {
		return lectureDao.selectOneLive(id);
	}


	@Override
	public int insertLecture(BoardLectureDto dto) {
		return lectureDao.insertLecture(dto);
	}

	@Override
	public int updateLecture(BoardLectureDto dto) {
		return lectureDao.updateLecture(dto);
	}

	@Override
	public int deleteLecture(int seq) {
		return lectureDao.deleteLecture(seq);
	}

}
