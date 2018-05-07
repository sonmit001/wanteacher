package kr.or.css.dto;

import java.sql.Date;

public class TimeSheet_DTO {
	private int hour;
	private String id;
	private Date day;
	private int contentnum;
	
	public TimeSheet_DTO() {
		super();
	}
	
	public TimeSheet_DTO(int hour, String id, Date day, int contentnum) {
		super();
		this.hour = hour;
		this.id = id;
		this.day = day;
		this.contentnum = contentnum;
	}
	
	public int getHour() {
		return hour;
	}
	public void setHour(int hour) {
		this.hour = hour;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getDate() {
		return day;
	}
	public void setDate(Date day) {
		this.day = day;
	}
	public int getContentnum() {
		return contentnum;
	}
	public void setContentnum(int contentnum) {
		this.contentnum = contentnum;
	}
	
	
}
