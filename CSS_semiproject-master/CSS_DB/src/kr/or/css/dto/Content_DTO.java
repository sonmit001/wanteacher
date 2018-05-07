package kr.or.css.dto;

public class Content_DTO {
	private int contentnum;
	private int expectedhour;
	private String content;
	private int good;
	private String title;
	private int themenum;
	private int regionnum;
	
	public Content_DTO() {
		super();
	}

	public Content_DTO(int contentnum, int expectedhour, String content, int good, String title, int themenum,
			int regionnum) {
		super();
		this.contentnum = contentnum;
		this.expectedhour = expectedhour;
		this.content = content;
		this.good = good;
		this.title = title;
		this.themenum = themenum;
		this.regionnum = regionnum;
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
	public int getgood() {
		return good;
	}
	public void setgood(int good) {
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
