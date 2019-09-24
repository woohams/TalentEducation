package com.prj.te.dto;

public class MapDto {

	private int map_seq;
	private String x_point;
	private String y_point;
	
	public MapDto() {
		
	}

	public MapDto(int map_seq, String x_point, String y_point) {
		this.map_seq = map_seq;
		this.x_point = x_point;
		this.y_point = y_point;
	}

	public int getMap_seq() {
		return map_seq;
	}

	public void setMap_seq(int map_seq) {
		this.map_seq = map_seq;
	}

	public String getX_point() {
		return x_point;
	}

	public void setX_point(String x_point) {
		this.x_point = x_point;
	}

	public String getY_point() {
		return y_point;
	}

	public void setY_point(String y_point) {
		this.y_point = y_point;
	}
	
}
