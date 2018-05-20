package kr.or.bit.dto;

public class fileDTO {
	String fileName;
	String fileRealName;
	
	public fileDTO(String fileName, String fileRealName) {
		super();
		this.fileName = fileName;
		this.fileRealName = fileRealName;
	}
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileRealName() {
		return fileRealName;
	}
	public void setFileRealName(String fileRealName) {
		this.fileRealName = fileRealName;
	}
	

}
