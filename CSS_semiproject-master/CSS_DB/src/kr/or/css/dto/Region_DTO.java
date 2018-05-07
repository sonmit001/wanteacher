package kr.or.css.dto;

public class Region_DTO {
	private int regionnum;
	private String regionname;
	
	public Region_DTO() {
		super();
	}

	public Region_DTO(int regionnum, String regionname) {
		super();
		this.regionnum = regionnum;
		this.regionname = regionname;
	}
	
	public int getRegionnum() {
		return regionnum;
	}
	
	public void setRegionnum(int regionnum) {
		this.regionnum = regionnum;
	}
	
	public String getRegionname() {
		return regionname;
	}
	
	public void setRegionname(String regionname) {
		this.regionname = regionname;
	}

	
	
	
}
