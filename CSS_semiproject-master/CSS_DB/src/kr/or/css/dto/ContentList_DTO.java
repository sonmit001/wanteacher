package kr.or.css.dto;

public class ContentList_DTO {
	private int contentnum;
	private String title;
	private String themename;
	private String regionname;
	
	public ContentList_DTO() {
		super();
	}
	public ContentList_DTO(int contentnum, String title, String themename, String regionname) {
		super();
		this.contentnum = contentnum;
		this.title = title;
		this.themename = themename;
		this.regionname = regionname;
	}
	
	public int getContentnum() {
		return contentnum;
	}
	public void setContentnum(int contentnum) {
		this.contentnum = contentnum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getThemename() {
		return themename;
	}
	public void setThemename(String themename) {
		this.themename = themename;
	}
	public String getRegionname() {
		return regionname;
	}
	public void setRegionname(String regionname) {
		this.regionname = regionname;
	}
	
	
	
	
}
