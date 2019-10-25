package com.prj.te.dto;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@SuppressWarnings("serial")
public class MemberDto implements UserDetails{
	
	private int member_seq;
	private String id;
	private String pw;
	private boolean enable;
	private String authority;
	private String nickname;
	private String email;
	private String categorys;
	private String profile_img;
	private Date end_date;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
		auth.add(new SimpleGrantedAuthority(authority));
		return auth;
	}

	@Override
	public String getPassword() {
		return pw;
	}

	@Override
	public String getUsername() {
		return id;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return enable;
	}

	public MemberDto() {
		
	}

	public MemberDto(int member_seq, String id, String pw, boolean enable,  String authority, String nickname, String birth,
			 String email, String categorys, String profile_img, Date end_date) {
		this.member_seq = member_seq;
		this.id = id;
		this.pw = pw;
		this.enable = enable;
		this.authority = authority;
		this.nickname = nickname;
		this.email = email;
		this.categorys = categorys;
		this.profile_img = profile_img;
		this.end_date = end_date;
	}

	@Override
	public String toString() {
		return "MemberDto [member_seq=" + member_seq + ", id=" + id + ", pw=" + pw + ", enable=" + enable
				+ ", authority=" + authority + ", nickname=" + nickname + ", email=" + email + ", categorys="
				+ categorys + ", profile_img=" + profile_img + ", end_date=" + end_date + "]";
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public boolean isEnable() {
		return enable;
	}

	public void setEnable(boolean enable) {
		this.enable = enable;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public int getMember_seq() {
		return member_seq;
	}
	
	public void setMember_seq(int member_seq) {
		this.member_seq = member_seq;
	}
	
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCategorys() {
		return categorys;
	}

	public void setCategorys(String categorys) {
		this.categorys = categorys;
	}

	public String getProfile_img() {
		return profile_img;
	}

	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	

	
}
