package com.prj.te.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.prj.te.dto.BoardLectureDto;

@Repository
public class BoardLectureDaoImpl implements BoardLectureDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public BoardLectureDto selectOne(int seq) {
		
		BoardLectureDto dto = null;
		try {
			dto = sqlSession.selectOne(namespace + "selctOne", seq);
			
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

}
