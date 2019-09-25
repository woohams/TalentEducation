package com.prj.te.dto;

import java.util.Date;

public class MemberDto {
	
	private String id;
	private String pw;
	private String name;
	private String nickname;
	private String birth;
	private String gender;
	private String email;
	private String location;
	private String categorys;
	private String profile_img;
	private Date end_date;
	
	public MemberDto() {
		
	}

	public MemberDto(String id, String pw, String name, String nickname, String birth, String gender, String email,
			String location, String categorys, String profile_img, Date end_date) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nickname = nickname;
		this.birth = birth;
		this.gender = gender;
		this.email = email;
		this.location = location;
		this.categorys = categorys;
		this.profile_img = profile_img;
		this.end_date = end_date;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
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
