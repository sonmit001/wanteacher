package kr.or.css.dto;

import java.sql.Date;

public class Schedule_DTO {
	private String id;
	private String day;
	
	public Schedule_DTO() {
		
	}

	public Schedule_DTO(String id, String day) {
		super();
		this.id = id;
		this.day = day;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}
	
	
	
}