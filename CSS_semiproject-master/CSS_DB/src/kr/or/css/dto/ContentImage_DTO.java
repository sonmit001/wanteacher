package kr.or.css.dto;

public class ContentImage_DTO {
	private String image;
	private int contentnum;
	private int topimage;
	
	public ContentImage_DTO() {
		super();
	}
	
	public ContentImage_DTO(String image, int contentnum, int topimage) {
		super();
		this.image = image;
		this.contentnum = contentnum;
		this.topimage = topimage;
	}
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getContentnum() {
		return contentnum;
	}
	public void setContentnum(int contentnum) {
		this.contentnum = contentnum;
	}
	public int getTopimage() {
		return topimage;
	}
	public void setTopimage(int topimage) {
		this.topimage = topimage;
	}
	
	
}
