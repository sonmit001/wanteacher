package kr.or.css.dto;

public class Members_DTO {
	private String id;
	private String pwd;
	private String nickname;
	private int age;
	private String gender;
	private String email;
	private String partner;
	private int ruby;
	
	public Members_DTO() {
		super();
	}
	
	public Members_DTO(String id, String pwd, String nickname, int age, String gender, String email, String partner,
			int ruby) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.nickname = nickname;
		this.age = age;
		this.gender = gender;
		this.email = email;
		this.partner = partner;
		this.ruby = ruby;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPartner() {
		return partner;
	}
	public void setPartner(String partner) {
		this.partner = partner;
	}
	public int getRuby() {
		return ruby;
	}
	public void setRuby(int ruby) {
		this.ruby = ruby;
	}
	
	
}
