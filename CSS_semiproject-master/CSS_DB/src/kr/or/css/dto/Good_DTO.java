package kr.or.css.dto;

public class Good_DTO {
	private int contentnum;
	private String id;
	
	public Good_DTO() {
		super();
	}
	
	public Good_DTO(int contentnum, String id) {
		super();
		this.contentnum = contentnum;
		this.id = id;
	}
	
	public int getContentnum() {
		return contentnum;
	}
	public void setContentnum(int contentnum) {
		this.contentnum = contentnum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
	
	
}
