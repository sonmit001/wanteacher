package kr.or.css.dto;

public class ContentReview_DTO {
	private String nickname;
	private String reviewcontent;
	
	public ContentReview_DTO() {
		super();
	}
	public ContentReview_DTO(String nickname, String reviewcontent) {
		super();
		this.nickname = nickname;
		this.reviewcontent = reviewcontent;
	}
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getReviewcontent() {
		return reviewcontent;
	}
	public void setReviewcontent(String reviewcontent) {
		this.reviewcontent = reviewcontent;
	}
	
	
	
}
