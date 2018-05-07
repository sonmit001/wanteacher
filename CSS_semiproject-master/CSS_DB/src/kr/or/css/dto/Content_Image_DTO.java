package kr.or.css.dto;

import java.util.*;

public class Content_Image_DTO {

	private int contentnum;
	private int expectedhour;
	private String content;
	private int good;
	private String title;
	private int themenum;
	private int regionnum;
	private String topimage;
	private String regionname;
	
	public Content_Image_DTO() {
		super();
	}
	
	public Content_Image_DTO(int contentnum, int expectedhour, String content, int good, String title, int themenum,
			int regionnum, String topimage, String regionname) {
		super();
		this.contentnum = contentnum;
		this.expectedhour = expectedhour;
		this.content = content;
		this.good = good;
		this.title = title;
		this.themenum = themenum;
		this.regionnum = regionnum;
		this.topimage = topimage;
		this.regionname = regionname;
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
	public String getTopimage() {
		return topimage;
	}
	public void setTopimage(String topimage) {
		this.topimage = topimage;
	}
	public String getRegionname() {
		return regionname;
	}
	public void setRegionname(String regionname) {
		this.regionname = regionname;
	}

	
	
}
