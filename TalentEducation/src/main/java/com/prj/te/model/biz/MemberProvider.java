package com.prj.te.model.biz;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.prj.te.dto.MemberDto;

public class MemberProvider implements AuthenticationProvider {

	@Autowired
	private UserDetailsService userSer;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@SuppressWarnings("unchecked")
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		String username = (String) authentication.getPrincipal();
		String password = (String) authentication.getCredentials();
		
		MemberDto dto = (MemberDto)userSer.loadUserByUsername(username);
		
		ArrayList<GrantedAuthority> authenticaties = (ArrayList<GrantedAuthority>) dto.getAuthorities();
		
		if(!matchPassword(password, dto.getPassword())) {
			throw new BadCredentialsException("password가 일치하지 않습니다.");
		}
		if(!dto.isEnabled()) {
			throw new BadCredentialsException("비활성화 된 계정입니다.");
		}
		System.out.println("비번 체크 완료");
		return new UsernamePasswordAuthenticationToken(dto, password, authenticaties);
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return true;
	}
	private boolean matchPassword(String password, String db_password) {
		
		return passwordEncoder.matches(password, db_password);
	}

}
