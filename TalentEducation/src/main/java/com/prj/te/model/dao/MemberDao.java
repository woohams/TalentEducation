package com.prj.te.model.dao;

import java.util.List;

import org.springframework.security.core.userdetails.User;

import com.prj.te.dto.MemberDto;

public interface MemberDao {

	String namespace= "member.";
	
	public MemberDto login(String id);
	public List<MemberDto> selectList();
	public MemberDto selectone(int member_seq);
	public int insert(MemberDto dto);
	public int update(MemberDto dto);
	public int delete(int member_seq);
	public int idChk(String id);
	public boolean pwchk(String username, String pw);
	public User findAccount(String email);
}
