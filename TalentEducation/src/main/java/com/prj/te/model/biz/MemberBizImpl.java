package com.prj.te.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.prj.te.dto.MemberDto;
import com.prj.te.model.dao.MemberDao;

@Service
public class MemberBizImpl implements MemberBiz {

	@Autowired
	private MemberDao dao;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public MemberDto login(String id) {
		return dao.login(id);
	}

	@Override
	public List<MemberDto> selectList() {
		return dao.selectList();
	}

	@Override
	public MemberDto selectone(int member_seq) {
		return dao.selectone(member_seq);
	}

	@Override
	public int insert(MemberDto dto) {
	System.out.println(dto+"비즈입니다");
		dto.setPw(passwordEncoder.encode(dto.getPassword()));
		return dao.insert(dto);
	}

	@Override
	public int update(MemberDto dto) {
		if(dto.getPassword()!=null && dto.getPassword()!="") {
			dto.setPw(passwordEncoder.encode(dto.getPassword()));
		}
		return dao.update(dto);
	}

	@Override
	public int delete(int member_seq) {
		return dao.delete(member_seq);
	}
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		MemberDto dto = null;
		
		dto = dao.login(username);
		
		if(dto == null) {
			throw new BadCredentialsException("해당 하는 ID를 찾을 수 없습니다.");
		}
		
		return dto;
	}
	

	public void updateInfo(String username, String string, String password) {
		
	}

	@Override
	public int idChk(String id) {
		return dao.idChk(id);
	}

	@Override
	public boolean pwchk(String username, String pw) {
		// TODO Auto-generated method stub
		return dao.pwchk(username, pw);
	}

	@Override
	public User findAccount(String email) {
		return dao.findAccount(email);
	}

	
}
