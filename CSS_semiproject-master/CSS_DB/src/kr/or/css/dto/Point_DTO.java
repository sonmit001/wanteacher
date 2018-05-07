package kr.or.css.dto;

public class Point_DTO {
	private String id;
	private int contentnum;
		
	public Point_DTO() {
		super();
	}
	public Point_DTO(String id, int contentnum) {
		super();
		this.id = id;
		this.contentnum = contentnum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getContentnum() {
		return contentnum;
	}
	public void setContentnum(int contentnum) {
		this.contentnum = contentnum;
	}
	
	
}
