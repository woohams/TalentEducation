package com.prj.te.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.prj.te.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public MemberDto login(String id) {
		MemberDto dto = null;
		try {
			dto =sqlSession.selectOne(namespace+"login", id);
		} catch (Exception e) {
		System.out.println("LOGIN ERROR");
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<MemberDto> selectList() {
		List<MemberDto> list = null;
		
		try {
			list = sqlSession.selectList(namespace+"selectList");
		} catch (Exception e) {
			System.out.println("SELECTLIST ERROR");
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public MemberDto selectone(int member_seq) {
		MemberDto dto = null;
		
		try {
			dto = sqlSession.selectOne(namespace+"selectOne",member_seq);
		} catch (Exception e) {
			System.out.println("SELECTONE ERROR");
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	@Transactional
	public int insert(MemberDto dto) {
		int res = 0;
		System.out.println("insert 들어 왔다");
		
		try {
			res = sqlSession.insert(namespace+"insert",dto);
			
			System.out.println(res);
		} catch (Exception e) {
			System.out.println("INSERT ERROR");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	@Transactional
	public int update(MemberDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(namespace+"update",dto);
		} catch (Exception e) {
			System.out.println("UPDATE ERROR");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	@Transactional
	public int delete(int member_seq) {
		int res = 0;
		
		try {
			res = sqlSession.update(namespace+"delete",member_seq);
		} catch (Exception e) {
			System.out.println("DELETE ERROR");
			e.printStackTrace();
		}
		return res;
	}

}
