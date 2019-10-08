package com.prj.te.model.biz;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.prj.te.dto.MemberDto;

public interface MemberBiz extends UserDetailsService{

	public MemberDto login(String id);
	public List<MemberDto> selectList();
	public MemberDto selectone(int member_seq);
	public int insert(MemberDto dto);
	public int update(MemberDto dto);
	public int delete(int member_seq);
}
