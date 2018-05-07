package kr.or.css.dto;

public class Partner_DTO {
	
	private String id;
	private String candidate;
	
	public Partner_DTO() {
		super();
	}
	
	public Partner_DTO(String id, String candidate) {
		super();
		this.id = id;
		this.candidate = candidate;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getCandidate() {
		return candidate;
	}
	
	public void setCandidate(String candidate) {
		this.candidate = candidate;
	}
	
}
