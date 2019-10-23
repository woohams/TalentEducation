package com.prj.te.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.prj.te.dto.BoardLectureDto;

@Repository
public class BoardLectureDaoImpl implements BoardLectureDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<BoardLectureDto> selectList() {
		List<BoardLectureDto> list = null;
		
		try {
			list = sqlSession.selectList(namespace + "selectList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public BoardLectureDto selectOne(int seq) {
		
		BoardLectureDto dto = null;
		try {
			dto = sqlSession.selectOne(namespace + "selectOne", seq);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public BoardLectureDto selectOneLive(String id) {
		
		BoardLectureDto dto = null;
		try {
			dto = sqlSession.selectOne(namespace + "selectOneLive", id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int insertLecture(BoardLectureDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(namespace + "insert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int updateLecture(BoardLectureDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(namespace + "update", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int deleteLecture(int seq) {
		int res = 0;
		
		try {
			res = sqlSession.delete(namespace + "delete", seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

}
