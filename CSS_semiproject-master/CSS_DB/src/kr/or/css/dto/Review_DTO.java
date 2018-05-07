package kr.or.css.dto;

public class Review_DTO {
	private int contentnum;
	private String id;
	private String reviewcontent;
	
	public Review_DTO() {
		super();
	}
	public Review_DTO(int contentnum, String id, String reviewcontent) {
		super();
		this.contentnum = contentnum;
		this.id = id;
		this.reviewcontent = reviewcontent;
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
	public String getReviewcontent() {
		return reviewcontent;
	}
	public void setReviewcontent(String reviewcontent) {
		this.reviewcontent = reviewcontent;
	}
	
}
