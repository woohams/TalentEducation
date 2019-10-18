package com.prj.te.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prj.te.dto.BoardLectureDto;
import com.prj.te.model.dao.BoardLectureDao;

@Service
public class BoardLectureBizImpl implements BoardLectureBiz {
	
	@Autowired
	BoardLectureDao lectureDao;

	@Override
	public BoardLectureDto selectOne(int seq) {
		return lectureDao.selectOne(seq);
	}

	@Override
	public BoardLectureDto selectOneLive(String id) {
		return lectureDao.selectOneLive(id);
	}

}
