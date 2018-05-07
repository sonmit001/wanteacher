package kr.or.css.dto;

import java.sql.Date;

public class TimeSheetAndContent_DTO {

	private int hour;
	private String id;
	private String day;
	private int contentnum;
	
	private int expectedhour;
	private String content;
	private int good;
	private String title;
	private int themenum;
	private int regionnum;

	public TimeSheetAndContent_DTO() {
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

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public int getContentnum() {
		return contentnum;
	}

	public void setContentnum(int contentnum) {
		this.contentnum = contentnum;
	}

	public int getExpectedhour() {
		return expectedhour;
	}

	public void setExpectedhour(int expectedhour) {
		this.expectedhour = expectedhour;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getGood() {
		return good;
	}

	public void setGood(int good) {
		this.good = good;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getThemenum() {
		return themenum;
	}

	public void setThemenum(int themenum) {
		this.themenum = themenum;
	}

	public int getRegionnum() {
		return regionnum;
	}

	public void setRegionnum(int regionnum) {
		this.regionnum = regionnum;
	}

}
